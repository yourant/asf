using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ASF.Application.DTO;
using ASF.DependencyInjection;
using ASF.Domain.Entities;
using ASF.Domain.Services;
using ASF.Infrastructure.Repositories;
using ASF.Internal.Results;
using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.DependencyInjection;

namespace ASF.Application
{
  /// <summary>
  /// api 控制器 只有超级管理员才有权限控制
  /// </summary>
  [Authorize(Roles="superadmin")]
  [Route("[controller]/[action]")]
  public class ApiController: ControllerBase
  {
    private readonly IServiceProvider _serviceProvider;
    private readonly IMapper _mapper;
    public ApiController(IServiceProvider serviceProvider,IMapper mapper)
    {
      _serviceProvider = serviceProvider;
      _mapper = mapper;
    }
    /// <summary>
    /// 获取权限功能分页
    /// </summary>
    /// <param name="dto"></param>
    /// <returns></returns>
    [HttpGet]
    public async Task<ResultPagedList<PermissionApiResponseDto>> GetList([FromQuery] PermissionApiRequestDto dto)
    {
      var data = await _serviceProvider.GetRequiredService<ApiService>().GetList(dto.PageNo, dto.PageSize, dto.PermissionId,
        dto.Type, dto.Status, dto.Name, dto.HttpMethod, dto.Path);
      if (!data.Success)
        return ResultPagedList<PermissionApiResponseDto>.ReFailure(data.Message, data.Status);
      return ResultPagedList<PermissionApiResponseDto>.ReSuccess(_mapper.Map<List<PermissionApiResponseDto>>(data.Data),data.TotalCount);
    }
    /// <summary>
    /// 创建功能权限
    /// </summary>
    /// <param name="dto"></param>
    /// <returns></returns>
    [HttpPost]
    public async Task<Result> Create([FromBody] PermissionApiCreateRequestDto dto)
    {
      return await _serviceProvider.GetRequiredService<ApiService>().Create(_mapper.Map<Api>(dto));
    }
    /// <summary>
    /// 修改功能权限
    /// </summary>
    /// <param name="dto"></param>
    /// <returns></returns>
    [HttpPut]
    public async Task<Result> Modify([FromBody] PermissionApiModifyRequestDto dto)
    {
      return await _serviceProvider.GetRequiredService<ApiService>().Modify(_mapper.Map<Api>(dto));
    }
  }
}