FROM mcr.microsoft.com/dotnet/core/sdk:3.1-alpine AS build

WORKDIR /app

COPY *.csproj .
RUN dotnet restore -r linux-arm64

COPY . .
RUN dotnet publish -c Release -o out -r linux-arm64

FROM mcr.microsoft.com/dotnet/core/aspnet:3.1-buster-slim-arm64v8

WORKDIR /app

COPY --from=build /app/out .
ENTRYPOINT ["dotnet", "Sanbar.Api.dll"]
