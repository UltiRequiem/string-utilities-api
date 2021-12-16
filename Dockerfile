FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["string-utilities-api.csproj", "./"]
RUN dotnet restore "string-utilities-api.csproj"
COPY . .
WORKDIR "/src/"
RUN dotnet build "string-utilities-api.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "string-utilities-api.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "string-utilities-api.dll"]
