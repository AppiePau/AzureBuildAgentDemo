# Build runtime image
FROM mcr.microsoft.com/dotnet/aspnet:9.0
WORKDIR /app
COPY app-release/ ./
RUN rm appsettings.Development.json
RUN apt-get update
## Add libgdiplus for processing images like QR codes.
RUN apt-get install -y libfontconfig1 libgdiplus
EXPOSE 80
#EXPOSE 443
ENTRYPOINT ["dotnet", "backend.dll"]
