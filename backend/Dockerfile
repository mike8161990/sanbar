FROM mcr.microsoft.com/dotnet/core/sdk:3.1-alpine AS build

WORKDIR /app

COPY Sanbar.Api/Sanbar.Api.csproj .
RUN dotnet restore \
    --runtime linux-arm64

COPY Sanbar.Api .
RUN dotnet publish \
    --configuration Release \
    --output out \
    --runtime linux-arm64 \
    --self-contained true \
    --nologo \
    --no-restore \
    -p:PublishSingleFile=true \
    -p:PublishTrimmed=true

# FROM mcr.microsoft.com/dotnet/core/aspnet:3.1-alpine-arm64v8
FROM mcr.microsoft.com/dotnet/core/aspnet:3.1-focal-arm64v8

WORKDIR /app

COPY --from=build /app/out/. .
# ENTRYPOINT [ "ls" ]
CMD [ "./Sanbar.Api" ]
# ENTRYPOINT ["dotnet", "Sanbar.Api.dll"]
