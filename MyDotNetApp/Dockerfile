# Use the official .NET image
FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 80

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["MyDotNetApp/MyDotNetApp.csproj", "MyDotNetApp/"]
RUN dotnet restore "MyDotNetApp/MyDotNetApp.csproj"
COPY . .
WORKDIR "/src/MyDotNetApp"
RUN dotnet build "MyDotNetApp.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "MyDotNetApp.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "MyDotNetApp.dll"]
