{
Business Source License 1.1

Parameters

Licensor:             InstallAware Software

Licensed Work:        InstallAware (Multi Platform) 2025
                      The Licensed Work is (C) 1996-2025 InstallAware Software

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
unit mos3;

{$IFDEF FPC}
  {$MODE Delphi}
{$ENDIF}

interface

uses
{$IFnDEF FPC}
  ShellAPI, Mask, Windows,
{$ELSE}
  Masks, LCLIntf, LCLType, LMessages,
{$ENDIF}
  Messages, SysUtils, mUtils, FileLbl, Variants, Classes, Graphics, Controls,
  Forms, Dialogs, ExtCtrls, StdCtrls, Buttons, ComCtrls
{$IFDEF WINDOWS}, ShellAPI, Registry{$ENDIF};

type

  TOS3 = class(TForm)
    Bevel2: TBevel;
    Bevel6: TBevel;
    Bevel9: TBevel;
    Folder: TCheckBox;
    Image23: TImage;
    Label29: TLabel;
    Label30: TLabel;
    Label35: TLabel;
    Page4B: TPage;
    Panel7: TPanel;
    Progress: TProgressBar;
    SaveProject: TSaveDialog;
    SaveSetup: TBitBtn;
    BuildNow: TCheckBox;
    Cancel: TBitBtn;
    Image15: TImage;
    Image27: TImage;
    Label15: TLabel;
    Label21: TLabel;
    Label24: TLabel;
    Label6: TLabel;
    OpenSetup: TOpenDialog;
    OpenProject: TOpenDialog;
    Page3A: TPage;
    Panel3: TPanel;
    RunSetup: TRadioButton;
    Image2: TImage;
    Image26: TImage;
    ImportSetupHintIcon: TImage;
    Image28: TImage;
    Label20: TLabel;
    Label28: TLabel;
    Label4: TLabel;
    Label49: TLabel;
    Label5: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    ImportSetupLabel: TLabel;
    ImportSetupHint: TLabel;
    Label54: TLabel;
    Layer: TEdit;
    PageX: TPage;
    Page2A: TPage;
    Page2B: TPage;
    Image20: TImage;
    Image21: TImage;
    Image22: TImage;
    Image24: TImage;
    Image25: TImage;
    Page1: TPage;
    Page3B: TPage;
    Page5: TPage;
    ImportSetup: TRadioButton;
    Next: TBitBtn;
    Back: TBitBtn;
    Notebook: TNotebook;
    SaveFile: TEdit;
    Shared: TRadioButton;
    BrowseSetup: TBitBtn;
    Label1: TLabel;
    Label3: TLabel;
    PackageAware: TBitBtn;
    SetupFile: TEdit;
    Label2: TLabel;
    DoingWork: TLabel;
    Image1: TImage;
    Shape2: TShape;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Bevel4: TBevel;
    Panel1: TPanel;
    Label13: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Bevel5: TBevel;
    Panel2: TPanel;
    Label18: TLabel;
    Label19: TLabel;
    Bevel7: TBevel;
    Panel4: TPanel;
    Label22: TLabel;
    Label23: TLabel;
    Bevel8: TBevel;
    Panel5: TPanel;
    DoingWorkTitle: TLabel;
    Label25: TLabel;
    Image13: TImage;
    Shape3: TShape;
    Label26: TLabel;
    Label27: TLabel;
    Label14: TLabel;
    Image14: TImage;
    Image5: TImage;
    Image4: TImage;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Shape1: TShape;
    Label31: TLabel;
    Named: TRadioButton;
    BrowseProject: TBitBtn;
    Bevel1: TBevel;
    Panel6: TPanel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    ProjectFile: TEdit;
    Label39: TLabel;
    Image7: TImage;
    Label45: TLabel;
    Image19: TImage;
    Shape5: TShape;
    LayerLabel: TLabel;
    Label48: TLabel;
    AfterPackageAware: TBitBtn;
    Page4: TPage;
    Page0: TPage;
    PageY: TPage;
    Shortcuts: TListView;
    Subfolders: TCheckBox;
    procedure FolderChange(Sender: TObject);
    procedure NamedChange(Sender: TObject);
    procedure PackageAwareClick(Sender: TObject);
    procedure BrowseSetupClick(Sender: TObject);
    procedure BackClick(Sender: TObject);
    procedure LayerChange(Sender: TObject);
    procedure NextClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BrowseProjectClick(Sender: TObject);
    procedure AfterPackageAwareClick(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure SaveSetupClick(Sender: TObject);
  private
    
  public
    procedure SetControls(First, Last: Boolean; LastButBackEnabled: Boolean = false);
  end;

var
  OS3: TOS3;

implementation

{$IFnDEF FPC}
  {$R *.lfm}
{$ELSE}
  {$R *.lfm}
{$ENDIF}

uses
  uGui, mProject, mNewProject;

procedure TOS3.LayerChange(Sender: TObject);
begin
  LayerLabel.Caption := 'Accessible to applications targeting the given name of the layer. ' +
    'Typically installed in: ~/';
  if Layer.Text <> '' then
    LayerLabel.Caption := LayerLabel.Caption + Layer.Text
  else
    LayerLabel.Caption := LayerLabel.Caption + '.wine';
  LayerLabel.Caption := LayerLabel.Caption + '/';
end;

procedure TOS3.FormShow(Sender: TObject);
begin
  ui.PushStatusStack('Application Porting Toolkit');
  Notebook.PageIndex := Notebook.Pages.IndexOf('Page0'); 
  SetControls(True, false);
end;

procedure TOS3.BrowseProjectClick(Sender: TObject);
begin
  if OpenProject.Execute then
    ProjectFile.Text := OpenProject.FileName;
end;

procedure TOS3.NextClick(Sender: TObject);
var
  b: Boolean;
  l: TStringList;
  s, sX, sY, sZ: String;
  i, j, k, m, n, o: Integer;
begin
  if Notebook.ActivePage = 'Page0' then 
  begin
    Notebook.PageIndex := Notebook.Pages.IndexOf('Page1'); 
    SetControls(false, false);
    
    Exit;
  end;
  if Notebook.ActivePage = 'Page1' then 
  begin
    if RunSetup.Checked then
    begin
      Notebook.PageIndex := Notebook.Pages.IndexOf('Page2A'); 
      FolderChange(Self);
    end
    else
      if ImportSetup.Checked then
      begin
        Notebook.PageIndex := Notebook.Pages.IndexOf('Page2B');
        {$IFNDEF WINDOWS}
        PackageAware.Enabled := false;
        {$ENDIF}
      end;
    SetControls(false, ImportSetup.Checked, ImportSetup.Checked);
    Exit;
  end;
  if Notebook.ActivePage = 'Page2A' then 
  begin
    if not MyFileExists(SetupFile.Text) then
      BrowseSetupClick(Self);
    if (SetupFile.Text = '') or (not MyFileExists(SetupFile.Text)) then
    begin
      Application.MessageBox(PChar('Cannot read setup file - please select your setup again.'),
        PChar(Application.Title), mb_Ok + mb_IconExclamation);
      Exit;
    end;
    Notebook.PageIndex := Notebook.Pages.IndexOf('Page3A');
    SetControls(false, false);
    Exit;
  end;
  if Notebook.ActivePage = 'Page3A' then
  begin
    if (SaveFile.Text = '') or (not DirectoryExists(ExtractFilePath(SaveFile.Text))) then
      SaveSetupClick(Self);
    if (not IsValidSaveNameEx(ExtractFileName(SaveFile.Text)))
      or (ExtractFileName(SaveFile.Text) = '') then
    begin
      Application.MessageBox(PChar('Cannot save setup file - please check your typing and try again.'),
        PChar(Application.Title), mb_Ok + mb_IconExclamation);
      Exit;
    end;
    
    if not DirectoryExists(EXEDIR + 'Templates' + PathDelim + 'Empty Setup') then
    begin
      Application.MessageBox(PChar('We''re not able to locate the "Empty Setup" template on your device.' + MyLineEnding + MyLineEnding
        + 'Please run InstallAware setup again, and add the "Templates" feature to install this template on your device.' + MyLineEnding + MyLineEnding
        + 'Then come here and try again.'), 
        PChar(Application.Title), mb_Ok + mb_IconStop);
      Exit;
    end;
    
    Notebook.PageIndex := Notebook.Pages.IndexOf('PageY'); 
    DoingWork.Caption := 'Initializing the Empty Setup template for use with Application Porting Toolkit';
    DoingWorkTitle.Caption := 'Preparing...';
    Back.Enabled := false;
    Next.Enabled := false;
    Cancel.Enabled := false;
    Application.ProcessMessages;
    NewProject.CloneTemplateProject(EXEDIR + 'Templates' + PathDelim + 'Empty Setup',
      SaveFile.Text); 
    Notebook.PageIndex := Notebook.Pages.IndexOf('Page4'); 
    NamedChange(Self);
    SetControls(false, false);
    Exit;
  end;
  if Notebook.ActivePage = 'Page2B' then 
  begin
    ModalResult := mrOk;
    Exit;
  end;
  if Notebook.ActivePage = 'Page3B' then 
  begin
    if not MyFileExists(ProjectFile.Text) then
      BrowseProjectClick(Self);
    if (ProjectFile.Text = '') or (not MyFileExists(ProjectFile.Text)) then
    begin
      Application.MessageBox(PChar('Cannot read project file - please select your project again.'),
        PChar(Application.Title), mb_Ok + mb_IconExclamation);
      Exit;
    end;
    Notebook.PageIndex := Notebook.Pages.IndexOf('PageY'); 
    DoingWork.Caption := 'This may take a while, depending on the number of objects that were installed.';
    DoingWorkTitle.Caption := 'Reading...';
    Back.Enabled := false;
    Next.Enabled := false;
    Cancel.Enabled := false;
    Application.ProcessMessages;
    
    if AnsiCompareText(ExtractFileExt(ProjectFile.Text), '.mpr') = 0 then
      b := ui.LoadProject(ProjectFile.Text, True, True)
    else
      b := ui.LoadProject(ProjectFile.Text, false, True);
    if not b then
    begin
      Notebook.PageIndex := Notebook.Pages.IndexOf('PageX');
      SetControls(false, True);
      Exit;
    end;
    
    if AnsiCompareText(ExtractFileExt(ProjectFile.Text), '.mpr') = 0 then 
    begin
      s := AssertDir(ExtractFilePath(ProjectFile.Text)) +
        ExtractFileNameOnly(ProjectFile.Text) + ' files' + PathDelim;
      l := FindAllFilesEz(s, True, false, nil);
      for i := 1 to l.Count do
      begin
        DoingWork.Caption := PROJDIR + ExtractFileNameOnly(ProjectFile.Text)
          + ' files' + PathDelim + sX;
        Application.ProcessMessages;
        sX := AssertDir(ExtractFilePath(l[i -1]));
        System.Delete(sX, 1, Length(s));
        ForceDirectories(PROJDIR + ExtractFileNameOnly(ProjectFile.Text)
          + ' files' + PathDelim + sX);
        sX := sX + ExtractFileName(l[i -1]);
        FileCopyFile(l[i -1], PROJDIR + ExtractFileNameOnly(ProjectFile.Text)
          + ' files' + PathDelim + sX, false);
      end;
      l.Free;
    end;
    Notebook.PageIndex := Notebook.Pages.IndexOf('Page4');
    NamedChange(Self);
    SetControls(false, false);
    Exit;
  end;
  if Notebook.ActivePage = 'Page4' then 
  begin
    Notebook.PageIndex := Notebook.Pages.IndexOf('PageY'); 
    DoingWork.Caption := 'Adding Wine support to your project, and finalizing other changes.';
    DoingWorkTitle.Caption := 'Writing...';
    Back.Enabled := false;
    Next.Enabled := false;
    Cancel.Enabled := false;
    Application.ProcessMessages;
    
    sX := '$HOMEPATH$/';
    if not Named.Checked then
      sX := sX + '.wine'
    else
      if Layer.Text <> '' then
        sX := sX + '.' + Layer.Text
      else
        sX := sX + '.wine';
    
    if RunSetup.Checked then
    begin
      
      j := ui.GetNewFilesInsertionIndex('');
      if Folder.Checked then
        s := AssertDir(ExtractFilePath(SetupFile.Text)) + '*'
      else
        s := SetupFile.Text;
      ui.EmitInsertCommand('File Bag', '"' + s + '","' + MyBoolToStr(Subfolders.Checked)
        + '","","RUNTIME_BAG"', j);
      ui.EmitInsertCommand('Run Program As', '"$WINEENTRY$","","$RUNTIME_BAG$/'
        + ExtractFileName(SetupFile.Text) + '","0","$MYAH_UAC$","","","RUNRESULT"'
        + ',"TRUE","""WINEPREFIX=$WINEPREFIX$"""', j);
      ui.EmitInsertCommand('If', '"RUNRESULT","0","0","FALSE"', j);
      ui.EmitInsertCommand('Set Variable', '"SUCCESS$MYAH$MYAH$FALSE","COMPLETE"', j);
      ui.EmitInsertCommand('Else', '', j);
      ui.EmitInsertCommand('Set Variable', '"SUCCESS$MYAH$MYAH$FALSE","ERROR"', j);
      ui.EmitInsertCommand('End', '', j);
      
      for i := 1 to DisplayDialog.Count do
        if (i mod 7) = 1 then
          if (AnsiCompareText(DisplayDialog[i], 'destination') = 0) then
          begin
            ScriptComments[ScriptReferences.IndexOf(DisplayDialog[i -1])] := 'C';
            Break;
          end;
      for i := 1 to ApplyChanges.Count do
        if (i mod 5) = 1 then
          if MyStrToBool(ApplyChanges[i +2]) then
          begin
            ScriptComments[ScriptReferences.IndexOf(ApplyChanges[i -1])] := 'C';
            Break;
          end;
      for i := 1 to Short.Count do
        if (i mod 10) = 1 then
          ScriptComments[ScriptReferences.IndexOf(Short[i -1])] := 'C';
    end
    else
    
    begin
      StrCopy(ProjectStruct.Conditionals, PChar('IGNOREMISSINGFILES=TRUE,CACHESOURCES=TRUE'));
      
      j := ui.GetSetupGlobalInsertionIndex;
      ui.EmitInsertCommand('Set Variable', '"NATIVE_ERROR$MYAH$MYAH$FALSE","IGNORE"', j);
      ui.EmitInsertCommand('Set Variable', '"NATIVE_OVERWRITE$MYAH$MYAH$FALSE","NEVER"', j);
      if AnsiCompareText(ExtractFileExt(ProjectFile.Text), '.mpr') = 0 then 
      begin
        
        ui.EmitInsertCommand('If', '"PLATFORM","0","MACOS","FALSE"', j);
        ui.EmitInsertCommand('Set Variable', '"PLATFORMMENU$MYAH$MYAH$FALSE","/Applications"', j);
        ui.EmitInsertCommand('Else', '', j);
        ui.EmitInsertCommand('Get Folder Location', '"PLATFORMMENU","14","FALSE"', j);
        ui.EmitInsertCommand('End', '', j);
        ui.EmitInsertCommand('Define Component', '"$TITLE$","TRUE","Installs $TITLE$"', j); 
        
        sY := '';
        
        Progress.Min := 0;
        Progress.Max := ScriptTypes.Count;
        Progress.Position := 0;
        o := 0;
        Progress.Visible := True;
        for i := ScriptTypes.Count downto 1 do
        begin
          Progress.Position := Progress.Position +1;
          Application.ProcessMessages;
          if ScriptTypes[i -1] = 'Install Files' then
          begin
            sZ := ScriptReferences[i -1];
            m := InstallFiles.IndexOf(sZ); 
            
            if (sY = '') or (sY <> InstallFiles[m +3]) then
            begin
              sY := InstallFiles[m +3];
              InstallFiles[m +1] := AssertDir(ExtractFilePath(InstallFiles[m +1])) + '*';
            end
            else
            begin
              ui.RenderDeleteScriptEx(i -1, True); 
              o := o +1;
              DoingWork.Caption := 'Optimized ' + IntToStr(o) + ' Install Files statements...';
              
            end;
          end;
        end;
        
        Progress.Visible := false;
        DoingWork.Caption := 'Adding Wine support to your project, and finalizing other changes.';
        Application.ProcessMessages;
      end;
      if false then 
      begin 
        
        StrCopy(ProjectStruct.Conditionals,
          PChar(StringReplace(ProjectStruct.Conditionals, 'requireAdministrator', 'asInvoker', [rfReplaceAll, rfIgnoreCase])));
        
      end;
      
      if AnsiCompareText(ExtractFileExt(ProjectFile.Text), '.mprx') = 0 then 
      begin
        for i := 1 to GetFolderLocation.Count do
          if (i mod 4) = 1 then
            if (AnsiCompareText('STARTMENU', GetFolderLocation[i]) = 0) or
              (AnsiCompareText('STARTMENUALL', GetFolderLocation[i]) = 0) then
              
              ScriptComments[ScriptReferences.IndexOf(GetFolderLocation[i -1])] := 'C';
        
        ui.EmitInsertCommand('Get Folder Location', '"STARTMENU","14","FALSE"', j); 
        ui.EmitInsertCommand('Get Folder Location', '"STARTMENUALL","14","TRUE"', j); 
      end;
      if not Named.Checked then
        ui.EmitInsertCommand('Set Wine Bottle', '"FALSE","TRUE","FALSE"', j) 
      else
      begin
        ui.EmitInsertCommand('Set Variable', '"BOTTLE$MYAH$MYAH$FALSE","$WINEPREFIX$"', j);
        ui.EmitInsertCommand('Convert Path', '"BOTTLE","0"', j);
        ui.EmitInsertCommand('Set Wine Bottle', '"FALSE","FALSE","TRUE"', j); 
        
        if AnsiCompareText(ExtractFileExt(ProjectFile.Text), '.mpr') <> 0 then
        begin
          ui.EmitInsertCommand('Get Folder Location', '"PROGRAMFILES","20","FALSE"', j);
          ui.EmitInsertCommand('If', '"MAINTENANCE","0","FALSE","FALSE"', j);
          ui.EmitInsertCommand('Set Variable', '"TARGETDIR$MYAH$MYAH$FALSE","$PROGRAMFILES$/$TITLE$"', j);
          ui.EmitInsertCommand('End', '', j);
        end;
      end;
      
      for i := 1 to Short.Count do
        if (i mod 10) = 1 then
        begin
          if AnsiPos('$UNINSTALLLINK$|0', Short[i]) <> 0 then
          begin
            
            ScriptComments[ScriptReferences.IndexOf(Short[i -1])] := 'C';
            Continue;
          end;
          
          Short[i +4] := '-c ''WINEPREFIX="$WINEPREFIX$" "$WINEENTRY$" "' + Short[i] + '"''';
          Short[i] := '/bin/sh'; 
          Short[i +2] := '$PLATFORMMENU$';
        end;
      
      j := ui.GetNewFilesInsertionIndex('');
      ui.EmitInsertCommand('Create Shortcut',
        '"$UNINSTALLLINK$|0","$TITLE$ Maintenance","$PLATFORMMENU$|0",' +
        '"Add or remove $TITLE$ features","","|0","|0","|","0|"',
        j);
      if AnsiCompareText(ExtractFileExt(ProjectFile.Text), '.mpr') = 0 then 
      begin
        
        if DirectoryExists(EXEDIR + 'Dialogs' + PathDelim + 'macOS') then
        begin
          l := FindAllFilesEx(EXEDIR + 'Dialogs' + PathDelim + 'macOS' + PathDelim + '*', false); 
          for i := 1 to l.Count do
            if AnsiLowerCase(ExtractFileExt(l[i -1])) = '.lfm' then 
            begin
              
              FileCopyFile(PChar(l[i -1]), PChar(PROJDIR + ExtractFileName(l[i -1])), false);
              FileCopyFile(PChar(l[i -1] + '.miaf'), PChar(PROJDIR + ExtractFileName(l[i -1]) + '.miaf'), false); 
              
            end;
          l.Free;
          for i := 1 to DisplayDialog.Count do
            if (i mod 7) = 1 then
              if (AnsiCompareText(DisplayDialog[i], 'startmenu') = 0) then
              begin
                DisplayDialog[i] := 'setuptype';
                DialogFiles.Add('setuptype.lfm');
                DialogFiles.Add('setuptype.lfm.miaf'); 
                DialogFiles.Delete(DialogFiles.IndexOf('startmenu.lfm'));
                DialogFiles.Delete(DialogFiles.IndexOf('startmenu.lfm.miaf')); 
                ui.SetDirtyMpr(True);
                Project.SetDialogs(DialogFiles);
              end
              else
                if (AnsiCompareText(DisplayDialog[i], 'startinstallation') = 0) then
                begin
                  ScriptComments[ScriptReferences.IndexOf(DisplayDialog[i -1])] := 'C';
                  
                  j := ScriptReferences.IndexOf(DisplayDialog[i -1]) +2;
                  ui.EmitInsertCommand('If', '"WIZARD","0","REMOVE","FALSE"', j);
                  ui.EmitInsertCommand('Set Variable', '"REMOVE$MYAH$MYAH$FALSE","TRUE"', j);
                  ui.EmitInsertCommand('End', '', j);
                end;
        end;
      end;
    end;
    
    if (ui.GetPreReqTopInsertionIndex(True) = -1) or
      (ui.GetPreReqTopInsertionIndex(false) = -1) then
    begin
      
      Notebook.PageIndex := Notebook.Pages.IndexOf('PageX');
      SetControls(false, True);
      Exit;
    end;
    DoingWork.Caption := 'Adding Wine support to your project, and finalizing other changes.';
    DoingWorkTitle.Caption := 'Writing...';
    Application.ProcessMessages;
    if ui.AddNamedRuntime('Wine') then 
    begin
      ui.SetDirtyMPR(True);
      Project.SetInclude(IncludeFiles); 
    end;
    k := ui.CurrentUnit.TabIndex; 
    if (not ui.LoadNamedRuntimeUnit('Wine', True)) or
      (not ui.EditMatchingCommand(SetVariable, 3, 'WINEPREFIX$MYAH$MYAH$FALSE', sX, 1, 2)) then
    begin
      
      Notebook.PageIndex := Notebook.Pages.IndexOf('PageX');
      SetControls(false, True);
      Exit;
    end;
    ui.CurrentUnit.TabIndex := k; 
    ui.CurrentUnitChange(Self);
    
    ui.SaveExistingProject(PROJDIR);
    
    ui.AdjustUIProjectChanged;
     
    Notebook.PageIndex := Notebook.Pages.IndexOf('Page5');
    SetControls(false, True);
    Exit;
  end;
  if (Notebook.ActivePage = 'Page5') then 
  begin
    ModalResult := mrOk;
    Exit;
  end;
  if Notebook.ActivePage = 'PageX' then 
    ModalResult := mrOk;
end;

procedure TOS3.SetControls(First, Last: Boolean; LastButBackEnabled: Boolean = false);
begin
  Next.Caption := SNext;
  if First then
  begin
    Back.Enabled := false;
    Cancel.Enabled := True;
    Next.Enabled := True;
  end
  else
  if Last then
  begin
    
    if not LastButBackEnabled then
      Back.Enabled := false
    else
      Back.Enabled := True;
    Cancel.Enabled := false;
    Next.Enabled := True;
    Next.Caption := SFinish;
  end
  else
  begin
    Back.Enabled := True;
    Next.Enabled := True;
    Cancel.Enabled := True;
  end;
end;

procedure TOS3.BackClick(Sender: TObject);
begin
  if Notebook.ActivePage = 'Page0' then 
  begin
    Exit; 
  end;
  if Notebook.ActivePage = 'Page1' then 
  begin
    Notebook.PageIndex := Notebook.Pages.IndexOf('Page0'); 
    SetControls(True, false);
  end;
  if (Notebook.ActivePage = 'Page2A') or 
    (Notebook.ActivePage = 'Page2B') then 
  begin
    Notebook.PageIndex := Notebook.Pages.IndexOf('Page1'); 
    SetControls(false, false);
  end;
  if Notebook.ActivePage = 'Page3A' then 
  begin
    Notebook.PageIndex := Notebook.Pages.IndexOf('Page2A'); 
    FolderChange(Self);
    SetControls(false, false);
  end;
  if Notebook.ActivePage = 'Page3B' then 
  begin
    Notebook.PageIndex := Notebook.Pages.IndexOf('Page2B'); 
    SetControls(false, True, True);
  end;
  if Notebook.ActivePage = 'Page4' then 
  begin
    if RunSetup.Checked then
      Notebook.PageIndex := Notebook.Pages.IndexOf('Page3A') 
    else
      Notebook.PageIndex := Notebook.Pages.IndexOf('Page3B'); 
    SetControls(false, not RunSetup.Checked, not RunSetup.Checked);
  end;
  if Notebook.ActivePage = 'Page4B' then 
  begin
    Notebook.PageIndex := Notebook.Pages.IndexOf('Page4'); 
    SetControls(false, false);
  end;
  if Notebook.ActivePage = 'Page5' then 
  begin
    Notebook.PageIndex := Notebook.Pages.IndexOf('Page4'); 
    
    SetControls(false, false);
  end;
end;

procedure TOS3.AfterPackageAwareClick(Sender: TObject);
begin
  Notebook.PageIndex := Notebook.Pages.IndexOf('Page3B'); 
  SetControls(false, false);
end;

procedure TOS3.BrowseSetupClick(Sender: TObject);
begin
  if OpenSetup.Execute then
    SetupFile.Text := OpenSetup.FileName;
end;

procedure TOS3.PackageAwareClick(Sender: TObject);
{$IFDEF WINDOWS}
var
  s: String;
  r: TRegistry;
{$ENDIF}
begin
  {$IFDEF WINDOWS}
  
  s := '';
  r := TRegistry.Create;
  
  r.RootKey := HKEY_LOCAL_MACHINE;
  r.Access := KEY_READ;
  if r.KeyExists('SOFTWARE\MimarSinan\InstallAware\2.0\Plug-Ins\(Un)Install MSI Setup') then
    if r.OpenKey('SOFTWARE\MimarSinan\InstallAware\2.0\Plug-Ins\(Un)Install MSI Setup', false) then
      if r.ValueExists('') then
      begin
        s := r.ReadString('');
        
        s := AssertDir(ExtractFilePath(DeAssertDir(ExtractFilePath(DeAssertDir(ExtractFilePath(s)))))) + 'Setup Capture\PackageAware.exe';
         s := '';
      end;
  r.Free;
  
  s := AssertDir(ExtractFilePath(ParamStr(0))) + 'mpax.exe';
  if not MyFileExists(s) then s := '';
  
  if s = '' then
  begin
    Application.MessageBox(PChar('We''re not able to locate PackageAware on your Windows device.' + MyLineEnding + MyLineEnding
      + 'Please run InstallAware setup again, and add the "Setup Capture" feature to install PackageAware on this device.' + MyLineEnding + MyLineEnding
      + 'Then come here and try to launch PackageAware again.'), 
      PChar(Application.Title), mb_Ok + mb_IconStop);
    Exit;
  end;
  
  ShellExecute(Handle, 'open', PChar(s), nil, nil, SW_SHOW);
  {$ENDIF}
end;

procedure TOS3.NamedChange(Sender: TObject);
begin
  Layer.Enabled := Named.Checked;
end;

procedure TOS3.FolderChange(Sender: TObject);
begin
  Subfolders.Enabled := Folder.Checked;
end;

procedure TOS3.FormHide(Sender: TObject);
begin
  ui.PopStatusStack;
end;

procedure TOS3.SaveSetupClick(Sender: TObject);
begin
  if SaveProject.Execute then
    SaveFile.Text := SaveProject.FileName;
end;

end.

