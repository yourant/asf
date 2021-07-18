using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ASF.Application.DTO;
using ASF.Domain;
using ASF.Domain.Entities;
using ASF.Domain.Services;
using ASF.Internal.Results;
using ASF.Internal.Utils;
using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.DependencyInjection;

namespace ASF.Application
{
  /// <summary>
  /// api 控制器 只有超级管理员才有权限控制
  /// </summary>
  [Authorize]
  [Route("[controller]/[action]")]
  public class ApiController: ControllerBase
  {
    private readonly IServiceProvider _serviceProvider;
    private readonly IMapper _mapper;
    /// <summary>
    /// api 控制器
    /// </summary>
    /// <param name="serviceProvider"></param>
    /// <param name="mapper"></param>
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
    public async Task<ResultPagedList<PermissionApiResponseDto>> GetList([FromQuery] PermissionApiListRequestDto dto)
    {
      if(!HttpContext.User.IsSuperRole())
        return ResultPagedList<PermissionApiResponseDto>.ReFailure(ResultCodes.RoleNotSuperFailed);
      var (list,total) = await _serviceProvider.GetRequiredService<ApiService>().GetList(dto.PageNo, dto.PageSize, dto.PermissionId,
        dto.Type, dto.Status, dto.Name, dto.HttpMethod, dto.Path);
      return ResultPagedList<PermissionApiResponseDto>.ReSuccess(_mapper.Map<List<PermissionApiResponseDto>>(list),total);
    }
    /// <summary>
    /// 获取权限功能api详情
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    [HttpGet]
    public async Task<Result<PermissionApiResponseDto>> Details([FromQuery] long id)
    {
      if(!HttpContext.User.IsSuperRole())
        return Result<PermissionApiResponseDto>.ReFailure(ResultCodes.RoleNotSuperFailed);
      var result = await _serviceProvider.GetRequiredService<ApiService>().Get(id);
      if(!result.Success)
        return Result<PermissionApiResponseDto>.ReFailure(result.Message,result.Status);
      return Result<PermissionApiResponseDto>.ReSuccess(_mapper.Map<PermissionApiResponseDto>(result.Data));
    }

    /// <summary>
    /// 创建功能权限
    /// </summary>
    /// <param name="dto"></param>
    /// <returns></returns>
    [HttpPost]
    public async Task<Result> Create([FromBody] PermissionApiCreateRequestDto dto)
    {
      if(!HttpContext.User.IsSuperRole())
        return Result.ReFailure(ResultCodes.RoleNotSuperFailed);
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
      if(!HttpContext.User.IsSuperRole())
        return Result.ReFailure(ResultCodes.RoleNotSuperFailed);
      var server = _serviceProvider.GetRequiredService<ApiService>();
      var result = await server.Get(dto.Id);
      if(!result.Success)
        return Result.ReFailure(result.Message,result.Status);
      return await _serviceProvider.GetRequiredService<ApiService>().Modify(_mapper.Map(dto,result.Data));
    }
    /// <summary>
    /// 是否禁用功能权限
    /// </summary>
    /// <param name="dto"></param>
    /// <returns></returns>
    [HttpPut]
    public async Task<Result> ModifyStatus([FromBody] ModifyStatusRequestDto dto)
    {
      if(!HttpContext.User.IsSuperRole())
        return Result.ReFailure(ResultCodes.RoleNotSuperFailed);
      var server = _serviceProvider.GetRequiredService<ApiService>();
      var result = await server.Get(dto.Id);
      if(!result.Success)
        return Result.ReFailure(result.Message,result.Status);
      
      result.Data.Status = dto.Status;
      return await _serviceProvider.GetRequiredService<ApiService>().Modify(result.Data);
    }
    /// <summary>
    /// 删除单个api
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    [HttpPost("{id}")]
    public async Task<Result> Delete([FromRoute] long id)
    {
      if(!HttpContext.User.IsSuperRole())
        return Result.ReFailure(ResultCodes.RoleNotSuperFailed);
      var server = _serviceProvider.GetRequiredService<ApiService>();
      var result = await server.Get(id);
      if (!result.Success)
        return result;
      return await server.Delete(result.Data);
    }
    /// <summary>
    /// 批量删除权限功能api
    /// </summary>
    /// <param name="dto"></param>
    /// <returns></returns>
    [HttpPost]
    public async Task<Result> BatchDelete([FromBody] IdArrayRequestDto<long> dto)
    {
      if(!HttpContext.User.IsSuperRole())
        return Result.ReFailure(ResultCodes.RoleNotSuperFailed);
      var server = _serviceProvider.GetRequiredService<ApiService>();
      var result = await server.GetList(dto.Ids);
      if(!result.Success)
        return Result.ReFailure(result.Message,result.Status);
      // 当找到的是系统权限就不删除并返回错误
      if(!result.Data.Any())
        return Result.ReFailure(ResultCodes.PermissionSysApiDeleteError);
      return await server.BatchDelete(result.Data.ToList());
    }
  }
}