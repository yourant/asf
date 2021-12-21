FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 80

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["ASF.Web/ASF.Web.csproj", "ASF.Web/"]
COPY ["ASF.EntityFramework.Storage/ASF.EntityFramework.Storage.csproj", "ASF.EntityFramework.Storage/"]
COPY ["ASF/ASF.csproj", "ASF/"]
RUN dotnet restore "ASF.Web/ASF.Web.csproj"
COPY . .
WORKDIR "/src/ASF.Web"
RUN dotnet build "ASF.Web.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "ASF.Web.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "ASF.Web.dll"]
