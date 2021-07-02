using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using ASF.Application.DTO.Center;
using ASF.Domain.Entities.Center;
using ASF.Domain.Services;
using ASF.Domain.Values;
using ASF.Internal.Results;
using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.DependencyInjection;

namespace ASF.Application
{
	/// <summary>
	/// center 管理
	/// </summary>
	[Authorize]
	[Route("[controller]/[action]")]
	public class CenterController: ControllerBase
	{
		private readonly IServiceProvider _serviceProvider;
		private readonly IMapper _mapper;
		/// <summary>
		/// center 管理
		/// </summary>
		public CenterController(IServiceProvider serviceProvider,IMapper mapper)
		{
			_serviceProvider = serviceProvider;
			_mapper = mapper;
		}
		/// <summary>
		/// 获取账户列表
		/// </summary>
		/// <param name="dto"></param>
		/// <returns></returns>
		[HttpGet]
		public async Task<ResultPagedList<CenterAccountResponseDto>> GetAccountList([FromQuery] CenterAccountListRequestDto dto)
		{
			var (list, total) = await _serviceProvider.GetRequiredService<CenterService>().GetAccountList(dto.PageNo,dto.PageSize,dto.Name);
			return ResultPagedList<CenterAccountResponseDto>.ReSuccess(_mapper.Map<List<CenterAccountResponseDto>>(list),total);
		}
		/// <summary>
		/// 添加账户
		/// </summary>
		/// <param name="dto"></param>
		/// <returns></returns>
		[HttpPost]
		public async Task<Result> AddAccount([FromBody] AddCenterAccountRequestDto dto)
		{
			var service = _serviceProvider.GetRequiredService<CenterService>();
			return await service.AddAccount(_mapper.Map<CenterAccount>(dto));
		}
		/// <summary>
		/// 修改账户
		/// </summary>
		/// <param name="dto"></param>
		/// <returns></returns>
		[HttpPost]
		public async Task<Result> ModifyAccount([FromBody] ModifyCenterAccountRequestDto dto)
		{
			var service = _serviceProvider.GetRequiredService<CenterService>();
			var result = await service.GetAccount((long)dto.AccountId);
			if (!result.Success)
				return Result.ReFailure(result.Message, result.Status);
			return await service.ModifyAccount(_mapper.Map(dto,result.Data));
		}

		/// <summary>
		/// 获取商户列表
		/// </summary>
		/// <param name="dto"></param>
		/// <returns></returns>
		[HttpGet]
		public async Task<ResultPagedList<CenterShopResponseDto>> GetShopList([FromQuery] CenterShopListRequestDto dto)
		{
			var (list, total) = await _serviceProvider.GetRequiredService<CenterService>()
				.GetShopList(dto.PageNo, dto.PageSize, dto.Name);
			return ResultPagedList<CenterShopResponseDto>.ReSuccess(_mapper.Map<List<CenterShopResponseDto>>(list),total);
		}
		/// <summary>
		/// 获取应用列表
		/// </summary>
		/// <param name="dto"></param>
		/// <returns></returns>
		[HttpGet]
		public async Task<ResultPagedList<CenterProgramResponseDto>> GetProgramList(
			[FromQuery] CenterProgramListRequestDto dto)
		{
			var (list, total) = await _serviceProvider.GetRequiredService<CenterService>()
				.GetProgramList(dto.PageNo, dto.PageSize, dto.Name);
			return ResultPagedList<CenterProgramResponseDto>.ReSuccess(_mapper.Map<List<CenterProgramResponseDto>>(list),total);
		}
		/// <summary>
		/// 修改账户状态
		/// </summary>
		/// <param name="dto"></param>
		/// <returns></returns>
		[HttpPut]
		public async Task<Result> ModifyStatus([FromBody] ModifyStatusRequestDto dto)
		{
			var service = _serviceProvider.GetRequiredService<CenterService>();
			var result = await service.GetAccount(dto.Id);
			if (!result.Success)
				return result;
			
			int status = (int)dto.Status;
			//判断修改的账户状态类型
			if (dto.Type == ModifyAccountType.Enable)
				result.Data.IsEnable = Convert.ToBoolean(status);
			if (dto.Type == ModifyAccountType.IsPlatform)
				result.Data.IsPlatform = Convert.ToBoolean(status);
			if (dto.Type == ModifyAccountType.IsVisual)
				result.Data.IsVisual = Convert.ToBoolean(status);
			if (dto.Type == ModifyAccountType.AllowCashOut)
				result.Data.AllowCashOut = Convert.ToBoolean(status);
			if (dto.Type == ModifyAccountType.AllowCashIn)
				result.Data.AllowCashIn = Convert.ToBoolean(status);
			if (dto.Type == ModifyAccountType.AutoCashOut)
				result.Data.AutoCashOut = Convert.ToBoolean(status);
			if (dto.Type == ModifyAccountType.PayTypeEnable)
				result.Data.PayTypeEnable = status;
			return await service.ModifyStatus(result.Data);
		}
	}
}