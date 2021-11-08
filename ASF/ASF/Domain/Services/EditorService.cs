using System.Collections.Generic;
using System.IO;
using System.Threading.Tasks;
using ASF.Application.DTO.Editor;
using ASF.Domain.Entities;
using ASF.Infrastructure.Repositories;
using ASF.Internal.Results;
using ASF.Internal.Security;
using AutoMapper;
using HtmlAgilityPack;
using Microsoft.Extensions.Logging;
using System;
namespace ASF.Domain.Services
{
  /// <summary>
  /// 富文本编辑服务
  /// </summary>
  public class EditorService
  {
    private readonly IEditorRepository _editorRepository;
    private readonly IConcatRepositories _concatRepositories;
    private readonly IMapper _mapper;
    private readonly ILogger<EditorService> _logger;
    /// <summary>
    /// 富文本编辑服务
    /// </summary>
    /// <param name="editorRepository"></param>
    /// <param name="mapper"></param>
    /// <param name="logger"></param>
    /// <param name="concatRepositories"></param>
    public EditorService(IEditorRepository editorRepository, IConcatRepositories concatRepositories, IMapper mapper, ILogger<EditorService> logger)
    {
      _editorRepository = editorRepository;
      _concatRepositories = concatRepositories;
      _mapper = mapper;
      _logger = logger;
    }
    /// <summary>
    /// 获取富文本分页列表
    /// </summary>
    /// <param name="pageNo"></param>
    /// <param name="pageSize"></param>
    /// <param name="name"></param>
    /// <param name="type"></param>
    /// <returns></returns>
    public async Task<(IList<Editor> list, int total)> GetList(int pageNo, int pageSize, string name, int? type)
    {
      if (!string.IsNullOrEmpty(name) || type != null)
      {
        return await _editorRepository.GetEntitiesForPaging(pageNo, pageSize, f => f.Name.Equals(name) || f.Type == type);
      }
      else
      {
        return await _editorRepository.GetEntitiesForPaging(pageNo, pageSize, f => f.Id != 0);
      }
    }
    /// <summary>
    /// 获取富文本内容
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    public async Task<Result<EditorResponseDto>> GetEditor(long id)
    {
      Editor editor = await _editorRepository.GetEntity(f => f.Id == id);
      if (editor == null)
        return Result<EditorResponseDto>.ReFailure("没有这个富文本", 1000);
      return Result<EditorResponseDto>.ReSuccess(_mapper.Map<EditorResponseDto>(editor));
    }

    /// <summary>
    /// 获取富文本标题列表
    /// </summary>
    /// <returns></returns>
    public async Task<ResultList<EditorTitleListResponseDto>> GetLists()
    {
      IEnumerable<Editor> list = await _editorRepository.GetEntities(f => f.Id != 0);
      if (list == null)
        return ResultList<EditorTitleListResponseDto>.ReSuccess(new List<EditorTitleListResponseDto>());
      return ResultList<EditorTitleListResponseDto>.ReSuccess(_mapper.Map<List<EditorTitleListResponseDto>>(list));
    }
    /// <summary>
    /// 添加富文本网站内容
    /// </summary>
    /// <param name="dto"></param>
    /// <returns></returns>
    public async Task<Result> Create(AddEditorRequestDto dto)
    {
      // var a = dto.OldContent.Replace($"<meta name=\"keywords\" content=\"\">", "").Replace($"<meta name=\"description\" content=\"\">", "");
      if (await _editorRepository.GetEntity(f => f.Path.Equals(dto.Path)) != null)
        return Result.ReFailure("不能存在相同的页面路径,否则会覆盖原始模版页面,请修改页面路径", 3006);
      Editor editor = _mapper.Map<Editor>(dto);
      bool isAdd = await _editorRepository.Add(editor);
      if (!isAdd)
        return Result.ReFailure("添加内容失败", 1004);
      var htmlDoc = new HtmlDocument();
      htmlDoc.LoadHtml(editor.OldContent);
      if (!string.IsNullOrEmpty(dto.Meta))
      {
        var htmlBody = htmlDoc.DocumentNode.SelectSingleNode("//head");
        HtmlNodeCollection children = new HtmlNodeCollection(htmlBody);
        foreach(var item in dto.Meta.Split(new char[]{','},StringSplitOptions.RemoveEmptyEntries))
        {
          HtmlNode h2Node = HtmlNode.CreateNode(item);
          children.Add(h2Node);
        }
        htmlBody.AppendChildren(children);
      }
      var htmlTitle = htmlDoc.DocumentNode.SelectSingleNode("//title");
      htmlTitle.InnerHtml = editor.Name;
      TextWriter tw = System.IO.File.CreateText(editor.Path);
      htmlDoc.Save(tw);
      return Result.ReSuccess();
    }

    /// <summary>
    /// 修改富文本内容
    /// </summary>
    /// <param name="dto"></param>
    /// <returns></returns>
    public async Task<Result> Modify(ModifyEditorRequestDto dto)
    {
      Editor editor = await _editorRepository.GetEntity(f => f.Id == dto.Id);
      if (editor == null)
        return Result.ReFailure("没有这个富文本内容", 1001);

      editor.NewContent = dto.NewContent;
      editor.Path = dto.Path;
      editor.Name = dto.Name;
      editor.Banner = dto.Banner.WriteFromObject<Banner>();
      bool isUpdate = await _editorRepository.Update(editor);
      var htmlDoc = new HtmlDocument();
      htmlDoc.LoadHtml(editor.NewContent);
      if (!string.IsNullOrEmpty(dto.Meta))
      {
        var htmlBody = htmlDoc.DocumentNode.SelectSingleNode("//head");
        HtmlNodeCollection children = new HtmlNodeCollection(htmlBody);
        foreach(var item in dto.Meta.Split(new char[]{','},StringSplitOptions.RemoveEmptyEntries))
        {
          HtmlNode h2Node = HtmlNode.CreateNode(item);
          children.Add(h2Node);
        }
        htmlBody.AppendChildren(children);
      }
      var htmlTitle = htmlDoc.DocumentNode.SelectSingleNode("//title");
      htmlTitle.InnerHtml = editor.Name;
      TextWriter tw = System.IO.File.CreateText(editor.Path);
      htmlDoc.Save(tw);
      return Result.ReSuccess();

      // bool isModify = await _editorRepository.Update(editor);
      // if(!isModify)
      // 	return Result.ReFailure("修改富文本内容失败",2001);
      // return Result.ReSuccess();
    }
    /// <summary>
    /// 获取咨询列表
    /// </summary>
    /// <param name="pageNo"></param>
    /// <param name="pageSize"></param>
    /// <returns></returns>
    public async Task<ResultPagedList<ConcatResponseDto>> GetConcatList(int pageNo, int pageSize)
    {
      var (data, totalCount) = await _concatRepositories.GetEntitiesForPaging(pageNo, pageSize, f => f.Id != 0);
      return ResultPagedList<ConcatResponseDto>.ReSuccess(_mapper.Map<List<ConcatResponseDto>>(data), totalCount);
    }
    /// <summary>
    /// 提交咨询内容
    /// </summary>
    /// <param name="concat"></param>
    /// <returns></returns>
    public async Task<Result> Concat(Concat concat)
    {
      bool isAdd = await _concatRepositories.Add(concat);
      if (!isAdd)
        return Result.ReFailure("提交失败", 2004);
      return Result.ReSuccess();
    }
    // /// <summary>
    // /// 发送短信
    // /// </summary>
    // public async Task SendPhone()
    // {
    // 	var generatorId = new Random().Next(0,1023);
    // 	// Let's say we take april 1st 2015 as our epoch
    // 	var epoch = new DateTime(2020, 4, 1, 0, 0, 0, DateTimeKind.Utc);
    // 	// Create a mask configuration of 45 bits for timestamp, 2 for generator-id 
    // 	// and 16 for sequence
    // 	var mc = new IdStructure(41, 10, 12);
    // 	// Create an IdGenerator with it's generator-id set to 0, our custom epoch 
    // 	// and mask configuration
    // 	IdGeneratorOptions options = new IdGeneratorOptions(mc,new DefaultTimeSource(epoch));
    // 	var generator = new IdGenerator(generatorId, options);
    // 	//地址
    // 	string sendUrl = "https://erp.gerpgo.com/api/oauth/anno/registerCaptcha";
    // 	//随机的手机号码
    // 	string[] phoneList = new string[]
    // 	{
    // 		"130", "131", "132", "133", "134", "135", "136", "137", "138", "139", "151", "152", "153", "153", "154", "155",
    // 		"156", "157", "158", "159"
    // 	};
    // 	for (int i = 0; i < phoneList.Length; i++)
    // 	{
    // 		long genid = generator.CreateId();
    // 		string[] phone = new[] { genid.ToString().Substring(0, 8),genid.ToString().Substring(8, 8) };
    // 		for (int j = 0; j < phone.Length; j++)
    // 		{
    // 			string data = phoneList[i] + phone[j];
    // 			using (var http = new HttpClient())
    // 			{
    // 				StringContent httpContent = new StringContent(JsonSerializer.Serialize(new { mobile = data }),
    // 					Encoding.UTF8, "application/json");
    // 				HttpResponseMessage response = await http.PostAsync(new Uri(sendUrl), httpContent);
    // 				if (response.IsSuccessStatusCode)
    // 				{
    // 					Task<string> t = response.Content.ReadAsStringAsync();
    // 					string s = t.Result;
    // 					_logger.LogInformation(s);
    // 				}
    // 				else
    // 				{
    // 					_logger.LogError("发送失败");
    // 				}
    // 			}
    // 		}
    // 	}
    // }
  }
}