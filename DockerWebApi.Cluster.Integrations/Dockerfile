FROM microsoft/dotnet:2.1-sdk-nanoserver-1709 AS build
WORKDIR integrations

COPY DockerWebApi.Cluster.Integrations.csproj ./DockerWebApi.Cluster.Integrations/
RUN dotnet restore DockerWebApi.Cluster.Integrations/DockerWebApi.Cluster.Integrations.csproj

COPY . .

ENTRYPOINT ["dotnet", "test"]