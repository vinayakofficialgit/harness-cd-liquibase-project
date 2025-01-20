##install dotnet core 6.0

sudo snap install dotnet-sdk --classic
dotnet restore 
dotnet build
dotnet run  --framework=net8.0
