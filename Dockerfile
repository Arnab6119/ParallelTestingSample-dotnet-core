FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /app
COPY . .
RUN dotnet restore /app/SliceTests/SliceTests.csproj
RUN dotnet build SliceTests/SliceTests.csproj -c Release -o /app/build


FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS run
WORKDIR /app
COPY --FROM=build /app/build .
ENTRYPOINT ["dotnet" , "SliceTests.dll"]
EXPOSE 80
