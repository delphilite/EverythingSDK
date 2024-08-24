# EverythingSDK
EverythingSDK is a [Delphi](http://www.embarcadero.com/products/delphi) and [Free Pascal](https://www.freepascal.org/) client library for [Voidtools' Everything](https://www.voidtools.com/) search engine, with the native Everything SDK dll.

Everything is a powerful search engine that can index and search for files, folders, and other data on your Windows system. The official C++ SDK provides a way to access the Everything database and perform searches programmatically. This repository provides a Delphi translation of the C++ SDK, allowing Delphi developers to easily integrate Everything search functionality into their applications.

Everything service must be running on your machine.

## Features
- Complete translation of Everything's C++ SDK to Delphi.
- Easy integration with Delphi projects.
- Supports all major features of the original SDK.

## Requirements
- Delphi XE2 or later.
- Everything 1.4.1 or later.

## Installation
To install the EverythingSDK binding, follow these steps:

1. Clone the repository:
    ```sh
    git clone https://github.com/delphilite/EverythingSDK.git
    ```

2. Add the EverythingSDK\Source directory to the project or IDE's search path.
3. Make sure Everything is installed and running on your system.

## Usage
Here's a simple example demonstrating how to use the EverythingSDK in a Delphi application:

```pas
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
  ReportMemoryLeaksOnShutdown := True;
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
```

For more examples based on low-level API, refer to the test cases under the demos directory.

## Documentation
For more detailed information, refer to the [Everything SDK](https://www.voidtools.com/support/everything/sdk/).

## Contributing
Contributions are welcome! Please fork this repository and submit pull requests with your improvements.

## License
This project is licensed under the Mozilla Public License 2.0. See the [LICENSE](LICENSE) file for details.

## Acknowledgements
Special thanks to Voidtools for creating Everything and providing the original SDK.
