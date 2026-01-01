{
Business Source License 1.1

Parameters

Licensor:             InstallAware Software

Licensed Work:        InstallAware (Multi Platform) 2026
                      The Licensed Work is (C) 1996-2026 InstallAware Software

Additional Use Grant: You may make use of the Licensed Work, provided that
                      you may not use the Licensed Work at a Sanctioned Entity.

                      Sanctioned Entities are individuals, organizations, or
                      legal persons who have been formally designated by the
                      Licensor as having materially violated intellectual
                      property rights, breached license terms, or engaged in
                      unethical exploitation of (open-source) technologies,
                      including this software.

                      As of the first publicly available distribution of this
                      specific version of the Licensed Work under this
                      License, the following are designated as Sanctioned
                      Entities:

                      Future US, Inc.
                      L3Harris Technologies, Inc.
                      Unisys Corporation
                      Wolters Kluwer N.V.

                      This includes any individuals, organizations, or
                      entities, acting in any capacity and at any time,
                      either directly or indirectly, on behalf of or under
                      the control and influence of the Sanctioned Entities,
                      such as (but not only) current and future:

                      Subsidiaries
                      Affiliates
                      Contractors
                      Agents
                      Employees
                      Parent companies
                      Acquisitions
                      Assignees
                      Joint Ventures
                      Franchisees
                      
                      Entities may petition the Licensor for removal from the
                      Sanctioned Entities list. Any such removal is at the
                      sole discretion of the Licensor and must be issued in a
                      public update to the Licensed Work under this License
                      as documented in this Additional Use Grant parameter.

Change Date:          2029-12-31

Change License:       GNU Affero General Public License version 3 (AGPLv3)

For information about alternative licensing arrangements for the Software,
please visit: https://www.installaware.com/

Notice

The Business Source License (this document, or the “License”) is not an Open
Source license. However, the Licensed Work will eventually be made available
under an Open Source License, as stated in this License.

License text copyright (c) 2017 MariaDB Corporation Ab, All Rights Reserved.
“Business Source License” is a trademark of MariaDB Corporation Ab.

Terms

The Licensor hereby grants you the right to copy, modify, create derivative
works, redistribute, and make non-production use of the Licensed Work. The
Licensor may make an Additional Use Grant, above, permitting limited
production use.

Effective on the Change Date, or the fourth anniversary of the first publicly
available distribution of a specific version of the Licensed Work under this
License, whichever comes first, the Licensor hereby grants you rights under
the terms of the Change License, and the rights granted in the paragraph
above terminate.

If your use of the Licensed Work does not comply with the requirements
currently in effect as described in this License, you must purchase a
commercial license from the Licensor, its affiliated entities, or authorized
resellers, or you must refrain from using the Licensed Work.

All copies of the original and modified Licensed Work, and derivative works
of the Licensed Work, are subject to this License. This License applies
separately for each version of the Licensed Work and the Change Date may vary
for each version of the Licensed Work released by Licensor.

You must conspicuously display this License on each original or modified copy
of the Licensed Work. If you receive the Licensed Work in original or
modified form from a third party, the terms and conditions set forth in this
License apply to your use of that work.

Any use of the Licensed Work in violation of this License will automatically
terminate your rights under this License for the current and all other
versions of the Licensed Work.

This License does not grant you any right in any trademark or logo of
Licensor or its affiliates (provided that you may use a trademark or logo of
Licensor as expressly required by this License).

TO THE EXTENT PERMITTED BY APPLICABLE LAW, THE LICENSED WORK IS PROVIDED ON
AN “AS IS” BASIS. LICENSOR HEREBY DISCLAIMS ALL WARRANTIES AND CONDITIONS,
EXPRESS OR IMPLIED, INCLUDING (WITHOUT LIMITATION) WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, NON-INFRINGEMENT, AND
TITLE.

MariaDB hereby grants you permission to use this License’s text to license
your works, and to refer to it using the trademark “Business Source License”,
as long as you comply with the Covenants of Licensor below.

Covenants of Licensor

In consideration of the right to use this License’s text and the “Business
Source License” name and trademark, Licensor covenants to MariaDB, and to all
other recipients of the licensed work to be provided by Licensor:

1. To specify as the Change License the GPL Version 2.0 or any later version,
   or a license that is compatible with GPL Version 2.0 or a later version,
   where “compatible” means that software provided under the Change License can
   be included in a program with software provided under GPL Version 2.0 or a
   later version. Licensor may specify additional Change Licenses without
   limitation.

2. To either: (a) specify an additional grant of rights to use that does not
   impose any additional restriction on the right granted in this License, as
   the Additional Use Grant; or (b) insert the text “None”.

3. To specify a Change Date.

4. Not to modify this License in any other way.
}
unit uTahoe;

{$mode objfpc}{$H+}{$J-}
{$IFDEF DARWIN}
{$modeswitch objectivec1}
{$linkframework Cocoa}
{$ENDIF}

interface

{$IFDEF DARWIN}
uses
  SysUtils, Classes, Math, CocoaAll, MacOSAll, BaseUnix, Unix, mUtils;

const
  
  FILENAME_FOLDERCUSTOMICON = 'Icon'#13;  
  FILENAME_VOLUMECUSTOMICON = '.VolumeIcon.icns';

  FI_VAL_CUSTOMICON = $04;
  FI_BYTEOFFSET_CUSTOMICON = 8;

  XATTR_FINDERINFO_NAME = 'com.apple.FinderInfo';
  XATTR_RESOURCEFORK_NAME = 'com.apple.ResourceFork';

  XATTR_NOFOLLOW = $0001;
  XATTR_CREATE = $0002;
  XATTR_REPLACE = $0004;

  ICNS_MAGIC: array[0..3] of Byte = ($69, $63, $6E, $73); 

type
  TCommand = (cmdNone, cmdSet, cmdGet, cmdRemove, cmdTest, cmdRefresh);

  TIconManager = class
  private
    FQuiet: Boolean;
    FForce: Boolean;

    function GetExtendedAttribute(const FilePath, AttrName: string;
                                 out Data: TBytes): Boolean;
    function SetExtendedAttribute(const FilePath, AttrName: string;
                                 const Data: TBytes): Boolean;
    function RemoveExtendedAttribute(const FilePath, AttrName: string): Boolean;
    function ListExtendedAttributes(const FilePath: string): TStringList;
    function GetResourceFork(const FilePath: string; out Data: TBytes): Boolean;
    function SetResourceFork(const FilePath: string; const Data: TBytes): Boolean;
    function HasExtendedAttribute(const FilePath, AttrName: string): Boolean;
    function HasIconData(const FilePath: string): Boolean;
    function IsVolumeMountPoint(const FolderPath: string): Boolean;
    function GetFileWithIconData(const FileOrFolder: string): string;
    function GetTargetType(const FileOrFolder: string): string;
    function FindICNSInResourceFork(const Data: TBytes;
                                   out Offset, Size: Integer): Boolean;
    function IsICNSFile(const FilePath: string): Boolean;
    procedure LogMessage(const Msg: string);
    procedure LogError(const Msg: string);

  public
    constructor Create;

    function SetCustomIcon(const FileOrFolder, ImgFile: string): Boolean;
    function GetCustomIcon(const FileOrFolder, OutFile: string): Boolean;
    function RemoveCustomIcon(const FileOrFolder: string): Boolean;
    function TestForCustomIcon(const FileOrFolder: string): Integer;
    function RefreshAppIcons(const AppDir: string): Integer;
    function RefreshAppIconDirect(const AppDir: string): Boolean;

    property Quiet: Boolean read FQuiet write FQuiet;
    property Force: Boolean read FForce write FForce;
  end;

function getxattr(path: PChar; name: PChar; value: Pointer; size: size_t; position: cuint32; options: cint): ssize_t; cdecl; external 'libc';
function setxattr(path: PChar; name: PChar; value: Pointer; size: size_t; position: cuint32; options: cint): cint; cdecl; external 'libc';
function removexattr(path: PChar; name: PChar; options: cint): cint; cdecl; external 'libc';
function listxattr(path: PChar; namebuf: PChar; size: size_t; options: cint): ssize_t; cdecl; external 'libc';

function FixSquircleJail(Path: String; Force: Boolean): Boolean;

{$ENDIF}

implementation

{$IFDEF DARWIN}

constructor TIconManager.Create;
begin
  inherited Create;
  FQuiet := False;
  FForce := False;
end;

procedure TIconManager.LogMessage(const Msg: string);
begin
  DoDebug(Msg);
end;

procedure TIconManager.LogError(const Msg: string);
begin
  DoDebug('ERROR: ' + Msg);
end;

function TIconManager.GetExtendedAttribute(const FilePath, AttrName: string;
                                          out Data: TBytes): Boolean;
var
  Size: ssize_t;
  PathStr, AttrStr: PChar;
begin
  Result := False;
  SetLength(Data, 0);

  PathStr := PChar(FilePath);
  AttrStr := PChar(AttrName);

  Size := getxattr(PathStr, AttrStr, nil, 0, 0, 0);

  if Size <= 0 then
    Exit;

  SetLength(Data, Size);
  Size := getxattr(PathStr, AttrStr, @Data[0], Size, 0, 0);

  Result := Size > 0;
  if not Result then
    SetLength(Data, 0)
  else if Size < Length(Data) then
    SetLength(Data, Size);
end;

function TIconManager.SetExtendedAttribute(const FilePath, AttrName: string;
                                          const Data: TBytes): Boolean;
var
  PathStr, AttrStr: PChar;
  Res: cint;
begin
  PathStr := PChar(FilePath);
  AttrStr := PChar(AttrName);

  Res := setxattr(PathStr, AttrStr, @Data[0], Length(Data), 0, 0);
  Result := Res = 0;
end;

function TIconManager.RemoveExtendedAttribute(const FilePath, AttrName: string): Boolean;
var
  PathStr, AttrStr: PChar;
  Res: cint;
begin
  PathStr := PChar(FilePath);
  AttrStr := PChar(AttrName);

  Res := removexattr(PathStr, AttrStr, 0);
  Result := Res = 0;
end;

function TIconManager.ListExtendedAttributes(const FilePath: string): TStringList;
var
  PathStr: PChar;
  Size: ssize_t;
  Buffer: PChar;
  P: PChar;
  AttrName: string;
begin
  Result := TStringList.Create;
  PathStr := PChar(FilePath);

  Size := listxattr(PathStr, nil, 0, 0);
  if Size <= 0 then
    Exit;

  GetMem(Buffer, Size);
  try
    Size := listxattr(PathStr, Buffer, Size, 0);
    if Size > 0 then
    begin
      P := Buffer;
      while P < Buffer + Size do
      begin
        AttrName := string(P);
        if AttrName <> '' then
          Result.Add(AttrName);
        Inc(P, Length(AttrName) + 1);
      end;
    end;
  finally
    FreeMem(Buffer);
  end;
end;

function TIconManager.HasExtendedAttribute(const FilePath, AttrName: string): Boolean;
var
  Attrs: TStringList;
begin
  Attrs := ListExtendedAttributes(FilePath);
  try
    Result := Attrs.IndexOf(AttrName) >= 0;
  finally
    Attrs.Free;
  end;
end;

function TIconManager.GetResourceFork(const FilePath: string; out Data: TBytes): Boolean;
var
  ResourcePath: string;
  F: TFileStream;
begin
  Result := False;
  SetLength(Data, 0);

  ResourcePath := FilePath + '/..namedfork/rsrc';

  if not MyFileExists(ResourcePath) then
    Exit;

  try
    F := TFileStream.Create(ResourcePath, fmOpenRead or fmShareDenyNone);
    try
      if F.Size > 0 then
      begin
        SetLength(Data, F.Size);
        F.ReadBuffer(Data[0], F.Size);
        Result := True;
      end;
    finally
      F.Free;
    end;
  except
    Result := False;
  end;
end;

function TIconManager.SetResourceFork(const FilePath: string; const Data: TBytes): Boolean;
var
  ResourcePath: string;
  F: TFileStream;
begin
  Result := False;
  ResourcePath := FilePath + '/..namedfork/rsrc';

  try
    F := TFileStream.Create(ResourcePath, fmCreate);
    try
      if Length(Data) > 0 then
        F.WriteBuffer(Data[0], Length(Data));
      Result := True;
    finally
      F.Free;
    end;
  except
    Result := False;
  end;
end;

function TIconManager.IsICNSFile(const FilePath: string): Boolean;
var
  F: TFileStream;
  Magic: array[0..3] of Byte;
begin
  Result := False;

  if not MyFileExists(FilePath) then
    Exit;

  try
    F := TFileStream.Create(FilePath, fmOpenRead or fmShareDenyNone);
    try
      if F.Size >= 4 then
      begin
        F.ReadBuffer(Magic[0], 4);
        Result := CompareByte(Magic, ICNS_MAGIC, 4) = 0;
      end;
    finally
      F.Free;
    end;
  except
    Result := False;
  end;
end;

function TIconManager.FindICNSInResourceFork(const Data: TBytes;
                                            out Offset, Size: Integer): Boolean;
var
  I: Integer;
  SizeBytes: array[0..3] of Byte;
begin
  Result := False;
  Offset := 0;
  Size := 0;

  for I := 0 to Length(Data) - 8 do
  begin
    if (Data[I] = ICNS_MAGIC[0]) and
       (Data[I+1] = ICNS_MAGIC[1]) and
       (Data[I+2] = ICNS_MAGIC[2]) and
       (Data[I+3] = ICNS_MAGIC[3]) then
    begin
      Offset := I;
      
      SizeBytes[3] := Data[I+4];
      SizeBytes[2] := Data[I+5];
      SizeBytes[1] := Data[I+6];
      SizeBytes[0] := Data[I+7];
      Size := PInteger(@SizeBytes[0])^;
      Result := True;
      Break;
    end;
  end;
end;

function TIconManager.HasIconData(const FilePath: string): Boolean;
var
  Data: TBytes;
  Offset, Size: Integer;
  BaseName: string;
begin
  Result := False;
  BaseName := ExtractFileName(FilePath);

  if not MyFileExists(FilePath) then
    Exit;

  if BaseName = FILENAME_VOLUMECUSTOMICON then
  begin
    
    Result := IsICNSFile(FilePath);
  end
  else
  begin
    
    if GetResourceFork(FilePath, Data) then
      Result := FindICNSInResourceFork(Data, Offset, Size);
  end;
end;

function TIconManager.IsVolumeMountPoint(const FolderPath: string): Boolean;
var
  StatBuf: TStat;
  ParentStatBuf: TStat;
  ParentPath: string;
begin
  Result := False;

  if not DirectoryExists(FolderPath) then
    Exit;

  if FpStat(PChar(FolderPath), StatBuf) = 0 then
  begin
    ParentPath := ExcludeTrailingPathDelimiter(ExtractFileDir(FolderPath));
    if ParentPath = '' then
      ParentPath := '/';

    if FpStat(PChar(ParentPath), ParentStatBuf) = 0 then
      Result := StatBuf.st_dev <> ParentStatBuf.st_dev;
  end;
end;

function TIconManager.GetFileWithIconData(const FileOrFolder: string): string;
begin
  if MyFileExists(FileOrFolder) then
    Result := FileOrFolder
  else if IsVolumeMountPoint(FileOrFolder) then
    Result := IncludeTrailingPathDelimiter(FileOrFolder) + FILENAME_VOLUMECUSTOMICON
  else
    Result := IncludeTrailingPathDelimiter(FileOrFolder) + FILENAME_FOLDERCUSTOMICON;
end;

function TIconManager.GetTargetType(const FileOrFolder: string): string;
begin
  if MyFileExists(FileOrFolder) then
    Result := 'file'
  else if IsVolumeMountPoint(FileOrFolder) then
    Result := 'volume'
  else
    Result := 'folder';
end;

function TIconManager.SetCustomIcon(const FileOrFolder, ImgFile: string): Boolean;
var
  Pool: NSAutoreleasePool;
  Workspace: NSWorkspace;
  SourcePath: NSString;
  DestPath: NSString;
  ImageData: NSImage;
begin
  Result := False;

  if not MyFileExists(ImgFile) then
  begin
    LogError('Image file not found: ' + ImgFile);
    Exit;
  end;

  if not (MyFileExists(FileOrFolder) or DirectoryExists(FileOrFolder)) then
  begin
    LogError('Target not found: ' + FileOrFolder);
    Exit;
  end;

  Pool := NSAutoreleasePool.alloc.init;
  try
    SourcePath := NSString(NSSTR(PChar(ImgFile)));
    DestPath := NSString(NSSTR(PChar(FileOrFolder)));

    ImageData := NSImage.alloc.initWithContentsOfFile(SourcePath);
    if ImageData <> nil then
    begin
      Workspace := NSWorkspace.sharedWorkspace;
      Result := Workspace.setIcon_forFile_options(ImageData, DestPath, 2);
      ImageData.release;

      if Result then
        LogMessage('Custom icon assigned to ' + GetTargetType(FileOrFolder) +
                  ' ''' + FileOrFolder + ''' based on ''' + ImgFile + '''.')
      else
        LogError('Failed to assign custom icon');
    end
    else
      LogError('Failed to load image file');
  finally
    Pool.release;
  end;
end;

function TIconManager.GetCustomIcon(const FileOrFolder, OutFile: string): Boolean;
var
  FileWithIconData: string;
  Data: TBytes;
  Offset, Size: Integer;
  F: TFileStream;
  SrcF: TFileStream;
begin
  Result := False;

  if not (MyFileExists(FileOrFolder) or DirectoryExists(FileOrFolder)) then
  begin
    LogError('Target not found: ' + FileOrFolder);
    Exit;
  end;

  FileWithIconData := GetFileWithIconData(FileOrFolder);

  if not MyFileExists(FileWithIconData) then
  begin
    LogError('Custom-icon file does not exist');
    Exit;
  end;

  if ExtractFileName(FileWithIconData) = FILENAME_VOLUMECUSTOMICON then
  begin
    try
      SrcF := TFileStream.Create(FileWithIconData, fmOpenRead or fmShareDenyNone);
      try
        F := TFileStream.Create(OutFile, fmCreate);
        try
          F.CopyFrom(SrcF, SrcF.Size);
          Result := True;
          LogMessage('Custom icon extracted to ''' + OutFile + '''.');
        finally
          F.Free;
        end;
      finally
        SrcF.Free;
      end;
    except
      on E: Exception do
        LogError('Failed to copy icon file: ' + E.Message);
    end;
    Exit;
  end;

  if not GetResourceFork(FileWithIconData, Data) then
  begin
    LogError('Failed to read resource fork');
    Exit;
  end;

  if not FindICNSInResourceFork(Data, Offset, Size) then
  begin
    LogError('Custom-icon file contains no icons resource');
    Exit;
  end;

  try
    F := TFileStream.Create(OutFile, fmCreate);
    try
      if (Offset + Size) <= Length(Data) then
      begin
        F.WriteBuffer(Data[Offset], Size);
        Result := True;
        LogMessage('Custom icon extracted to ''' + OutFile + '''.');
      end
      else
        LogError('Invalid icon data size');
    finally
      F.Free;
    end;
  except
    on E: Exception do
      LogError('Failed to write icon file: ' + E.Message);
  end;
end;

function TIconManager.RemoveCustomIcon(const FileOrFolder: string): Boolean;
var
  Data: TBytes;
  FileWithIconData: string;
  IsBlank: Boolean;
  I: Integer;
begin
  Result := False;

  if not (MyFileExists(FileOrFolder) or DirectoryExists(FileOrFolder)) then
  begin
    LogError('Target not found: ' + FileOrFolder);
    Exit;
  end;

  if HasExtendedAttribute(FileOrFolder, XATTR_FINDERINFO_NAME) then
  begin
    if GetExtendedAttribute(FileOrFolder, XATTR_FINDERINFO_NAME, Data) then
    begin
      if Length(Data) > FI_BYTEOFFSET_CUSTOMICON then
      begin
        
        Data[FI_BYTEOFFSET_CUSTOMICON] := Data[FI_BYTEOFFSET_CUSTOMICON] and (not FI_VAL_CUSTOMICON);

        IsBlank := True;
        for I := 0 to Length(Data) - 1 do
        begin
          if Data[I] <> 0 then
          begin
            IsBlank := False;
            Break;
          end;
        end;

        if IsBlank then
          RemoveExtendedAttribute(FileOrFolder, XATTR_FINDERINFO_NAME)
        else
          SetExtendedAttribute(FileOrFolder, XATTR_FINDERINFO_NAME, Data);
      end;
    end;
  end;

  if DirectoryExists(FileOrFolder) then
  begin
    FileWithIconData := GetFileWithIconData(FileOrFolder);
    if FileExists(FileWithIconData) then
      DeleteFile(FileWithIconData);
  end
  else if HasIconData(FileOrFolder) then
  begin
    RemoveExtendedAttribute(FileOrFolder, XATTR_RESOURCEFORK_NAME);
  end;

  Result := True;
  LogMessage('Custom icon removed from ' + GetTargetType(FileOrFolder) +
            ' ''' + FileOrFolder + '''.');
end;

function TIconManager.TestForCustomIcon(const FileOrFolder: string): Integer;
var
  Data: TBytes;
  HasCustomIconFlag: Boolean;
  HasIconDataFlag: Boolean;
  FileWithIconData: string;
begin
  
  if not (MyFileExists(FileOrFolder) or DirectoryExists(FileOrFolder)) then
  begin
    LogError('Target not found: ' + FileOrFolder);
    Result := 3;
    Exit;
  end;

  HasCustomIconFlag := False;
  if GetExtendedAttribute(FileOrFolder, XATTR_FINDERINFO_NAME, Data) then
  begin
    if Length(Data) > FI_BYTEOFFSET_CUSTOMICON then
      HasCustomIconFlag := (Data[FI_BYTEOFFSET_CUSTOMICON] and FI_VAL_CUSTOMICON) <> 0;
  end;

  FileWithIconData := GetFileWithIconData(FileOrFolder);
  HasIconDataFlag := HasIconData(FileWithIconData);

  if HasCustomIconFlag and HasIconDataFlag then
  begin
    if not FQuiet then
      LogMessage('HAS custom icon: ' + GetTargetType(FileOrFolder) + ' ''' + FileOrFolder + '''');
    Result := 0;
  end
  else if (not HasCustomIconFlag) and (not HasIconDataFlag) then
  begin
    if not FQuiet then
      LogMessage('Has NO custom icon: ' + GetTargetType(FileOrFolder) + ' ''' + FileOrFolder + '''');
    Result := 1;
  end
  else if not HasCustomIconFlag then
  begin
    LogError('WARNING: Custom-icon data is present, but the flag isn''t set');
    Result := 2;
  end
  else
  begin
    LogError('WARNING: Flag is set, but associated icon data is missing');
    Result := 3;
  end;
end;

function TIconManager.RefreshAppIconDirect(const AppDir: string): Boolean;
var
  AppPath: string;
  TmpIcon: string;
  IconSrc: string;
  IconSearchRec: TSearchRec;
begin
  Result := false;
  if not DirectoryExists(AppDir) then Exit
  else
    AppPath := AppDir;
  LogMessage('🔧 ' + AppPath);
  if TestForCustomIcon(AppPath) = 0 then
  begin
    
    TmpIcon := GetTempDir + 'icon_' + IntToStr(Random(99999)) + '.icns';
    if GetCustomIcon(AppPath, TmpIcon) then
    begin
      if SetCustomIcon(AppPath, TmpIcon) then
      begin
        LogMessage('♻️ refreshed existing icon');
        Result := True;
      end
      else
        LogMessage('⚠️ failed to refresh icon');
      DeleteFile(TmpIcon);
    end
    else
      LogMessage('⚠️ could not extract icon');
  end
  else
  begin
    
    IconSrc := AppPath + '/Contents/Resources';
    if FindFirst(IconSrc + '/*.icns', faAnyFile, IconSearchRec) = 0 then
    begin
      repeat
        if (IconSearchRec.Attr and faDirectory) = 0 then
        begin
          IconSrc := AppPath + '/Contents/Resources/' + IconSearchRec.Name;
          Break;
        end;
      until FindNext(IconSearchRec) <> 0;
      FindClose(IconSearchRec);
      if FileExists(IconSrc) then
      begin
        if SetCustomIcon(AppPath, IconSrc) then
        begin
          LogMessage('✨ re-applied default icon');
          Result := True;
        end
        else
          LogMessage('⚠️ skipped');
      end
      else
        LogMessage('⚠️ no icon found');
    end
    else
      LogMessage('⚠️ no icon found');
  end;
end;

function TIconManager.RefreshAppIcons(const AppDir: string): Integer;
var
  SearchRec: TSearchRec;
  AppPath: string;
  TmpIcon: string;
  IconSrc: string;
  IconSearchRec: TSearchRec;
begin
  Result := 0;

  LogMessage('🎨 Refreshing App icons in: ' + AppDir);

  if not DirectoryExists(AppDir) then
  begin
    LogError('Directory not found: ' + AppDir);
    Exit;
  end;

  if FindFirst(AppDir + '/*.app', faDirectory, SearchRec) = 0 then
  begin
    repeat
      if (SearchRec.Name <> '.') and (SearchRec.Name <> '..') and
         ((SearchRec.Attr and faDirectory) <> 0) then
      begin
        AppPath := IncludeTrailingPathDelimiter(AppDir) + SearchRec.Name;
        LogMessage('🔧 ' + SearchRec.Name);

        if TestForCustomIcon(AppPath) = 0 then
        begin
          
          TmpIcon := GetTempDir + 'icon_' + IntToStr(Random(99999)) + '.icns';
          if GetCustomIcon(AppPath, TmpIcon) then
          begin
            if SetCustomIcon(AppPath, TmpIcon) then
              LogMessage('♻️ refreshed existing icon')
            else
              LogMessage('⚠️ failed to refresh icon');
            DeleteFile(TmpIcon);
          end
          else
            LogMessage('⚠️ could not extract icon');
        end
        else
        begin
          
          IconSrc := AppPath + '/Contents/Resources';
          if FindFirst(IconSrc + '/*.icns', faAnyFile, IconSearchRec) = 0 then
          begin
            repeat
              if (IconSearchRec.Attr and faDirectory) = 0 then
              begin
                IconSrc := AppPath + '/Contents/Resources/' + IconSearchRec.Name;
                Break;
              end;
            until FindNext(IconSearchRec) <> 0;
            FindClose(IconSearchRec);

            if FileExists(IconSrc) then
            begin
              if SetCustomIcon(AppPath, IconSrc) then
                LogMessage('✨ re-applied default icon')
              else
                LogMessage('⚠️ skipped');
            end
            else
              LogMessage('⚠️ no icon found');
          end
          else
            LogMessage('⚠️ no icon found');
        end;

        Inc(Result);
      end;
    until FindNext(SearchRec) <> 0;
    FindClose(SearchRec);
  end;

  LogMessage('🔄 Reloading Finder...');
  LogMessage('   Please manually restart Finder or run: killall Finder');
end;

function FixSquircleJail(Path: String; Force: Boolean): Boolean;
var
  im: TIconManager;
  processInfo: NSProcessInfo;
  osVersion: NSOperatingSystemVersion;
begin
  processInfo := NSProcessInfo.processInfo;
  osVersion := processInfo.operatingSystemVersion;
  if (osVersion.majorVersion < 26) and (not Force) then
  begin
    Result := True;
    Exit;
  end;
  im := TIconManager.Create;
  
  Result := im.RefreshAppIconDirect(Path);
  
  im.Free;
end;

{$ENDIF}

end.
