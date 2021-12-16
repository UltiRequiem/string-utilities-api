﻿FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["StringUtilitiesAPI.csproj", "./"]
RUN dotnet restore "StringUtilitiesAPI.csproj"
COPY . .
WORKDIR "/src/"
RUN dotnet build "StringUtilitiesAPI.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "StringUtilitiesAPI.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "StringUtilitiesAPI"]
