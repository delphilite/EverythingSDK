{ ***************************************************** }
{                                                       }
{  Pascal language binding for Everything SDK           }
{                                                       }
{  Unit Name: Demo                                      }
{     Author: Lsuper 2024.08.01                         }
{    Purpose: Demo                                      }
{    License: Mozilla Public License 2.0                }
{                                                       }
{  Copyright (c) 1998-2024 Super Studio                 }
{                                                       }
{ ***************************************************** }

program Demo;

{$mode objfpc}{$H+}

uses
  SysUtils, Windows, EverythingSDK;

function FileTimeToDateTime(const AFileTime: TFileTime): TDateTime;
var
  LocalFileTime: TFileTime;
  SystemTime: TSystemTime;
begin
  FileTimeToLocalFileTime(AFileTime, LocalFileTime);
  FileTimeToSystemTime(LocalFileTime, SystemTime);
  Result := SystemTimeToDateTime(SystemTime);
end;

function FormatFileAttrib(AAttrib: DWORD): string;
begin
  if AAttrib and faDirectory <> 0 then
    Result := '    '
  else begin
    Result := '';
    if AAttrib and faReadOnly <> 0 then
      Result := Result + 'r'
    else Result := Result + '-';
    if AAttrib and faArchive <> 0 then
      Result := Result + 'a'
    else Result := Result + '-';
    if AAttrib and faHidden <> 0 then
      Result := Result + 'h'
    else Result := Result + '-';
    if AAttrib and faSysFile <> 0 then
      Result := Result + 's'
    else Result := Result + '-';
  end;
end;

procedure Execute(const AFind: string);
var
  C, F, I, R: DWORD;
  dwAttributes: DWORD;
  fileName: string;
  fileAttrib, fileSize, fileTime: string;
  ftModified: TFileTime;
  nSize: Int64;
begin
  Writeln('Find: ', AFind);

  Everything_SetSearch(PChar(AFind));
  F := EVERYTHING_REQUEST_FILE_NAME or EVERYTHING_REQUEST_PATH or EVERYTHING_REQUEST_DATE_MODIFIED or
    EVERYTHING_REQUEST_SIZE or EVERYTHING_REQUEST_ATTRIBUTES;
  Everything_SetRequestFlags(F);
  Everything_SetSort(EVERYTHING_SORT_PATH_ASCENDING);

  Writeln('Execute Query');
  if not Everything_Query(True) then
  begin
    R := Everything_GetLastError;
    raise Exception.Create(Everything_GetErrorMessage(R));
  end;
  Writeln('Result List Request Flags: ', Everything_GetResultListRequestFlags());

  C := Everything_GetNumResults();
  Writeln('Result List Count: ', C);

  if C > 0 then
    for I := 0 to C - 1 do
  begin
    SetLength(fileName, MAX_PATH);
    R := Everything_GetResultFullPathName(I, PChar(fileName), MAX_PATH);
    SetLength(fileName, R);

    dwAttributes := Everything_GetResultAttributes(I);
    fileAttrib := FormatFileAttrib(dwAttributes);
    fileAttrib := Format('%6s', [fileAttrib]);

    Everything_GetResultSize(I, nSize);
    if dwAttributes and faDirectory <> 0 then
      fileSize := '-1'
    else fileSize := FormatFloat('#,#.#',nSize);
    fileSize := Format('%16s', [fileSize]);

    if Everything_GetResultDateModified(I, ftModified) then
      fileTime := FormatDateTime('yyyy/mm/dd hh:nn:ss', FileTimeToDateTime(ftModified))
    else fileTime := StringOfChar(' ', 19);

    Writeln(fileTime, ' ', fileAttrib, ' ', fileSize, ' ', fileName);
  end;
end;

begin
  try
    WriteLn('Everything: ', Everything_GetVersion);
    WriteLn('');
    Execute('*.iso');
    WriteLn('');
    WriteLn('Done.');
  except
    on E: Exception do
      WriteLn('Error: ', E.Message);
  end;
  ReadLn;
  Everything_CleanUp;
end.
