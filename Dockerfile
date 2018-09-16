#FROM microsoft/dotnet:2.1-aspnetcore-runtime-nanoserver-1709 AS base
#Use in teamcity

FROM microsoft/dotnet:2.1-sdk-nanoserver-1709 AS build
WORKDIR src

COPY DockerWebApi.Cluster/DockerWebApi.Cluster.csproj ./DockerWebApi.Cluster/
RUN dotnet restore DockerWebApi.Cluster/DockerWebApi.Cluster.csproj

COPY DockerWebApi.Cluster.Tests/DockerWebApi.Cluster.Tests.csproj ./DockerWebApi.Cluster.Tests/
RUN dotnet restore DockerWebApi.Cluster.Tests/DockerWebApi.Cluster.Tests.csproj

COPY . .

RUN dotnet test DockerWebApi.Cluster.Tests/DockerWebApi.Cluster.Tests.csproj

FROM build as publish
RUN dotnet publish DockerWebApi.Cluster/DockerWebApi.Cluster.csproj -o /publish

FROM microsoft/dotnet:2.1-aspnetcore-runtime-nanoserver-1709 AS final

WORKDIR /app
COPY --from=publish /publish .
ENTRYPOINT ["dotnet", "DockerWebApi.Cluster.dll"]