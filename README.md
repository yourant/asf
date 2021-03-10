### 多租户集成平台
> 何为多租户。打个比方，例如一个医院。有总院，总院下面有无数个子院，子院下面的人员或部门可能角色权限相同，但是所属子院不同，为了起到**数据隔离**作用就需要引入租户概念，每个子院相当于是个租户。（比如a子院有门诊部,b也有）但是除了总院，不能让a子院访问b子院门诊的数据吧。反之亦然; 作用就起为了数据隔离

- 支持多租户
- 支持接口权限，细分到按钮权限
- 支持微服务。就是例如 empi 作为一个服务。可以启动多个实例，
- 利用consul服务发现与治理支持分布式微服务，对服务是否正常运作检查，例如empi作为服务如果部署了两个实例，当其中某一个发生错误崩溃了，就把请求到另外一个上面去，(有两种方式，一种轮询法，一种空闲优先法);
- 集成支持对服务熔断,降级，鉴权，限流,
- 支持对租户部门，岗位以及定时任务管理
- 集成用户服务,用户 rbac 权限管理
- jwt token 方式验证api
- 支持单点登录(同一个用户只能在一个地方登录)
- 支持对外开放查询接口
# 如何部署
一. 安装docker 环境。在docker 里面执行 `docker run -d -p 8500:8500 -p 8600:8600 -p 8600:8600/udp -p 8300:8300 -p 8301:8301 -p 8301:8301/udp -p 8302:8302 -p 8302:8302/udp consul agent -server -bootstrap -ui -client=0.0.0.0` 命令安装consul开启服务发现与治理。
二. 打开项目 Scheduling， 配置 `appsettings.json` 里面的 `HealthServices` 填入你需要接入api服务的 地址以及端口，同一服务多个实例要端口或地址不一样， name要一致；配置好之后运行项目；
三. 项目种的任意一个测试api项目并运行，然后打开 浏览器输入如下地址 `http://localhost:8500/ui/dc1/services` 就会发现测试api服务已经被consul发现了。
四. 打开 asf项目.在 `ocelot.json` 配置需要转发服务的地址，服务名,服务实例地址以及端口， 负载均衡策略， consul地址等等后,开始启动项目，在服务api 上下个断点，然后在postman 上请求就能看见对应的请求已经负载均衡转发到对应服务上了;
#### ocelot.json配置详解

``` json
{
  // 服务路由配置
  "Routes": [
    {
      "UseServiceDiscovery": true, //服务是否开启负载均衡
      "UpstreamPathTemplate": "/api/{url}", // postman 或ajax 请求到服务地址
	  // 允许请求的方式
      "UpstreamHttpMethod": [ 
        "Get",
        "Post",
        "Put",
        "Delete"
      ],
      "ServiceName": "TestService", //服务名要与consul中的配置一致
      "DownstreamPathTemplate": "/{url}", // 服务api中的地址一般保持这种默认就行
      "DownstreamScheme": "http",
	  // 配置接入服务jwt 鉴权
//       "AuthenticationOptions": {
//         "AuthenticationProviderKey": "Bearer"
//       },
       // 	负载均衡方式
      "LoadBalancerOptions": {
//        "Type": "RoundRobin" //轮询法
        "Type": "LeastConnection" // 空闲服务优先
      },
	  // 接口服务地址与端口，如果一个服务有多个就可以配置多个
      "DownstreamHostAndPorts": [
        {
          "Host": "127.0.0.1",// 本地连接地址
          "Port": 5001 //本地连接端口
        },{
          "Host": "127.0.0.1",// 本地连接地址
          "Port": 5002 //本地连接端口
        }
      ]
    }
  ],
  // 全局配置
  "GlobalConfiguration": {
    //"BaseUrl": "https://api.mybusiness.com"
	//负载均衡连接 consul 配置，对服务进行发现.
    "ServiceDiscoveryProvider": {
      "Scheme": "http",
      "Host": "127.0.0.1",
      "Port": 8500,
      "Type": "Consul"
    }
  }
}
```

### End
