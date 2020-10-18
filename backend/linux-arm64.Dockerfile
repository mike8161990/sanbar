FROM mcr.microsoft.com/dotnet/core/sdk:3.1-alpine AS build

WORKDIR /app

COPY Sanbar.Api/Sanbar.Api.csproj Sanbar.Api/Sanbar.Api.csproj
RUN dotnet restore Sanbar.Api \
    --runtime linux-arm64

COPY Sanbar.Api Sanbar.Api
RUN dotnet publish Sanbar.Api \
    --no-restore \
    --nologo \
    --configuration Release \
    --output out \
    --runtime linux-arm64

FROM mcr.microsoft.com/dotnet/core/aspnet:3.1-focal-arm64v8 AS run

WORKDIR /app

COPY --from=build /app/out .
CMD ["dotnet", "Sanbar.Api.dll"]
