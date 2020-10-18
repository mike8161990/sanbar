FROM mcr.microsoft.com/dotnet/core/sdk:3.1-alpine AS build

WORKDIR /app

COPY Sanbar.Api/Sanbar.Api.csproj Sanbar.Api/Sanbar.Api.csproj
RUN dotnet restore Sanbar.Api \
    --runtime linux-x64

COPY Sanbar.Api Sanbar.Api
RUN dotnet publish Sanbar.Api \
    --no-restore \
    --nologo \
    --configuration Release \
    --output out \
    --runtime linux-x64

FROM mcr.microsoft.com/dotnet/core/aspnet:3.1-focal AS run

WORKDIR /app

COPY --from=build /app/out .
CMD ["dotnet", "Sanbar.Api.dll"]
