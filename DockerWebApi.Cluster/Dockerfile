FROM microsoft/dotnet:2.1-aspnetcore-runtime-nanoserver-1709 AS base
WORKDIR /app
EXPOSE 51950
EXPOSE 44306

FROM microsoft/dotnet:2.1-sdk-nanoserver-1709 AS build
WORKDIR /src

COPY DockerWebApi.Cluster/DockerWebApi.Cluster.csproj ./DockerWebApi.Cluster/
RUN dotnet restore DockerWebApi.Cluster/DockerWebApi.Cluster.csproj

COPY . ./DockerWebApi.Cluster/
WORKDIR /src/DockerWebApi.Cluster
RUN dotnet build DockerWebApi.Cluster.csproj -c Release -o /app

FROM build AS publish
RUN dotnet publish DockerWebApi.Cluster.csproj -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "DockerWebApi.Cluster.dll"]
