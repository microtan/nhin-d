; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
ArchitecturesInstallIn64BitMode=x64 ia64
AppId={{995D337A-5620-4537-9704-4B19EC628A39}
AppName=Direct Project .NET Gateway
AppVerName=Direct Project .NET Gateway 1.0.0.2
AppPublisher=The Direct Project (nhindirect.org)
AppPublisherURL=http://nhindirect.org
AppSupportURL=http://nhindirect.org
AppUpdatesURL=http://nhindirect.org
DefaultDirName={pf}\Direct Project .NET Gateway
DefaultGroupName=Direct Project .NET Gateway
AllowNoIcons=yes
OutputDir=.
OutputBaseFilename=DirectGateway-1.0.0.2-NET35
Compression=lzma
SolidCompression=yes
VersionInfoVersion=1.0.0.2

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

;[Components]
;Name: core; Description: "Core Components";
;Name: development; Description: "Development Install";

[Files]
Source: "..\bin\debug\*.dll"; DestDir: "{app}"; Excludes: "security*.dll,xunit*.dll,*tests.dll*"; Flags: ignoreversion;
Source: "..\bin\debug\Win32\smtpEventHandler.dll"; DestDir: "{app}"; Flags: ignoreversion; Check: IsX86;
Source: "..\bin\debug\x64\smtpEventHandler.dll"; DestDir: "{app}"; Flags: ignoreversion; Check: IsX64 or IsIA64;
Source: "..\bin\debug\*.config"; DestDir: "{app}"; Excludes: "*.vshost.*,*.dll.config"; Flags: ignoreversion;
Source: "..\bin\debug\*.exe"; DestDir: "{app}"; Excludes: "*.vshost.*"; Flags: ignoreversion;
Source: "..\bin\debug\Certificates\*"; DestDir: "{app}\Certificates"; Flags: ignoreversion recursesubdirs;
Source: "..\bin\debug\ConfigConsoleSettings.xml"; DestDir: "{app}"; Flags: ignoreversion;

Source: "..\config\service\*.svc"; DestDir: "{app}\ConfigService"; Flags: ignoreversion;
Source: "..\config\service\*.aspx"; DestDir: "{app}\ConfigService"; Flags: ignoreversion;
Source: "..\config\service\*.config"; DestDir: "{app}\ConfigService"; Flags: ignoreversion;
Source: "..\config\service\bin\*.dll"; DestDir: "{app}\ConfigService\bin"; Flags: ignoreversion recursesubdirs;

Source: "configui\*"; DestDir: "{app}\ConfigUI"; Flags: ignoreversion recursesubdirs;

Source: "..\gateway\install\*.vbs"; DestDir: "{app}"; Flags: ignoreversion;
Source: "..\gateway\install\*.bat"; DestDir: "{app}"; Excludes: "backup.bat,copybins.bat"; Flags: ignoreversion;

Source: "..\gateway\devInstall\DevAgentWithServiceConfig.xml"; DestDir: "{app}"; DestName: "DevAgentConfig.xml"; Flags: ignoreversion;
Source: "..\gateway\devInstall\setupdomains.txt"; DestDir: "{app}"; Flags: ignoreversion;
Source: "..\gateway\devInstall\simple.eml"; DestDir: "{app}\Samples"; Flags: ignoreversion;

Source: "..\external\microsoft\vcredist\vcredist_x86.exe"; DestDir: "{app}\Libraries"; DestName: "vcredist.exe"; Flags: ignoreversion recursesubdirs; Check: IsX86;
Source: "..\external\microsoft\vcredist\vcredist_x64.exe"; DestDir: "{app}\Libraries"; DestName: "vcredist.exe"; Flags: ignoreversion recursesubdirs; Check: IsX64 or IsIA64;

Source: "*.bat"; DestDir: "{app}"; Excludes: "build-installer.bat"; Flags: ignoreversion;
Source: "*.ps1"; DestDir: "{app}"; Flags: ignoreversion;
Source: "event-sources.txt"; DestDir: "{app}"; Flags: ignoreversion;
Source: "..\config\store\Schema.sql"; DestDir: "{app}\SQL"; Flags: ignoreversion;
Source: "createuser.sql"; DestDir: "{app}\SQL"; Flags: ignoreversion;

[Icons]
Name: "{group}\Admin Console"; Filename: "{app}\AdminConsole.exe"; WorkingDir: "{app}";
Name: "{group}\Config Console"; Filename: "{app}\ConfigConsole.exe"; WorkingDir: "{app}";
Name: "{group}\Config Web UI"; Filename: "http://localhost/ConfigUI/";
Name: "{group}\Test Database"; Filename: "http://localhost/ConfigService/TestService.aspx";
Name: "{group}\{cm:UninstallProgram,Direct Gateway}"; Filename: "{uninstallexe}";

[Run]
Filename: "{app}\Libraries\vcredist.exe"; Description: "Microsoft Visual C++ 2008 Redistributable Package"; Flags: postinstall runascurrentuser unchecked;
Filename: "{app}\createdatabase.bat"; Parameters: ".\sqlexpress DirectConfig ""{app}\SQL\Schema.sql"" ""{app}\SQL\createuser.sql"""; Description: Install Database; Flags: postinstall runascurrentuser unchecked;
Filename: "{app}\install-dev.bat"; Parameters: """{app}"""; Description: "Install Gateway (DEVELOPMENT VERSION)"; WorkingDir: "{app}"; Flags: postinstall runascurrentuser unchecked;

[UninstallRun]
Filename: "{app}\uninstall.bat"; Flags: runascurrentuser;

[Code]
function IsX64: Boolean;
begin
  Result := Is64BitInstallMode and (ProcessorArchitecture = paX64);
end;

function IsIA64: Boolean;
begin
  Result := Is64BitInstallMode and (ProcessorArchitecture = paIA64);
end;

function IsX86: Boolean;
begin
  Result := (ProcessorArchitecture = paX86);
end;

