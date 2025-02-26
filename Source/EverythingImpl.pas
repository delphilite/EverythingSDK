{ ***************************************************** }
{                                                       }
{  Pascal language binding for Everything SDK           }
{                                                       }
{  Unit Name: Everything Api Header                     }
{     Author: Lsuper 2024.08.01                         }
{    Purpose: Everything.h + Everything.c               }
{    License: Mozilla Public License 2.0                }
{                                                       }
{  Copyright (c) 1998-2024 Super Studio                 }
{                                                       }
{ ***************************************************** }

{$IFDEF FPC}
  {$MODE DELPHI}
  {$WARNINGS OFF}
  {$HINTS OFF}
{$ENDIF FPC}

{$ALIGN ON}
{$MINENUMSIZE 4}
{$WEAKPACKAGEUNIT}

unit EverythingImpl;

interface

uses
  Windows;

const
  EVERYTHING_SDK_VERSION                                 = 2; // if not defined, version is 1.

  EVERYTHING_OK                                          = 0; // no error detected
  EVERYTHING_ERROR_MEMORY                                = 1; // out of memory.
  EVERYTHING_ERROR_IPC                                   = 2; // Everything search client is not running
  EVERYTHING_ERROR_REGISTERCLASSEX                       = 3; // unable to register window class.
  EVERYTHING_ERROR_CREATEWINDOW                          = 4; // unable to create listening window
  EVERYTHING_ERROR_CREATETHREAD                          = 5; // unable to create listening thread
  EVERYTHING_ERROR_INVALIDINDEX                          = 6; // invalid index
  EVERYTHING_ERROR_INVALIDCALL                           = 7; // invalid call
  EVERYTHING_ERROR_INVALIDREQUEST                        = 8; // invalid request data, request data first.
  EVERYTHING_ERROR_INVALIDPARAMETER                      = 9; // bad parameter.

  EVERYTHING_SORT_NAME_ASCENDING                         = 1;
  EVERYTHING_SORT_NAME_DESCENDING                        = 2;
  EVERYTHING_SORT_PATH_ASCENDING                         = 3;
  EVERYTHING_SORT_PATH_DESCENDING                        = 4;
  EVERYTHING_SORT_SIZE_ASCENDING                         = 5;
  EVERYTHING_SORT_SIZE_DESCENDING                        = 6;
  EVERYTHING_SORT_EXTENSION_ASCENDING                    = 7;
  EVERYTHING_SORT_EXTENSION_DESCENDING                   = 8;
  EVERYTHING_SORT_TYPE_NAME_ASCENDING                    = 9;
  EVERYTHING_SORT_TYPE_NAME_DESCENDING                   = 10;
  EVERYTHING_SORT_DATE_CREATED_ASCENDING                 = 11;
  EVERYTHING_SORT_DATE_CREATED_DESCENDING                = 12;
  EVERYTHING_SORT_DATE_MODIFIED_ASCENDING                = 13;
  EVERYTHING_SORT_DATE_MODIFIED_DESCENDING               = 14;
  EVERYTHING_SORT_ATTRIBUTES_ASCENDING                   = 15;
  EVERYTHING_SORT_ATTRIBUTES_DESCENDING                  = 16;
  EVERYTHING_SORT_FILE_LIST_FILENAME_ASCENDING           = 17;
  EVERYTHING_SORT_FILE_LIST_FILENAME_DESCENDING          = 18;
  EVERYTHING_SORT_RUN_COUNT_ASCENDING                    = 19;
  EVERYTHING_SORT_RUN_COUNT_DESCENDING                   = 20;
  EVERYTHING_SORT_DATE_RECENTLY_CHANGED_ASCENDING        = 21;
  EVERYTHING_SORT_DATE_RECENTLY_CHANGED_DESCENDING       = 22;
  EVERYTHING_SORT_DATE_ACCESSED_ASCENDING                = 23;
  EVERYTHING_SORT_DATE_ACCESSED_DESCENDING               = 24;
  EVERYTHING_SORT_DATE_RUN_ASCENDING                     = 25;
  EVERYTHING_SORT_DATE_RUN_DESCENDING                    = 26;

  EVERYTHING_REQUEST_FILE_NAME                           = $00000001;
  EVERYTHING_REQUEST_PATH                                = $00000002;
  EVERYTHING_REQUEST_FULL_PATH_AND_FILE_NAME             = $00000004;
  EVERYTHING_REQUEST_EXTENSION                           = $00000008;
  EVERYTHING_REQUEST_SIZE                                = $00000010;
  EVERYTHING_REQUEST_DATE_CREATED                        = $00000020;
  EVERYTHING_REQUEST_DATE_MODIFIED                       = $00000040;
  EVERYTHING_REQUEST_DATE_ACCESSED                       = $00000080;
  EVERYTHING_REQUEST_ATTRIBUTES                          = $00000100;
  EVERYTHING_REQUEST_FILE_LIST_FILE_NAME                 = $00000200;
  EVERYTHING_REQUEST_RUN_COUNT                           = $00000400;
  EVERYTHING_REQUEST_DATE_RUN                            = $00000800;
  EVERYTHING_REQUEST_DATE_RECENTLY_CHANGED               = $00001000;
  EVERYTHING_REQUEST_HIGHLIGHTED_FILE_NAME               = $00002000;
  EVERYTHING_REQUEST_HIGHLIGHTED_PATH                    = $00004000;
  EVERYTHING_REQUEST_HIGHLIGHTED_FULL_PATH_AND_FILE_NAME = $00008000;

  EVERYTHING_TARGET_MACHINE_X86                          = 1;
  EVERYTHING_TARGET_MACHINE_X64                          = 2;
  EVERYTHING_TARGET_MACHINE_ARM                          = 3;

  // Write search state
  procedure Everything_SetSearchW(lpString: PWideChar); stdcall;
  procedure Everything_SetSearchA(lpString: PAnsiChar); stdcall;
  procedure Everything_SetMatchPath(bEnable: BOOL); stdcall;
  procedure Everything_SetMatchCase(bEnable: BOOL); stdcall;
  procedure Everything_SetMatchWholeWord(bEnable: BOOL); stdcall;
  procedure Everything_SetRegex(bEnable: BOOL); stdcall;
  procedure Everything_SetMax(dwMax: DWORD); stdcall;
  procedure Everything_SetOffset(dwOffset: DWORD); stdcall;
  procedure Everything_SetReplyWindow(hWnd: HWND); stdcall;
  procedure Everything_SetReplyID(dwId: DWORD); stdcall;
  // Everything 1.4.1
  procedure Everything_SetSort(dwSort: DWORD); stdcall;
  // Everything 1.4.1
  procedure Everything_SetRequestFlags(dwRequestFlags: DWORD); stdcall;

  // Read search state
  function  Everything_GetMatchPath: BOOL; stdcall;
  function  Everything_GetMatchCase: BOOL; stdcall;
  function  Everything_GetMatchWholeWord: BOOL; stdcall;
  function  Everything_GetRegex: BOOL; stdcall;
  function  Everything_GetMax: DWORD; stdcall;
  function  Everything_GetOffset: DWORD; stdcall;
  function  Everything_GetSearchA: PAnsiChar; stdcall;
  function  Everything_GetSearchW: PWideChar; stdcall;
  function  Everything_GetLastError: DWORD; stdcall;
  function  Everything_GetReplyWindow: HWND; stdcall;
  function  Everything_GetReplyID: DWORD; stdcall;
  // Everything 1.4.1
  function  Everything_GetSort: DWORD; stdcall;
  // Everything 1.4.1
  function  Everything_GetRequestFlags: DWORD; stdcall;

  // Execute query
  function  Everything_QueryA(bWait: BOOL): BOOL; stdcall;
  function  Everything_QueryW(bWait: BOOL): BOOL; stdcall;

  // Query reply
  function  Everything_IsQueryReply(message: UINT; wParam: WPARAM; lParam: LPARAM; dwId: DWORD): BOOL; stdcall;

  // Write result state
  procedure Everything_SortResultsByPath; stdcall;

  // Read result state
  function  Everything_GetNumFileResults: DWORD; stdcall;
  function  Everything_GetNumFolderResults: DWORD; stdcall;
  function  Everything_GetNumResults: DWORD; stdcall;
  function  Everything_GetTotFileResults: DWORD; stdcall;
  function  Everything_GetTotFolderResults: DWORD; stdcall;
  function  Everything_GetTotResults: DWORD; stdcall;
  function  Everything_IsVolumeResult(dwIndex: DWORD): BOOL; stdcall;
  function  Everything_IsFolderResult(dwIndex: DWORD): BOOL; stdcall;
  function  Everything_IsFileResult(dwIndex: DWORD): BOOL; stdcall;
  function  Everything_GetResultFileNameW(dwIndex: DWORD): PWideChar; stdcall;
  function  Everything_GetResultFileNameA(dwIndex: DWORD): PAnsiChar; stdcall;
  function  Everything_GetResultPathW(dwIndex: DWORD): PWideChar; stdcall;
  function  Everything_GetResultPathA(dwIndex: DWORD): PAnsiChar; stdcall;
  function  Everything_GetResultFullPathNameA(dwIndex: DWORD; buf: PAnsiChar; bufsize: DWORD): DWORD; stdcall;
  function  Everything_GetResultFullPathNameW(dwIndex: DWORD; wbuf: PWideChar; wbuf_size_in_wchars: DWORD): DWORD; stdcall;
  // Everything 1.4.1
  function  Everything_GetResultListSort: DWORD; stdcall;
  // Everything 1.4.1
  function  Everything_GetResultListRequestFlags: DWORD; stdcall;
  // Everything 1.4.1
  function  Everything_GetResultExtensionW(dwIndex: DWORD): PWideChar; stdcall;
  // Everything 1.4.1
  function  Everything_GetResultExtensionA(dwIndex: DWORD): PAnsiChar; stdcall;
  // Everything 1.4.1
  function  Everything_GetResultSize(dwIndex: DWORD; var lpSize: Int64): BOOL; stdcall;
  // Everything 1.4.1
  function  Everything_GetResultDateCreated(dwIndex: DWORD; var lpDateCreated: TFileTime): BOOL; stdcall;
  // Everything 1.4.1
  function  Everything_GetResultDateModified(dwIndex: DWORD; var lpDateModified: TFileTime): BOOL; stdcall;
  // Everything 1.4.1
  function  Everything_GetResultDateAccessed(dwIndex: DWORD; var lpDateAccessed: TFileTime): BOOL; stdcall;
  // Everything 1.4.1
  function  Everything_GetResultAttributes(dwIndex: DWORD): DWORD; stdcall;
  // Everything 1.4.1
  function  Everything_GetResultFileListFileNameW(dwIndex: DWORD): PWideChar; stdcall;
  // Everything 1.4.1
  function  Everything_GetResultFileListFileNameA(dwIndex: DWORD): PAnsiChar; stdcall;
  // Everything 1.4.1
  function  Everything_GetResultRunCount(dwIndex: DWORD): DWORD; stdcall;
  function  Everything_GetResultDateRun(dwIndex: DWORD; var lpDateRun: TFileTime): BOOL; stdcall;
  function  Everything_GetResultDateRecentlyChanged(dwIndex: DWORD; var lpDateRecentlyChanged: TFileTime): BOOL; stdcall;
  // Everything 1.4.1
  function  Everything_GetResultHighlightedFileNameW(dwIndex: DWORD): PWideChar; stdcall;
  // Everything 1.4.1
  function  Everything_GetResultHighlightedFileNameA(dwIndex: DWORD): PAnsiChar; stdcall;
  // Everything 1.4.1
  function  Everything_GetResultHighlightedPathW(dwIndex: DWORD): PWideChar; stdcall;
  // Everything 1.4.1
  function  Everything_GetResultHighlightedPathA(dwIndex: DWORD): PAnsiChar; stdcall;
  // Everything 1.4.1
  function  Everything_GetResultHighlightedFullPathAndFileNameW(dwIndex: DWORD): PWideChar; stdcall;
  // Everything 1.4.1
  function  Everything_GetResultHighlightedFullPathAndFileNameA(dwIndex: DWORD): PAnsiChar; stdcall;

  // Reset state and free any allocated memory
  procedure Everything_Reset; stdcall;
  procedure Everything_CleanUp; stdcall;

  function  Everything_GetMajorVersion: DWORD; stdcall;
  function  Everything_GetMinorVersion: DWORD; stdcall;
  function  Everything_GetRevision: DWORD; stdcall;
  function  Everything_GetBuildNumber: DWORD; stdcall;
  function  Everything_Exit: BOOL; stdcall;

  function  Everything_MSIExitAndStopService(msihandle: Pointer): UINT; stdcall;
  function  Everything_MSIStartService(msihandle: Pointer): UINT; stdcall;

  // Everything 1.4.1
  function  Everything_IsDBLoaded: BOOL; stdcall;
  // Everything 1.4.1
  function  Everything_IsAdmin: BOOL; stdcall;
  // Everything 1.4.1
  function  Everything_IsAppData: BOOL; stdcall;
  // Everything 1.4.1
  function  Everything_RebuildDB: BOOL; stdcall;
  // Everything 1.4.1
  function  Everything_UpdateAllFolderIndexes: BOOL; stdcall;
  // Everything 1.4.1
  function  Everything_SaveDB: BOOL; stdcall;
  // Everything 1.4.1
  function  Everything_SaveRunHistory: BOOL; stdcall;
  // Everything 1.4.1
  function  Everything_DeleteRunHistory: BOOL; stdcall;
  // Everything 1.4.1
  function  Everything_GetTargetMachine: DWORD; stdcall;
  // Everything 1.4.1.859
  function  Everything_IsFastSort(sortType: DWORD): BOOL; stdcall;
  // Everything 1.4.1.859
  function  Everything_IsFileInfoIndexed(fileInfoType: DWORD): BOOL; stdcall;

  // Everything 1.4.1
  function  Everything_GetRunCountFromFileNameW(lpFileName: PWideChar): DWORD; stdcall;
  // Everything 1.4.1
  function  Everything_GetRunCountFromFileNameA(lpFileName: PAnsiChar): DWORD; stdcall;
  // Everything 1.4.1
  function  Everything_SetRunCountFromFileNameW(lpFileName: PWideChar; dwRunCount: DWORD): BOOL; stdcall;
  // Everything 1.4.1
  function  Everything_SetRunCountFromFileNameA(lpFileName: PAnsiChar; dwRunCount: DWORD): BOOL; stdcall;
  // Everything 1.4.1
  function  Everything_IncRunCountFromFileNameW(lpFileName: PWideChar): DWORD; stdcall;
  // Everything 1.4.1
  function  Everything_IncRunCountFromFileNameA(lpFileName: PAnsiChar): DWORD; stdcall;

  // Retrieves a Human-Readable error message corresponding to a given error code
  function  Everything_GetErrorMessage(ACode: Integer): string;
  // Retrieves the current version of the Everything SDK
  function  Everything_GetVersion: string;

type
  // Ansi+Unicode version types
  TEverything_SetSearch = procedure(lpString: PChar); stdcall;
  TEverything_GetSearch = function: PChar; stdcall;
  TEverything_Query = function(bWait: BOOL): BOOL; stdcall;
{
  TEverything_Query2 = function(bWait: BOOL; pContext: Pointer): BOOL; stdcall;
}
  TEverything_GetResultFileName = function(dwIndex: DWORD): PChar; stdcall;
  TEverything_GetResultPath = function(dwIndex: DWORD): PChar; stdcall;
  TEverything_GetResultFullPathName = function(dwIndex: DWORD; buf: PChar; bufsize: DWORD): DWORD; stdcall;
  TEverything_GetResultExtension = function(dwIndex: DWORD): PChar; stdcall;
  TEverything_GetResultFileListFileName = function(dwIndex: DWORD): PChar; stdcall;
  TEverything_GetResultHighlightedFileName = function(dwIndex: DWORD): PChar; stdcall;
  TEverything_GetResultHighlightedPath = function(dwIndex: DWORD): PChar; stdcall;
  TEverything_GetResultHighlightedFullPathAndFileName = function(dwIndex: DWORD): PChar; stdcall;
  TEverything_GetRunCountFromFileName = function(lpFileName: PChar): DWORD; stdcall;
  TEverything_SetRunCountFromFileName = function(lpFileName: PChar; dwRunCount: DWORD): BOOL; stdcall;
  TEverything_IncRunCountFromFileName = function(lpFileName: PChar): DWORD; stdcall;

const
  // Ansi+Unicode version function
  Everything_SetSearch: TEverything_SetSearch = {$IFDEF UNICODE}Everything_SetSearchW{$ELSE}Everything_SetSearchA{$ENDIF};
  Everything_GetSearch: TEverything_GetSearch = {$IFDEF UNICODE}Everything_GetSearchW{$ELSE}Everything_GetSearchA{$ENDIF};
  Everything_Query: TEverything_Query = {$IFDEF UNICODE}Everything_QueryW{$ELSE}Everything_QueryA{$ENDIF};

//  Everything_Query2: TEverything_Query2 = {$IFDEF UNICODE}Everything_Query2W{$ELSE}Everything_Query2A{$ENDIF};

  Everything_GetResultFileName: TEverything_GetResultFileName = {$IFDEF UNICODE}Everything_GetResultFileNameW{$ELSE}Everything_GetResultFileNameA{$ENDIF};
  Everything_GetResultPath: TEverything_GetResultPath = {$IFDEF UNICODE}Everything_GetResultPathW{$ELSE}Everything_GetResultPathA{$ENDIF};
  Everything_GetResultFullPathName: TEverything_GetResultFullPathName = {$IFDEF UNICODE}Everything_GetResultFullPathNameW{$ELSE}Everything_GetResultFullPathNameA{$ENDIF};
  Everything_GetResultExtension: TEverything_GetResultExtension = {$IFDEF UNICODE}Everything_GetResultExtensionW{$ELSE}Everything_GetResultExtensionA{$ENDIF};
  Everything_GetResultFileListFileName: TEverything_GetResultFileListFileName = {$IFDEF UNICODE}Everything_GetResultFileListFileNameW{$ELSE}Everything_GetResultFileListFileNameA{$ENDIF};
  Everything_GetResultHighlightedFileName: TEverything_GetResultHighlightedFileName = {$IFDEF UNICODE}Everything_GetResultHighlightedFileNameW{$ELSE}Everything_GetResultHighlightedFileNameA{$ENDIF};
  Everything_GetResultHighlightedPath: TEverything_GetResultHighlightedPath = {$IFDEF UNICODE}Everything_GetResultHighlightedPathW{$ELSE}Everything_GetResultHighlightedPathA{$ENDIF};
  Everything_GetResultHighlightedFullPathAndFileName: TEverything_GetResultHighlightedFullPathAndFileName = {$IFDEF UNICODE}Everything_GetResultHighlightedFullPathAndFileNameW{$ELSE}Everything_GetResultHighlightedFullPathAndFileNameA{$ENDIF};
  Everything_GetRunCountFromFileName: TEverything_GetRunCountFromFileName = {$IFDEF UNICODE}Everything_GetRunCountFromFileNameW{$ELSE}Everything_GetRunCountFromFileNameA{$ENDIF};
  Everything_SetRunCountFromFileName: TEverything_SetRunCountFromFileName = {$IFDEF UNICODE}Everything_SetRunCountFromFileNameW{$ELSE}Everything_SetRunCountFromFileNameA{$ENDIF};
  Everything_IncRunCountFromFileName: TEverything_IncRunCountFromFileName = {$IFDEF UNICODE}Everything_IncRunCountFromFileNameW{$ELSE}Everything_IncRunCountFromFileNameA{$ENDIF};

  // Everything.c internal function
  function  _Everything_Alloc(size: DWORD): Pointer;
  procedure _Everything_Free(ptr: Pointer);

  procedure _Everything_Initialize;
  procedure _Everything_Lock;
  procedure _Everything_Unlock;

  function  _Everything_StringLengthA(start: PAnsiChar): DWORD;
  function  _Everything_StringLengthW(start: PWideChar): DWORD;

  function  _Everything_Query: BOOL;
  function  _Everything_ShouldUseVersion2: BOOL;
  function  _Everything_SendIPCQuery: BOOL;
  function  _Everything_SendIPCQuery2(everything_hwnd: HWND): BOOL;
  procedure _Everything_FreeLists;
  function  _Everything_IsValidResultIndex(dwIndex: DWORD): BOOL;
  function  _Everything_GetRequestData(dwIndex: DWORD; dwRequestType: DWORD): Pointer;
  function  _Everything_IsSchemeNameW(s: PWideChar): BOOL;
  function  _Everything_IsSchemeNameA(s: PAnsiChar): BOOL;
  procedure _Everything_ChangeWindowMessageFilter(hwnd: HWND);
  function  _Everything_GetResultRequestData(dwIndex: DWORD; dwRequestType: DWORD; data: Pointer; size: Integer): BOOL;
  function  _Everything_GetResultRequestStringW(dwIndex: DWORD; dwRequestType: DWORD): PWideChar;
  function  _Everything_GetResultRequestStringA(dwIndex: DWORD; dwRequestType: DWORD): PAnsiChar;
  function  _Everything_SendAPIBoolCommand(command: Integer; lParam: LPARAM): BOOL;
  function  _Everything_SendAPIDwordCommand(command: Integer; lParam: LPARAM): DWORD;
  function  _Everything_SendCopyData(command: Integer; const data: Pointer; size: Integer): LRESULT;
  function  _Everything_GetNumResults: DWORD;

  function  _Everything_GetSearchflags: DWORD;

implementation

uses
  Messages, ShellAPI,
{$IFDEF FPC}
  JwaWinSvc,
{$ELSE}
  WinSvc,
{$ENDIF FPC}
  EverythingIPC;

type
  TEverythingErrorInfo = record
    Code: Integer;
    Description: string;
  end;

const
  defEverythingErrorInfos: array[0..7] of TEverythingErrorInfo = (
    (Code: EVERYTHING_OK;                    Description: 'The operation completed successfully.'),
    (Code: EVERYTHING_ERROR_MEMORY;          Description: 'Failed to allocate memory for the search query.'),
    (Code: EVERYTHING_ERROR_IPC;             Description: 'IPC is not available.'),
    (Code: EVERYTHING_ERROR_REGISTERCLASSEX; Description: 'Failed to register the search query window class.'),
    (Code: EVERYTHING_ERROR_CREATEWINDOW;    Description: 'Failed to create the search query window.'),
    (Code: EVERYTHING_ERROR_CREATETHREAD;    Description: 'Failed to create the search query thread.'),
    (Code: EVERYTHING_ERROR_INVALIDINDEX;    Description: 'Invalid index. The index must be greater or equal to 0 and less than the number of visible results.'),
    (Code: EVERYTHING_ERROR_INVALIDCALL;     Description: 'Invalid call.')
  );

resourcestring
  rsErrUnKnownErrorPrex  = 'Unknown Error code: ';

// Retrieves a Human-Readable error message corresponding to a given error code
function Everything_GetErrorMessage(ACode: Integer): string;

  function IntToStr(const Value: Integer): string;
  var
    aList: array[0..0] of Integer;
    sBuf: array[0..11] of Char;
  begin
    aList[0] := Value;
    wvsprintf(sBuf, '%d', PChar(@aList));
    Result := string(sBuf);
  end;
var
  I: Integer;
begin
  for I := Low(defEverythingErrorInfos) to High(defEverythingErrorInfos) do
    if defEverythingErrorInfos[I].Code = ACode then
  begin
    Result := defEverythingErrorInfos[I].Description;
    Exit;
  end;
  Result := rsErrUnKnownErrorPrex + IntToStr(ACode);
end;

// Retrieves the current version of the Everything SDK
function Everything_GetVersion: string;
var
  aList: array[0..3] of Integer;
  sBuf: array[0..63] of Char;
begin
  aList[0] := Everything_GetMajorVersion;
  aList[1] := Everything_GetMinorVersion;
  aList[2] := Everything_GetRevision;
  aList[3] := Everything_GetBuildNumber;

  wvsprintf(sBuf, '%d.%d.%d.%d', PChar(@aList));
  Result := string(sBuf);
end;

// return copydata code
const
  _EVERYTHING_COPYDATA_QUERYREPLY = 0;
  _EVERYTHING_MSGFLT_ALLOW = 1;

type
  _EVERYTHING_CHANGEFILTERSTRUCT = record
    cbSize: DWORD;
    ExtStatus: DWORD;
  end;
  _EVERYTHING_PCHANGEFILTERSTRUCT = ^_EVERYTHING_CHANGEFILTERSTRUCT;

// internal state
var
  _Everything_MatchPath: Boolean = False;
  _Everything_MatchCase: Boolean = False;
  _Everything_MatchWholeWord: Boolean = False;
  _Everything_Regex: Boolean = False;
  _Everything_LastError: DWORD = 0;
  _Everything_Max: DWORD = EVERYTHING_IPC_ALLRESULTS;
  _Everything_Offset: DWORD = 0;
  _Everything_Sort: DWORD = EVERYTHING_SORT_NAME_ASCENDING;
  _Everything_RequestFlags: DWORD = EVERYTHING_REQUEST_PATH or EVERYTHING_REQUEST_FILE_NAME;
  _Everything_IsUnicodeQuery: Boolean = False;
  _Everything_QueryVersion: DWORD = 0;
  _Everything_IsUnicodeSearch: Boolean = False;
  _Everything_Search: Pointer = nil; // PWideChar or PAnsiChar
  _Everything_List2: PEVERYTHING_IPC_LIST2 = nil;
  _Everything_List: Pointer = nil; // PEVERYTHING_IPC_LISTW or PEVERYTHING_IPC_LISTA
  _Everything_Initialized: Boolean = False;
  _Everything_InterlockedCount: Longint = 0;
  _Everything_cs: TRTLCriticalSection;
  _Everything_ReplyWindow: HWND = 0;
  _Everything_ReplyID: DWORD = 0;
  _Everything_pChangeWindowMessageFilterEx: function(hWnd: HWND; message: UINT; action: DWORD; pChangeFilterStruct: _EVERYTHING_PCHANGEFILTERSTRUCT): BOOL; stdcall = nil;
  _Everything_User32_HDll: THandle = 0;
  _Everything_GotChangeWindowMessageFilterEx: Boolean = False;

procedure _Everything_Initialize;
begin
  if not _Everything_Initialized then
  begin
    if InterlockedIncrement(_Everything_InterlockedCount) = 1 then
    begin
      // do the initialization..
      InitializeCriticalSection(_Everything_cs);

      _Everything_Initialized := True;
    end
    else
    begin
      // wait for initialization by other thread.
      while not _Everything_Initialized do
        Sleep(0);
    end;
  end;
end;

procedure _Everything_Lock;
begin
  _Everything_Initialize;
  EnterCriticalSection(_Everything_cs);
end;

procedure _Everything_Unlock;
begin
  LeaveCriticalSection(_Everything_cs);
end;

function _Everything_StringLengthA(start: PAnsiChar): DWORD;
begin
  Result := DWORD(lstrlenA(start));
end;

function _Everything_StringLengthW(start: PWideChar): DWORD;
begin
  Result := DWORD(lstrlenW(start));
end;

procedure Everything_SetSearchW(lpString: PWideChar);
var
  len: DWORD;
begin
  _Everything_Lock;

  if Assigned(_Everything_Search) then
  begin
    _Everything_Free(_Everything_Search);
    _Everything_Search := nil;
  end;

  len := _Everything_StringLengthW(lpString) + 1;

  _Everything_Search := _Everything_Alloc(len * SizeOf(WideChar));
  if Assigned(_Everything_Search) then
  begin
    CopyMemory(_Everything_Search, lpString, len * SizeOf(WideChar));
  end
  else
  begin
    _Everything_LastError := EVERYTHING_ERROR_MEMORY;
  end;

  _Everything_IsUnicodeSearch := True;

  _Everything_Unlock;
end;

procedure Everything_SetSearchA(lpString: PAnsiChar);
var
  size: DWORD;
begin
  _Everything_Lock;

  if Assigned(_Everything_Search) then
  begin
    _Everything_Free(_Everything_Search);
    _Everything_Search := nil;
  end;

  size := _Everything_StringLengthA(lpString) + 1;

  _Everything_Search := _Everything_Alloc(size);
  if Assigned(_Everything_Search) then
  begin
    CopyMemory(_Everything_Search, lpString, size);
  end
  else
  begin
    _Everything_LastError := EVERYTHING_ERROR_MEMORY;
  end;

  _Everything_IsUnicodeSearch := False;

  _Everything_Unlock;
end;

function Everything_GetSearchA: PAnsiChar;
var
  ret: PAnsiChar;
begin
  _Everything_Lock;

  if Assigned(_Everything_Search) then
  begin
    if _Everything_IsUnicodeSearch then
    begin
      _Everything_LastError := EVERYTHING_ERROR_INVALIDCALL;
      ret := nil;
    end
    else
    begin
      ret := PAnsiChar(_Everything_Search);
    end;
  end
  else
  begin
    ret := PAnsiChar('');
  end;

  _Everything_Unlock;

  Result := ret;
end;

function Everything_GetSearchW: PWideChar;
var
  ret: PWideChar;
begin
  _Everything_Lock;

  if Assigned(_Everything_Search) then
  begin
    if not _Everything_IsUnicodeSearch then
    begin
      _Everything_LastError := EVERYTHING_ERROR_INVALIDCALL;
      ret := nil;
    end
    else
    begin
      ret := PWideChar(_Everything_Search);
    end;
  end
  else
  begin
    ret := PWideChar('');
  end;

  _Everything_Unlock;

  Result := ret;
end;

procedure Everything_SetMatchPath(bEnable: BOOL);
begin
  _Everything_Lock;

  _Everything_MatchPath := bEnable;

  _Everything_Unlock;
end;

procedure Everything_SetMatchCase(bEnable: BOOL);
begin
  _Everything_Lock;

  _Everything_MatchCase := bEnable;

  _Everything_Unlock;
end;

procedure Everything_SetMatchWholeWord(bEnable: BOOL);
begin
  _Everything_Lock;

  _Everything_MatchWholeWord := bEnable;

  _Everything_Unlock;
end;

procedure Everything_SetRegex(bEnable: BOOL);
begin
  _Everything_Lock;

  _Everything_Regex := bEnable;

  _Everything_Unlock;
end;

procedure Everything_SetMax(dwMax: DWORD);
begin
  _Everything_Lock;

  _Everything_Max := dwMax;

  _Everything_Unlock;
end;

procedure Everything_SetOffset(dwOffset: DWORD);
begin
  _Everything_Lock;

  _Everything_Offset := dwOffset;

  _Everything_Unlock;
end;

procedure Everything_SetSort(dwSort: DWORD);
begin
  _Everything_Lock;

  _Everything_Sort := dwSort;

  _Everything_Unlock;
end;

procedure Everything_SetRequestFlags(dwRequestFlags: DWORD);
begin
  _Everything_Lock;

  _Everything_RequestFlags := dwRequestFlags;

  _Everything_Unlock;
end;

procedure Everything_SetReplyWindow(hWnd: HWND);
begin
  _Everything_Lock;

  _Everything_ReplyWindow := hWnd;

  _Everything_Unlock;
end;

procedure Everything_SetReplyID(dwId: DWORD);
begin
  _Everything_Lock;

  _Everything_ReplyID := dwId;

  _Everything_Unlock;
end;

function Everything_GetMatchPath: BOOL;
var
  ret: BOOL;
begin
  _Everything_Lock;

  ret := _Everything_MatchPath;

  _Everything_Unlock;

  Result := ret;
end;

function Everything_GetMatchCase: BOOL;
var
  ret: BOOL;
begin
  _Everything_Lock;

  ret := _Everything_MatchCase;

  _Everything_Unlock;

  Result := ret;
end;

function Everything_GetMatchWholeWord: BOOL;
var
  ret: BOOL;
begin
  _Everything_Lock;

  ret := _Everything_MatchWholeWord;

  _Everything_Unlock;

  Result := ret;
end;

function Everything_GetRegex: BOOL;
var
  ret: BOOL;
begin
  _Everything_Lock;

  ret := _Everything_Regex;

  _Everything_Unlock;

  Result := ret;
end;

function Everything_GetMax: DWORD;
var
  ret: DWORD;
begin
  _Everything_Lock;

  ret := _Everything_Max;

  _Everything_Unlock;

  Result := ret;
end;

function Everything_GetOffset: DWORD;
var
  ret: DWORD;
begin
  _Everything_Lock;

  ret := _Everything_Offset;

  _Everything_Unlock;

  Result := ret;
end;

function Everything_GetSort: DWORD;
var
  ret: DWORD;
begin
  _Everything_Lock;

  ret := _Everything_Sort;

  _Everything_Unlock;

  Result := ret;
end;

function Everything_GetRequestFlags: DWORD;
var
  ret: DWORD;
begin
  _Everything_Lock;

  ret := _Everything_RequestFlags;

  _Everything_Unlock;

  Result := ret;
end;

function Everything_GetReplyWindow: HWND;
var
  ret: HWND;
begin
  _Everything_Lock;

  ret := _Everything_ReplyWindow;

  _Everything_Unlock;

  Result := ret;
end;

function Everything_GetReplyID: DWORD;
var
  ret: DWORD;
begin
  _Everything_Lock;

  ret := _Everything_ReplyID;

  _Everything_Unlock;

  Result := ret;
end;

// custom window proc
function _Everything_Window_Proc(hwnd: HWND; msg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
var
  cds: PCOPYDATASTRUCT;
begin
  case msg of
    WM_COPYDATA:
      begin
        cds := PCOPYDATASTRUCT(lParam);

        case cds^.dwData of
          _EVERYTHING_COPYDATA_QUERYREPLY:
            begin
              if _Everything_QueryVersion = 2 then
              begin
                _Everything_FreeLists;

                _Everything_List2 := _Everything_Alloc(cds^.cbData);

                if Assigned(_Everything_List2) then
                begin
                  CopyMemory(_Everything_List2, cds^.lpData, cds^.cbData);
                end
                else
                begin
                  _Everything_LastError := EVERYTHING_ERROR_MEMORY;
                end;

                PostQuitMessage(0);

                Result := 1; { True }
                Exit;
              end
              else if _Everything_QueryVersion = 1 then
              begin
                _Everything_FreeLists;

                _Everything_List := _Everything_Alloc(cds^.cbData);

                if Assigned(_Everything_List) then
                begin
                  CopyMemory(_Everything_List, cds^.lpData, cds^.cbData);
                end
                else
                begin
                  _Everything_LastError := EVERYTHING_ERROR_MEMORY;
                end;

                PostQuitMessage(0);

                Result := 1; { True }
                Exit;
              end;
            end;
        end;
      end;
  end;

  Result := DefWindowProc(hwnd, msg, wParam, lParam);
end;

function _Everything_GetSearchLengthW: DWORD;
begin
  if Assigned(_Everything_Search) then
  begin
    if _Everything_IsUnicodeSearch then
    begin
      Result := _Everything_StringLengthW(PWideChar(_Everything_Search));
    end
    else
    begin
      Result := MultiByteToWideChar(CP_ACP, 0, PAnsiChar(_Everything_Search), -1, nil, 0);
    end;
  end
  else
  begin
    Result := 0;
  end;
end;

function _Everything_GetSearchLengthA: DWORD;
begin
  if Assigned(_Everything_Search) then
  begin
    if _Everything_IsUnicodeSearch then
    begin
      Result := WideCharToMultiByte(CP_ACP, 0, PWideChar(_Everything_Search), -1, nil, 0, nil, nil);
    end
    else
    begin
      Result := _Everything_StringLengthA(PAnsiChar(_Everything_Search));
    end;
  end
  else
  begin
    Result := 0;
  end;
end;

procedure _Everything_GetSearchTextW(wbuf: PWideChar);
var
  wlen: DWORD;
begin
  if Assigned(_Everything_Search) then
  begin
    wlen := _Everything_GetSearchLengthW;

    if _Everything_IsUnicodeSearch then
    begin
      CopyMemory(wbuf, _Everything_Search, (wlen + 1) * SizeOf(WideChar));
    end
    else
    begin
      MultiByteToWideChar(CP_ACP, 0, PAnsiChar(_Everything_Search), -1, wbuf, wlen + 1);
    end;
  end
  else
  begin
    wbuf^ := #0;
  end;
end;

procedure _Everything_GetSearchTextA(buf: PAnsiChar);
var
  len: DWORD;
begin
  if Assigned(_Everything_Search) then
  begin
    len := _Everything_GetSearchLengthA;

    if _Everything_IsUnicodeSearch then
    begin
      WideCharToMultiByte(CP_ACP, 0, PWideChar(_Everything_Search), -1, buf, len + 1, nil, nil);
    end
    else
    begin
      CopyMemory(buf, _Everything_Search, len + 1);
    end;
  end
  else
  begin
    buf^ := #0;
  end;
end;

function _Everything_Query_Thread_Proc(param: Pointer): DWORD; stdcall;
var
  everything_hwnd: HWND;
  wcex: TWndClassEx;
  hwnd: WIndows.HWND;
  msg: TMsg;
begin
  // find the everything ipc window.
  everything_hwnd := FindWindow(PChar(EVERYTHING_IPC_WNDCLASS), nil);
  if everything_hwnd <> 0 then
  begin
    ZeroMemory(@wcex, SizeOf(TWndClassEx));
    wcex.cbSize := SizeOf(TWndClassEx);

    if not GetClassInfoEx(HInstance, 'EVERYTHING_DLL', wcex) then
    begin
      ZeroMemory(@wcex, SizeOf(TWndClassEx));
      wcex.cbSize := SizeOf(TWndClassEx);
      wcex.hInstance := HInstance;
      wcex.lpfnWndProc := @_Everything_Window_Proc;
      wcex.lpszClassName := 'EVERYTHING_DLL';

      if RegisterClassEx(wcex) = 0 then
      begin
        _Everything_LastError := EVERYTHING_ERROR_REGISTERCLASSEX;
        Result := 0;
        Exit;
      end;
    end;

    hwnd := CreateWindow(
      'EVERYTHING_DLL',
      '',
      0,
      0, 0, 0, 0,
      0, 0, HInstance, nil
    );

    if hwnd <> 0 then
    try
      _Everything_ChangeWindowMessageFilter(hwnd);

      _Everything_ReplyWindow := hwnd;
      _Everything_ReplyID := _EVERYTHING_COPYDATA_QUERYREPLY;

      if _Everything_SendIPCQuery then
      begin
        // message pump
        repeat
          WaitMessage;

          // update windows
          while PeekMessage(msg, 0, 0, 0, PM_REMOVE) do
          begin
            if Msg.Message = WM_QUIT then
            begin
              Result := 0;
              Exit;
            end;
            // let windows handle it.
            TranslateMessage(msg);
            DispatchMessage(msg);
          end;
        until False;
      end;
    finally
      // get result from window.
      DestroyWindow(hwnd);
    end
    else
    begin
      _Everything_LastError := EVERYTHING_ERROR_CREATEWINDOW;
    end;
  end
  else
  begin
    // the everything window was not found.
    // we can optionally RegisterWindowMessage('EVERYTHING_IPC_CREATED') and
    // wait for Everything to post this message to all top level windows when its up and running.
    _Everything_LastError := EVERYTHING_ERROR_IPC;
  end;

  Result := 0;
end;

function _Everything_Query: BOOL;
var
  hthread: THandle;
  thread_id: DWORD;
begin
  // reset the error flag.
  _Everything_LastError := 0;

  hthread := CreateThread(nil, 0, @_Everything_Query_Thread_Proc, nil, 0, thread_id);

  if hthread <> 0 then
  begin
    WaitForSingleObject(hthread, INFINITE);
    CloseHandle(hthread);
  end
  else
  begin
    _Everything_LastError := EVERYTHING_ERROR_CREATETHREAD;
  end;

  Result := (_Everything_LastError = 0);
end;

function _Everything_SendIPCQuery2(everything_hwnd: HWND): BOOL;
var
  ret: BOOL;
  size: DWORD;
  query: PEVERYTHING_IPC_QUERY2;
  cds: COPYDATASTRUCT;
begin
  // try version 2.

  if _Everything_IsUnicodeQuery then
  begin
    // unicode
    size := SizeOf(EVERYTHING_IPC_QUERY2) + ((_Everything_GetSearchLengthW() + 1) * SizeOf(WCHAR));
  end
  else
  begin
    // ansi
    size := SizeOf(EVERYTHING_IPC_QUERY2) + ((_Everything_GetSearchLengthA() + 1) * SizeOf(Char));
  end;

  // alloc
  query := _Everything_Alloc(size);

  if Assigned(query) then
  begin
    cds.cbData := size;
    cds.lpData := query;

    query^.max_results := _Everything_Max;
    query^.offset := _Everything_Offset;
    query^.reply_copydata_message := _Everything_ReplyID;
    query^.search_flags := _Everything_GetSearchflags;
    query^.reply_hwnd := DWORD_PTR(_Everything_ReplyWindow);
    query^.sort_type := _Everything_Sort;
    query^.request_flags := _Everything_RequestFlags;

    if _Everything_IsUnicodeQuery then
    begin
      _Everything_GetSearchTextW(PWideChar(NativeUInt(query) + SizeOf(EVERYTHING_IPC_QUERY2)));
      cds.dwData := EVERYTHING_IPC_COPYDATA_QUERY2W;
    end
    else
    begin
      _Everything_GetSearchTextA(PAnsiChar(NativeUInt(query) + SizeOf(EVERYTHING_IPC_QUERY2)));
      cds.dwData := EVERYTHING_IPC_COPYDATA_QUERY2A;
    end;

    if SendMessage(everything_hwnd, WM_COPYDATA, WPARAM(_Everything_ReplyWindow), LPARAM(@cds)) <> 0 then
    begin
      // successful.
      ret := True;
    end
    else
    begin
      // no ipc
      _Everything_LastError := EVERYTHING_ERROR_IPC;
      ret := False;
    end;

    // get result from window.
    _Everything_Free(query);
  end
  else
  begin
    _Everything_LastError := EVERYTHING_ERROR_MEMORY;
    ret := False;
  end;

  Result := ret;
end;

function _Everything_ShouldUseVersion2: BOOL;
begin
  if _Everything_RequestFlags <> (EVERYTHING_REQUEST_PATH or EVERYTHING_REQUEST_FILE_NAME) then
  begin
    Result := True;
    Exit;
  end;
  if _Everything_Sort <> EVERYTHING_SORT_NAME_ASCENDING then
  begin
    Result := True;
    Exit;
  end;
  // just use version 1
  Result := False;
end;

function _Everything_SendIPCQuery: BOOL;
var
  everything_hwnd: HWND;
  len: DWORD;
  size: DWORD;
  query: Pointer;
  cds: COPYDATASTRUCT;
begin
  // find the everything ipc window.
  everything_hwnd := FindWindow(PChar(EVERYTHING_IPC_WNDCLASS), nil);
  if everything_hwnd <> 0 then
  begin
    _Everything_QueryVersion := 2;

    // try version 2 first (if we specified some non-version 1 request flags or sort)
    if (_Everything_ShouldUseVersion2 and _Everything_SendIPCQuery2(everything_hwnd)) then
    begin
      // successful.
      Result := True;
      Exit;
    end;

    // try version 1.
    if _Everything_IsUnicodeQuery then
    begin
      // unicode
      len := _Everything_GetSearchLengthW();
      size := SizeOf(EVERYTHING_IPC_QUERYW) - SizeOf(WCHAR) + len * SizeOf(WCHAR) + SizeOf(WCHAR);
    end
    else
    begin
      // ansi
      len := _Everything_GetSearchLengthA();
      size := SizeOf(EVERYTHING_IPC_QUERYA) - SizeOf(Char) + len * SizeOf(Char) + SizeOf(Char);
    end;

    // alloc
    query := _Everything_Alloc(size);

    if Assigned(query) then
    begin
      if _Everything_IsUnicodeQuery then
      begin
        PEVERYTHING_IPC_QUERYW(query)^.max_results := _Everything_Max;
        PEVERYTHING_IPC_QUERYW(query)^.offset := _Everything_Offset;
        PEVERYTHING_IPC_QUERYW(query)^.reply_copydata_message := _Everything_ReplyID;
        PEVERYTHING_IPC_QUERYW(query)^.search_flags := _Everything_GetSearchflags;
        PEVERYTHING_IPC_QUERYW(query)^.reply_hwnd := DWORD_PTR(_Everything_ReplyWindow);

        _Everything_GetSearchTextW(PWideChar(NativeUInt(query) + SizeOf(EVERYTHING_IPC_QUERYW)));
      end
      else
      begin
        PEVERYTHING_IPC_QUERYA(query)^.max_results := _Everything_Max;
        PEVERYTHING_IPC_QUERYA(query)^.offset := _Everything_Offset;
        PEVERYTHING_IPC_QUERYA(query)^.reply_copydata_message := _Everything_ReplyID;
        PEVERYTHING_IPC_QUERYA(query)^.search_flags := _Everything_GetSearchflags;
        PEVERYTHING_IPC_QUERYA(query)^.reply_hwnd := DWORD_PTR(_Everything_ReplyWindow);

        _Everything_GetSearchTextA(PAnsiChar(NativeUInt(query) + SizeOf(EVERYTHING_IPC_QUERYA)));
      end;

      cds.cbData := size;
      cds.dwData := Ord(_Everything_IsUnicodeQuery) * EVERYTHING_IPC_COPYDATAQUERYW or
                   (Ord(not _Everything_IsUnicodeQuery) * EVERYTHING_IPC_COPYDATAQUERYA);
      cds.lpData := query;

      _Everything_QueryVersion := 1;

      if SendMessage(everything_hwnd, WM_COPYDATA, WPARAM(_Everything_ReplyWindow), LPARAM(@cds)) <> 0 then
      begin
        // successful.
        Result := True;
      end
      else
      begin
        // no ipc
        _Everything_LastError := EVERYTHING_ERROR_IPC;
        Result := False;
      end;

      // get result from window.
      _Everything_Free(query);
    end
    else
    begin
      _Everything_LastError := EVERYTHING_ERROR_MEMORY;
      Result := False;
    end;
  end
  else
  begin
    _Everything_LastError := EVERYTHING_ERROR_IPC;
    Result := False;
  end;
end;

function Everything_QueryA(bWait: BOOL): BOOL;
begin
  _Everything_Lock;

  _Everything_IsUnicodeQuery := False;

  if bWait then
    Result := _Everything_Query
  else
    Result := _Everything_SendIPCQuery;

  _Everything_Unlock;
end;

function Everything_QueryW(bWait: BOOL): BOOL;
begin
  _Everything_Lock;

  _Everything_IsUnicodeQuery := True;

  if bWait then
    Result := _Everything_Query
  else
    Result := _Everything_SendIPCQuery;

  _Everything_Unlock;
end;

function _Everything_CompareA(const a, b: Pointer): Integer;
var
  i: Integer;
begin
  i := lstrcmpiA(EVERYTHING_IPC_ITEMPATHA(_Everything_List, a),
                 EVERYTHING_IPC_ITEMPATHA(_Everything_List, b));

  if i = 0 then
    i := lstrcmpiA(EVERYTHING_IPC_ITEMFILENAMEA(_Everything_List, a),
                   EVERYTHING_IPC_ITEMFILENAMEA(_Everything_List, b));

  if i > 0 then
    Result := 1
  else if i < 0 then
    Result := -1
  else
    Result := 0;
end;

function _Everything_CompareW(const a, b: Pointer): Integer;
var
  i: Integer;
begin
  i := lstrcmpiW(EVERYTHING_IPC_ITEMPATHW(_Everything_List, a),
                  EVERYTHING_IPC_ITEMPATHW(_Everything_List, b));

  if i = 0 then
    i := lstrcmpiW(EVERYTHING_IPC_ITEMFILENAMEW(_Everything_List, a),
                    EVERYTHING_IPC_ITEMFILENAMEW(_Everything_List, b));

  if i > 0 then
    Result := 1
  else if i < 0 then
    Result := -1
  else
    Result := 0;
end;

procedure Everything_SortResultsByPath;

  type
    qsort_compare_func = function(const p1, p2: Pointer): Integer;

  procedure QSort(baseP: Pointer; NElem: DWORD; Width: DWORD; const comparF: qsort_compare_func);

    procedure Exchange(p1, p2: Pointer);
    type
      T01 = Byte;
      P01 = ^T01;
      T04 = Cardinal;
      P04 = ^T04;
    var
      Temp1: T01;
      Temp4: T04;
      i: Integer;
    begin
      i := Width;

      while i >= 4 do
      begin
        Temp4 := P04(p1)^;
        P04(p1)^ := P04(p2)^;
        P04(p2)^ := Temp4;
        Inc(PByte(p1), 4);
        Inc(PByte(p2), 4);
        Dec(i, 4);
      end;

      while i > 0 do
      begin
        Temp1 := P01(p1)^;
        P01(p1)^ := P01(p2)^;
        P01(p2)^ := Temp1;
        Inc(PByte(p1));
        Inc(PByte(p2));
        Dec(i);
      end;
    end;

    procedure qSortHelp(pivotP: PByte; NElem: DWORD);
    label
      TailRecursion, qBreak;
    var
      leftP, rightP, pivotEnd, pivotTemp, leftTemp: PByte;
      lNum: Cardinal;
      retval: Integer;
    begin

      TailRecursion:
      if NElem <= 2 then
      begin
        if NElem = 2 then
        begin
          rightP := pivotP + Width;
          if comparF(pivotP, rightP) > 0 then
            Exchange(pivotP, rightP);
        end;
        Exit;
      end;

      NativeUInt(rightP) := (NElem - 1) * Width + NativeUInt(pivotP);
      NativeUInt(leftP) := (NElem shr 1) * Width + NativeUInt(pivotP);

      if comparF(leftP, rightP) > 0 then
        Exchange(leftP, rightP);
      if comparF(leftP, pivotP) > 0 then
        Exchange(leftP, pivotP)
      else if comparF(pivotP, rightP) > 0 then
        Exchange(pivotP, rightP);

      if NElem = 3 then
      begin
        Exchange(pivotP, leftP);
        Exit;
      end;

      leftP := pivotP + Width;
      pivotEnd := leftP;

      repeat
        retval := comparF(leftP, pivotP);
        while retval <= 0 do
        begin
          if retval = 0 then
          begin
            Exchange(leftP, pivotEnd);
            Inc(pivotEnd, Width);
          end;
          if (leftP < rightP) then
            Inc(leftP, Width)
          else
            goto qBreak;
          retval := comparF(leftP, pivotP);
        end;

        while leftP < rightP do
        begin
          retval := comparF(pivotP, rightP);
          if retval < 0 then
            Dec(rightP, Width)
          else
          begin
            Exchange(leftP, rightP);
            if retval <> 0 then
            begin
              Inc(leftP, Width);
              Dec(rightP, Width);
            end;
            Break;
          end;
        end;

      until not (leftP < rightP);

      qBreak:

      if comparF(leftP, pivotP) <= 0 then
        Inc(leftP, Width);

      leftTemp := leftP - Width;

      pivotTemp := pivotP;

      while (pivotTemp < pivotEnd) and (leftTemp >= pivotEnd) do
      begin
        Exchange(pivotTemp, leftTemp);
        Inc(pivotTemp, Width);
        Dec(leftTemp, Width);
      end;

      lNum := (Cardinal(leftP) - Cardinal(pivotEnd)) div Width;
      NElem := ((NElem * Width + Cardinal(pivotP)) - Cardinal(leftP)) div Width;

      if NElem < lNum then
      begin
        qSortHelp(leftP, NElem);
        NElem := lNum;
      end
      else
      begin
        qSortHelp(pivotP, lNum);
        pivotP := leftP;
      end;

      goto TailRecursion;
    end;

  begin
    if Width <> 0 then
      qSortHelp(baseP, NElem);
  end;
begin
  _Everything_Lock;

  if Assigned(_Everything_List) then
  begin
    if _Everything_IsUnicodeQuery then
      QSort(@PEVERYTHING_IPC_LISTW(_Everything_List).items[0], PEVERYTHING_IPC_LISTW(_Everything_List).numitems,
        SizeOf(EVERYTHING_IPC_ITEMW), _Everything_CompareW)
    else
      QSort(@PEVERYTHING_IPC_LISTA(_Everything_List).items[0], PEVERYTHING_IPC_LISTA(_Everything_List).numitems,
        SizeOf(EVERYTHING_IPC_ITEMA), _Everything_CompareA);
  end
  else
  begin
    _Everything_LastError := EVERYTHING_ERROR_INVALIDCALL;
  end;

  // FIXME://TODO: sort list2

  _Everything_Unlock;
end;

function Everything_GetLastError: DWORD;
var
  ret: DWORD;
begin
  _Everything_Lock;

  ret := _Everything_LastError;

  _Everything_Unlock;

  Result := ret;
end;

function Everything_GetNumFileResults: DWORD;
var
  ret: DWORD;
begin
  _Everything_Lock;

  if Assigned(_Everything_List) then
  begin
    if _Everything_IsUnicodeQuery then
    begin
      ret := PEVERYTHING_IPC_LISTW(_Everything_List).numfiles;
    end
    else
    begin
      ret := PEVERYTHING_IPC_LISTA(_Everything_List).numfiles;
    end;
  end
  else
  begin
    _Everything_LastError := EVERYTHING_ERROR_INVALIDCALL;

    ret := 0;
  end;

  _Everything_Unlock;

  Result := ret;
end;

function Everything_GetNumFolderResults: DWORD;
var
  ret: DWORD;
begin
  _Everything_Lock;

  if Assigned(_Everything_List) then
  begin
    if _Everything_IsUnicodeQuery then
    begin
      ret := PEVERYTHING_IPC_LISTW(_Everything_List).numfolders;
    end
    else
    begin
      ret := PEVERYTHING_IPC_LISTA(_Everything_List).numfolders;
    end;
  end
  else
  begin
    _Everything_LastError := EVERYTHING_ERROR_INVALIDCALL;

    ret := 0;
  end;

  _Everything_Unlock;

  Result := ret;
end;

function _Everything_GetNumResults: DWORD;
var
  ret: DWORD;
begin
  if Assigned(_Everything_List) then
  begin
    if _Everything_IsUnicodeQuery then
    begin
      ret := PEVERYTHING_IPC_LISTW(_Everything_List).numitems;
    end
    else
    begin
      ret := PEVERYTHING_IPC_LISTA(_Everything_List).numitems;
    end;
  end
  else if Assigned(_Everything_List2) then
  begin
    ret := _Everything_List2.numitems;
  end
  else
  begin
    _Everything_LastError := EVERYTHING_ERROR_INVALIDCALL;

    ret := 0;
  end;

  Result := ret;
end;

function _Everything_GetSearchflags: DWORD;
begin
  Result := (Ord(_Everything_Regex) * EVERYTHING_IPC_REGEX) or
            (Ord(_Everything_MatchCase) * EVERYTHING_IPC_MATCHCASE) or
            (Ord(_Everything_MatchWholeWord) * EVERYTHING_IPC_MATCHWHOLEWORD) or
            (Ord(_Everything_MatchPath) * EVERYTHING_IPC_MATCHPATH)
{
  Result := IfThen(_Everything_Regex, EVERYTHING_IPC_REGEX, 0) or
            IfThen(_Everything_MatchCase, EVERYTHING_IPC_MATCHCASE, 0) or
            IfThen(_Everything_MatchWholeWord, EVERYTHING_IPC_MATCHWHOLEWORD, 0) or
            IfThen(_Everything_MatchPath, EVERYTHING_IPC_MATCHPATH, 0);
}
end;

function Everything_GetNumResults: DWORD;
var
  ret: DWORD;
begin
  _Everything_Lock;

  ret := _Everything_GetNumResults;

  _Everything_Unlock;

  Result := ret;
end;

function Everything_GetTotFileResults: DWORD;
var
  ret: DWORD;
begin
  _Everything_Lock;

  if Assigned(_Everything_List) then
  begin
    if _Everything_IsUnicodeQuery then
    begin
      ret := PEVERYTHING_IPC_LISTW(_Everything_List).totfiles;
    end
    else
    begin
      ret := PEVERYTHING_IPC_LISTA(_Everything_List).totfiles;
    end;
  end
  else
  begin
    _Everything_LastError := EVERYTHING_ERROR_INVALIDCALL;

    ret := 0;
  end;

  _Everything_Unlock;

  Result := ret;
end;

function Everything_GetTotFolderResults: DWORD;
var
  ret: DWORD;
begin
  _Everything_Lock;

  if Assigned(_Everything_List) then
  begin
    if _Everything_IsUnicodeQuery then
    begin
      ret := PEVERYTHING_IPC_LISTW(_Everything_List).totfolders;
    end
    else
    begin
      ret := PEVERYTHING_IPC_LISTA(_Everything_List).totfolders;
    end;
  end
  else
  begin
    _Everything_LastError := EVERYTHING_ERROR_INVALIDCALL;

    ret := 0;
  end;

  _Everything_Unlock;

  Result := ret;
end;

function Everything_GetTotResults: DWORD;
var
  ret: DWORD;
begin
  _Everything_Lock;

  if Assigned(_Everything_List) then
  begin
    if _Everything_IsUnicodeQuery then
    begin
      ret := PEVERYTHING_IPC_LISTW(_Everything_List).totitems;
    end
    else
    begin
      ret := PEVERYTHING_IPC_LISTA(_Everything_List).totitems;
    end;
  end
  else if Assigned(_Everything_List2) then
  begin
    ret := _Everything_List2.totitems;
  end
  else
  begin
    _Everything_LastError := EVERYTHING_ERROR_INVALIDCALL;

    ret := 0;
  end;

  _Everything_Unlock;

  Result := ret;
end;

function Everything_IsVolumeResult(dwIndex: DWORD): BOOL;
var
  ret: BOOL;
  pItem2: PEVERYTHING_IPC_ITEM2;
begin
  _Everything_Lock;

  if Assigned(_Everything_List) then
  begin
    if _Everything_IsValidResultIndex(dwIndex) then
    begin
      if _Everything_IsUnicodeQuery then
      begin
        ret := (PEVERYTHING_IPC_LISTW(_Everything_List).items[dwIndex].flags and EVERYTHING_IPC_DRIVE) <> 0;
      end
      else
      begin
        ret := (PEVERYTHING_IPC_LISTA(_Everything_List).items[dwIndex].flags and EVERYTHING_IPC_DRIVE) <> 0;
      end;
    end
    else
    begin
      _Everything_LastError := EVERYTHING_ERROR_INVALIDINDEX;

      ret := False;
    end;
  end
  else if Assigned(_Everything_List2) then
  begin
    if _Everything_IsValidResultIndex(dwIndex) then
    begin
      pItem2 := PEVERYTHING_IPC_ITEM2(NativeUInt(_Everything_List2) + SizeOf(EVERYTHING_IPC_LIST2));
      Inc(pItem2, dwIndex);
      ret := (pItem2.flags and EVERYTHING_IPC_DRIVE) <> 0;
    end
    else
    begin
      _Everything_LastError := EVERYTHING_ERROR_INVALIDINDEX;

      ret := False;
    end;
  end
  else
  begin
    _Everything_LastError := EVERYTHING_ERROR_INVALIDCALL;

    ret := False;
  end;

  _Everything_Unlock;

  Result := ret;
end;

function Everything_IsFolderResult(dwIndex: DWORD): BOOL;
var
  ret: BOOL;
  pItem2: PEVERYTHING_IPC_ITEM2;
begin
  _Everything_Lock;

  if Assigned(_Everything_List) then
  begin
    if _Everything_IsValidResultIndex(dwIndex) then
    begin
      if _Everything_IsUnicodeQuery then
      begin
        ret := PEVERYTHING_IPC_LISTW(_Everything_List).items[dwIndex].flags and EVERYTHING_IPC_FOLDER <> 0;
      end
      else
      begin
        ret := PEVERYTHING_IPC_LISTA(_Everything_List).items[dwIndex].flags and EVERYTHING_IPC_FOLDER <> 0;
      end;
    end
    else
    begin
      _Everything_LastError := EVERYTHING_ERROR_INVALIDINDEX;

      ret := False;
    end;
  end
  else if Assigned(_Everything_List2) then
  begin
    if _Everything_IsValidResultIndex(dwIndex) then
    begin
      pItem2 := PEVERYTHING_IPC_ITEM2(NativeUInt(_Everything_List2) + SizeOf(EVERYTHING_IPC_LIST2));
      Inc(pItem2, dwIndex);
      ret := (pItem2.flags and EVERYTHING_IPC_FOLDER) <> 0;
    end
    else
    begin
      _Everything_LastError := EVERYTHING_ERROR_INVALIDINDEX;

      ret := False;
    end;
  end
  else
  begin
    _Everything_LastError := EVERYTHING_ERROR_INVALIDCALL;

    ret := False;
  end;

  _Everything_Unlock;

  Result := ret;
end;

function Everything_IsFileResult(dwIndex: DWORD): BOOL;
var
  ret: BOOL;
  pItem2: PEVERYTHING_IPC_ITEM2;
begin
  _Everything_Lock;

  if Assigned(_Everything_List) then
  begin
    if _Everything_IsValidResultIndex(dwIndex) then
    begin
      if _Everything_IsUnicodeQuery then
      begin
        ret := (PEVERYTHING_IPC_LISTW(_Everything_List).items[dwIndex].flags and EVERYTHING_IPC_FOLDER) = 0;
      end
      else
      begin
        ret := (PEVERYTHING_IPC_LISTA(_Everything_List).items[dwIndex].flags and EVERYTHING_IPC_FOLDER) = 0;
      end;
    end
    else
    begin
      _Everything_LastError := EVERYTHING_ERROR_INVALIDINDEX;

      ret := False;
    end;
  end
  else if Assigned(_Everything_List2) then
  begin
    if _Everything_IsValidResultIndex(dwIndex) then
    begin
      pItem2 := PEVERYTHING_IPC_ITEM2(NativeUInt(_Everything_List2) + SizeOf(EVERYTHING_IPC_LIST2));
      Inc(pItem2, dwIndex);
      ret := (pItem2.flags and EVERYTHING_IPC_FOLDER) = 0;
    end
    else
    begin
      _Everything_LastError := EVERYTHING_ERROR_INVALIDINDEX;

      ret := False;
    end;
  end
  else
  begin
    _Everything_LastError := EVERYTHING_ERROR_INVALIDCALL;

    ret := False;
  end;

  _Everything_Unlock;

  Result := ret;
end;

function Everything_GetResultFileNameW(dwIndex: DWORD): LPCWSTR;
var
  ret: LPCWSTR;
begin
  _Everything_Lock;

  if Assigned(_Everything_List) and _Everything_IsUnicodeQuery then
  begin
    if _Everything_IsValidResultIndex(dwIndex) then
    begin
      ret := EVERYTHING_IPC_ITEMFILENAMEW(_Everything_List, @PEVERYTHING_IPC_LISTW(_Everything_List).items[dwIndex]);
    end
    else
    begin
      _Everything_LastError := EVERYTHING_ERROR_INVALIDINDEX;

      ret := nil;
    end;
  end
  else if Assigned(_Everything_List2) and _Everything_IsUnicodeQuery then
  begin
    if _Everything_IsValidResultIndex(dwIndex) then
    begin
      ret := _Everything_GetRequestData(dwIndex, EVERYTHING_REQUEST_FILE_NAME);

      if Assigned(ret) then
      begin
        // skip length in characters.
        ret := LPCWSTR(PByte(ret) + SizeOf(DWORD));
      end
      else
      begin
        _Everything_LastError := EVERYTHING_ERROR_INVALIDREQUEST;
      end;
    end
    else
    begin
      _Everything_LastError := EVERYTHING_ERROR_INVALIDINDEX;

      ret := nil;
    end;
  end
  else
  begin
    _Everything_LastError := EVERYTHING_ERROR_INVALIDCALL;

    ret := nil;
  end;

  _Everything_Unlock;

  Result := ret;
end;

function Everything_GetResultFileNameA(dwIndex: DWORD): LPCSTR;
var
  ret: LPCSTR;
begin
  _Everything_Lock();

  if ((_Everything_List <> nil) and (not _Everything_IsUnicodeQuery)) then
  begin
    if _Everything_IsValidResultIndex(dwIndex) then
    begin
      ret := EVERYTHING_IPC_ITEMFILENAMEA(_Everything_List, @PEVERYTHING_IPC_LISTA(_Everything_List)^.items[dwIndex]);
    end
    else
    begin
      _Everything_LastError := EVERYTHING_ERROR_INVALIDINDEX;
      ret := nil;
    end;
  end
  else if ((_Everything_List2 <> nil) and (not _Everything_IsUnicodeQuery)) then
  begin
    if _Everything_IsValidResultIndex(dwIndex) then
    begin
      ret := _Everything_GetRequestData(dwIndex, EVERYTHING_REQUEST_FILE_NAME);

      if ret <> nil then
      begin
        // skip length in characters.
        ret := LPCSTR(PAnsiChar(ret) + SizeOf(DWORD));
      end
      else
      begin
        _Everything_LastError := EVERYTHING_ERROR_INVALIDREQUEST;
      end;
    end
    else
    begin
      _Everything_LastError := EVERYTHING_ERROR_INVALIDINDEX;
      ret := nil;
    end;
  end
  else
  begin
    _Everything_LastError := EVERYTHING_ERROR_INVALIDCALL;
    ret := nil;
  end;

  _Everything_Unlock();

  Result := ret;
end;

function Everything_GetResultPathW(dwIndex: DWORD): LPCWSTR;
var
  ret: LPCWSTR;
begin
  _Everything_Lock();

  if ((_Everything_List <> nil) and (_Everything_IsUnicodeQuery)) then
  begin
    if _Everything_IsValidResultIndex(dwIndex) then
    begin
      ret := EVERYTHING_IPC_ITEMPATHW(_Everything_List, @PEVERYTHING_IPC_LISTW(_Everything_List)^.items[dwIndex]);
    end
    else
    begin
      _Everything_LastError := EVERYTHING_ERROR_INVALIDINDEX;
      ret := nil;
    end;
  end
  else if ((_Everything_List2 <> nil) and (_Everything_IsUnicodeQuery)) then
  begin
    if _Everything_IsValidResultIndex(dwIndex) then
    begin
      ret := _Everything_GetRequestData(dwIndex, EVERYTHING_REQUEST_PATH);

      if ret <> nil then
      begin
        // skip length in characters.
        ret := LPCWSTR(PAnsiChar(ret) + SizeOf(DWORD));
      end
      else
      begin
        _Everything_LastError := EVERYTHING_ERROR_INVALIDREQUEST;
      end;
    end
    else
    begin
      _Everything_LastError := EVERYTHING_ERROR_INVALIDINDEX;
      ret := nil;
    end;
  end
  else
  begin
    _Everything_LastError := EVERYTHING_ERROR_INVALIDCALL;
    ret := nil;
  end;

  _Everything_Unlock();

  Result := ret;
end;

function Everything_GetResultPathA(dwIndex: DWORD): LPCSTR;
var
  ret: LPCSTR;
begin
  _Everything_Lock;

  if Assigned(_Everything_List) then
  begin
    if _Everything_IsValidResultIndex(dwIndex) then
    begin
      ret := EVERYTHING_IPC_ITEMPATHA(_Everything_List, @(PEVERYTHING_IPC_LISTA(_Everything_List).items[dwIndex]));
    end
    else
    begin
      _Everything_LastError := EVERYTHING_ERROR_INVALIDINDEX;
      ret := nil;
    end;
  end
  else if (Assigned(_Everything_List2)) and (not _Everything_IsUnicodeQuery) then
  begin
    if _Everything_IsValidResultIndex(dwIndex) then
    begin
      ret := _Everything_GetRequestData(dwIndex, EVERYTHING_REQUEST_PATH);
      if Assigned(ret) then
      begin
        // skip length in characters.
        ret := LPCSTR(PAnsiChar(ret) + SizeOf(DWORD));
      end
      else
      begin
        _Everything_LastError := EVERYTHING_ERROR_INVALIDREQUEST;
      end;
    end
    else
    begin
      _Everything_LastError := EVERYTHING_ERROR_INVALIDINDEX;
      ret := nil;
    end;
  end
  else
  begin
    _Everything_LastError := EVERYTHING_ERROR_INVALIDCALL;
    ret := nil;
  end;

  _Everything_Unlock;

  Result := ret;
end;

// max is in chars
function _Everything_CopyW(buf: LPWSTR; bufmax, catlen: DWORD; s: LPWSTR): DWORD;
var
  wlen: DWORD;
begin
  if Assigned(buf) then
  begin
    buf := buf + catlen;
    bufmax := bufmax - catlen;
  end;

  wlen := _Everything_StringLengthW(s);
  if wlen = 0 then
  begin
    if Assigned(buf) then
    begin
      buf[wlen] := #0;
    end;

    Result := catlen;
    Exit;
  end;

  // terminate
  if wlen > bufmax - 1 then
    wlen := bufmax - 1;

  if Assigned(buf) then
  begin
    Move(s^, buf^, wlen * SizeOf(WCHAR));
    buf[wlen] := #0;
  end;

  Result := wlen + catlen;
end;

function _Everything_CopyA(buf: LPSTR; max, catlen: DWORD; s: LPSTR): DWORD;
var
  len: DWORD;
begin
  if Assigned(buf) then
  begin
    buf := LPSTR(PAnsiChar(buf) + catlen);
    max := max - catlen;
  end;

  len := _Everything_StringLengthA(s);
  if len = 0 then
  begin
    if Assigned(buf) then
    begin
      buf[len] := #0;
    end;

    Result := catlen;
    Exit;
  end;

  // terminate
  if len > max - 1 then
    len := max - 1;

  if Assigned(buf) then
  begin
    Move(s^, buf^, len * SizeOf(AnsiChar));
    buf[len] := #0;
  end;

  Result := len + catlen;
end;

// max is in chars
function _Everything_CopyWFromA(buf: LPWSTR; bufmax, catlen: DWORD; s: LPCSTR): DWORD;
var
  wlen: DWORD;
begin
  if Assigned(buf) then
  begin
    buf := buf + catlen;
    bufmax := bufmax - catlen;
  end;

  wlen := MultiByteToWideChar(CP_ACP, 0, s, _Everything_StringLengthA(s), nil, 0);
  if wlen = 0 then
  begin
    if Assigned(buf) then
    begin
      buf[wlen] := #0;
    end;

    Result := catlen;
    Exit;
  end;

  // terminate
  if wlen > bufmax - 1 then
    wlen := bufmax - 1;

  if Assigned(buf) then
  begin
    MultiByteToWideChar(CP_ACP, 0, s, _Everything_StringLengthA(s), buf, wlen);
    buf[wlen] := #0;
  end;

  Result := wlen + catlen;
end;

function _Everything_CopyAFromW(buf: LPSTR; max, catlen: DWORD; s: LPCWSTR): DWORD;
var
  len: DWORD;
begin
  if Assigned(buf) then
  begin
    buf := LPSTR(PAnsiChar(buf) + catlen);
    max := max - catlen;
  end;

  len := WideCharToMultiByte(CP_ACP, 0, s, _Everything_StringLengthW(s), nil, 0, nil, nil);
  if len = 0 then
  begin
    if Assigned(buf) then
    begin
      buf[len] := #0;
    end;

    Result := catlen;
    Exit;
  end;

  // terminate
  if len > max - 1 then
    len := max - 1;

  if Assigned(buf) then
  begin
    WideCharToMultiByte(CP_ACP, 0, s, _Everything_StringLengthW(s), buf, len, nil, nil);
    buf[len] := #0;
  end;

  Result := len + catlen;
end;

function Everything_GetResultFullPathNameW(dwIndex: DWORD; wbuf: LPWSTR; wbuf_size_in_wchars: DWORD): DWORD;
var
  len: DWORD;
  full_path_and_name: Pointer;
  path: Pointer;
  name: Pointer;
  smW: WideString;
begin
  _Everything_Lock;

  if Assigned(_Everything_List) then
  begin
    if _Everything_IsValidResultIndex(dwIndex) then
    begin
      if _Everything_IsUnicodeQuery then
      begin
        len := _Everything_CopyW(wbuf, wbuf_size_in_wchars, 0, EVERYTHING_IPC_ITEMPATHW(_Everything_List, @(PEVERYTHING_IPC_LISTW(_Everything_List).items[dwIndex])));

        if len > 0 then
        begin
          if _Everything_IsSchemeNameW(EVERYTHING_IPC_ITEMPATHW(_Everything_List, @(PEVERYTHING_IPC_LISTW(_Everything_List).items[dwIndex]))) then
            smW := '/'
          else smW := '\';
          len := _Everything_CopyW(wbuf, wbuf_size_in_wchars, len, PWideChar(smW));
        end;
      end
      else
      begin
        len := _Everything_CopyWFromA(wbuf, wbuf_size_in_wchars, 0, EVERYTHING_IPC_ITEMPATHA(_Everything_List, @(PEVERYTHING_IPC_LISTA(_Everything_List).items[dwIndex])));

        if len > 0 then
        begin
          if _Everything_IsSchemeNameA(EVERYTHING_IPC_ITEMPATHA(_Everything_List, @(PEVERYTHING_IPC_LISTA(_Everything_List).items[dwIndex]))) then
            smW := '/'
          else smW := '\';
          len := _Everything_CopyW(wbuf, wbuf_size_in_wchars, len, PWideChar(smW));
        end;
      end;

      if _Everything_IsUnicodeQuery then
      begin
        len := _Everything_CopyW(wbuf, wbuf_size_in_wchars, len, EVERYTHING_IPC_ITEMFILENAMEW(_Everything_List, @(PEVERYTHING_IPC_LISTW(_Everything_List).items[dwIndex])));
      end
      else
      begin
        len := _Everything_CopyWFromA(wbuf, wbuf_size_in_wchars, len, EVERYTHING_IPC_ITEMFILENAMEA(_Everything_List, @(PEVERYTHING_IPC_LISTA(_Everything_List).items[dwIndex])));
      end;
    end
    else
    begin
      _Everything_LastError := EVERYTHING_ERROR_INVALIDINDEX;
      len := _Everything_CopyW(wbuf, wbuf_size_in_wchars, 0, '');
    end;
  end
  else if Assigned(_Everything_List2) then
  begin
    if _Everything_IsValidResultIndex(dwIndex) then
    begin
      full_path_and_name := _Everything_GetRequestData(dwIndex, EVERYTHING_REQUEST_FULL_PATH_AND_FILE_NAME);

      if Assigned(full_path_and_name) then
      begin
        // skip number of characters.
        full_path_and_name := Pointer(NativeUInt(full_path_and_name) + SizeOf(DWORD));

        if _Everything_IsUnicodeQuery then
        begin
          len := _Everything_CopyW(wbuf, wbuf_size_in_wchars, 0, full_path_and_name);
        end
        else
        begin
          len := _Everything_CopyWFromA(wbuf, wbuf_size_in_wchars, 0, full_path_and_name);
        end;
      end
      else
      begin
        path := _Everything_GetRequestData(dwIndex, EVERYTHING_REQUEST_PATH);

        if Assigned(path) then
        begin
          // skip number of characters.
          path := Pointer(NativeUInt(path) + SizeOf(DWORD));

          name := _Everything_GetRequestData(dwIndex, EVERYTHING_REQUEST_FILE_NAME);

          if Assigned(name) then
          begin
            // skip number of characters.
            name := Pointer(NativeUInt(name) + SizeOf(DWORD));

            if _Everything_IsUnicodeQuery then
            begin
              len := _Everything_CopyW(wbuf, wbuf_size_in_wchars, 0, path);

              if len > 0 then
              begin
                if _Everything_IsSchemeNameW(path) then
                  smW := '/'
                else smW := '\';
                len := _Everything_CopyW(wbuf, wbuf_size_in_wchars, len, PWideChar(smW));
              end;
            end
            else
            begin
              len := _Everything_CopyWFromA(wbuf, wbuf_size_in_wchars, 0, path);

              if len > 0 then
              begin
                if _Everything_IsSchemeNameA(path) then
                  smW := '/'
                else smW := '\';
                len := _Everything_CopyW(wbuf, wbuf_size_in_wchars, len, PWideChar(smW));
              end;
            end;

            if _Everything_IsUnicodeQuery then
            begin
              len := _Everything_CopyW(wbuf, wbuf_size_in_wchars, len, name);
            end
            else
            begin
              len := _Everything_CopyWFromA(wbuf, wbuf_size_in_wchars, len, name);
            end;
          end
          else
          begin
            // name data not available.
            _Everything_LastError := EVERYTHING_ERROR_INVALIDREQUEST;
            len := _Everything_CopyW(wbuf, wbuf_size_in_wchars, 0, '');
          end;
        end
        else
        begin
          // path data not available.
          _Everything_LastError := EVERYTHING_ERROR_INVALIDREQUEST;
          len := _Everything_CopyW(wbuf, wbuf_size_in_wchars, 0, '');
        end;
      end;
    end
    else
    begin
      _Everything_LastError := EVERYTHING_ERROR_INVALIDINDEX;
      len := _Everything_CopyW(wbuf, wbuf_size_in_wchars, 0, '');
    end;
  end
  else
  begin
    _Everything_LastError := EVERYTHING_ERROR_INVALIDCALL;
    len := _Everything_CopyW(wbuf, wbuf_size_in_wchars, 0, '');
  end;

  _Everything_Unlock;

  Result := len;
end;

function Everything_GetResultFullPathNameA(dwIndex: DWORD; buf: LPSTR; bufsize: DWORD): DWORD;
var
  len: DWORD;
  full_path_and_name: Pointer;
  path: Pointer;
  name: Pointer;
  smA: AnsiString;
begin
  _Everything_Lock;

  if Assigned(_Everything_List) then
  begin
    if _Everything_IsValidResultIndex(dwIndex) then
    begin
      if _Everything_IsUnicodeQuery then
      begin
        len := _Everything_CopyAFromW(buf, bufsize, 0, EVERYTHING_IPC_ITEMPATHW(_Everything_List, @(PEVERYTHING_IPC_LISTW(_Everything_List).items[dwIndex])));
      end
      else
      begin
        len := _Everything_CopyA(buf, bufsize, 0, EVERYTHING_IPC_ITEMPATHA(_Everything_List, @(PEVERYTHING_IPC_LISTA(_Everything_List).items[dwIndex])));
      end;

      if len > 0 then
      begin
        if _Everything_IsSchemeNameA(buf) then
          smA := '/'
        else smA := '\';
        len := _Everything_CopyA(buf, bufsize, len, PAnsiChar(smA));
      end;

      if _Everything_IsUnicodeQuery then
      begin
        len := _Everything_CopyAFromW(buf, bufsize, len, EVERYTHING_IPC_ITEMFILENAMEW(_Everything_List, @(PEVERYTHING_IPC_LISTW(_Everything_List).items[dwIndex])));
      end
      else
      begin
        len := _Everything_CopyA(buf, bufsize, len, EVERYTHING_IPC_ITEMFILENAMEA(_Everything_List, @(PEVERYTHING_IPC_LISTA(_Everything_List).items[dwIndex])));
      end;
    end
    else
    begin
      _Everything_LastError := EVERYTHING_ERROR_INVALIDINDEX;
      len := _Everything_CopyA(buf, bufsize, 0, '');
    end;
  end
  else if Assigned(_Everything_List2) then
  begin
    if _Everything_IsValidResultIndex(dwIndex) then
    begin
      full_path_and_name := _Everything_GetRequestData(dwIndex, EVERYTHING_REQUEST_FULL_PATH_AND_FILE_NAME);

      if Assigned(full_path_and_name) then
      begin
        // skip number of characters.
        full_path_and_name := Pointer(NativeUInt(full_path_and_name) + SizeOf(DWORD));

        if _Everything_IsUnicodeQuery then
        begin
          len := _Everything_CopyAFromW(buf, bufsize, 0, full_path_and_name);
        end
        else
        begin
          len := _Everything_CopyA(buf, bufsize, 0, full_path_and_name);
        end;
      end
      else
      begin
        path := _Everything_GetRequestData(dwIndex, EVERYTHING_REQUEST_PATH);

        if Assigned(path) then
        begin
          // skip number of characters.
          path := Pointer(NativeUInt(path) + SizeOf(DWORD));

          name := _Everything_GetRequestData(dwIndex, EVERYTHING_REQUEST_FILE_NAME);

          if Assigned(name) then
          begin
            // skip number of characters.
            name := Pointer(NativeUInt(name) + SizeOf(DWORD));

            if _Everything_IsUnicodeQuery then
            begin
              len := _Everything_CopyAFromW(buf, bufsize, 0, path);
            end
            else
            begin
              len := _Everything_CopyA(buf, bufsize, 0, path);
            end;

            if len > 0 then
            begin
              if _Everything_IsSchemeNameA(buf) then
                smA := '/'
              else smA := '\';
              len := _Everything_CopyA(buf, bufsize, len, PAnsiChar(smA));
            end;

            if _Everything_IsUnicodeQuery then
            begin
              len := _Everything_CopyAFromW(buf, bufsize, len, name);
            end
            else
            begin
              len := _Everything_CopyA(buf, bufsize, len, name);
            end;
          end
          else
          begin
            // name data not available.
            _Everything_LastError := EVERYTHING_ERROR_INVALIDREQUEST;
            len := _Everything_CopyA(buf, bufsize, 0, '');
          end;
        end
        else
        begin
          // path data not available.
          _Everything_LastError := EVERYTHING_ERROR_INVALIDREQUEST;
          len := _Everything_CopyA(buf, bufsize, 0, '');
        end;
      end;
    end
    else
    begin
      _Everything_LastError := EVERYTHING_ERROR_INVALIDINDEX;
      len := _Everything_CopyA(buf, bufsize, 0, '');
    end;
  end
  else
  begin
    _Everything_LastError := EVERYTHING_ERROR_INVALIDCALL;
    len := _Everything_CopyA(buf, bufsize, 0, '');
  end;

  _Everything_Unlock;

  Result := len;
end;

function Everything_IsQueryReply(message: UINT; wParam: WPARAM; lParam: LPARAM; dwId: DWORD): BOOL;
var
  cds: PCOPYDATASTRUCT;
begin
  Result := False;

  if message = WM_COPYDATA then
  begin
    cds := PCOPYDATASTRUCT(lParam);

    if Assigned(cds) then
    begin
      if (cds^.dwData = _Everything_ReplyID) and (cds^.dwData = dwId) then
      begin
        if _Everything_QueryVersion = 2 then
        begin
          _Everything_FreeLists;

          _Everything_List2 := _Everything_Alloc(cds^.cbData);

          if Assigned(_Everything_List2) then
          begin
            _Everything_LastError := 0;
            Move(cds^.lpData^, _Everything_List2^, cds^.cbData);
            Result := True;
          end
          else
          begin
            _Everything_LastError := EVERYTHING_ERROR_MEMORY;
          end;
        end
        else if _Everything_QueryVersion = 1 then
        begin
          if _Everything_IsUnicodeQuery then
          begin
            _Everything_FreeLists;

            // TODO: check the size is valid.
            _Everything_List := _Everything_Alloc(cds^.cbData);

            if Assigned(_Everything_List) then
            begin
              _Everything_LastError := 0;
              Move(cds^.lpData^, _Everything_List^, cds^.cbData);
              Result := True;
            end
            else
            begin
              _Everything_LastError := EVERYTHING_ERROR_MEMORY;
            end;
          end
          else
          begin
            _Everything_FreeLists;

            // TODO: check the size is valid.
            _Everything_List := _Everything_Alloc(cds^.cbData);

            if Assigned(_Everything_List) then
            begin
              _Everything_LastError := 0;
              Move(cds^.lpData^, _Everything_List^, cds^.cbData);
              Result := True;
            end
            else
            begin
              _Everything_LastError := EVERYTHING_ERROR_MEMORY;
            end;
          end;
        end;
      end;
    end;
  end;
end;

procedure Everything_Reset;
begin
  _Everything_Lock;

  if Assigned(_Everything_Search) then
  begin
    _Everything_Free(_Everything_Search);
    _Everything_Search := nil;
  end;

  _Everything_FreeLists;

  // reset state
  _Everything_MatchPath := False;
  _Everything_MatchCase := False;
  _Everything_MatchWholeWord := False;
  _Everything_Regex := False;
  _Everything_LastError := 0;
  _Everything_Max := EVERYTHING_IPC_ALLRESULTS;
  _Everything_Offset := 0;
  _Everything_Sort := EVERYTHING_SORT_NAME_ASCENDING;
  _Everything_RequestFlags := EVERYTHING_REQUEST_PATH or EVERYTHING_REQUEST_FILE_NAME;
  _Everything_IsUnicodeQuery := False;
  _Everything_IsUnicodeSearch := False;

  _Everything_Unlock;
end;

procedure Everything_CleanUp;
begin
  Everything_Reset;
  DeleteCriticalSection(_Everything_cs);
  _Everything_Initialized := False;
  _Everything_InterlockedCount := 0;
end;

function _Everything_Alloc(size: DWORD): Pointer;
begin
  Result := AllocMem(size);
end;

procedure _Everything_Free(ptr: Pointer);
begin
  FreeMem(ptr);
end;

function Everything_GetResultListSort: DWORD;
begin
  _Everything_Lock;

  Result := EVERYTHING_SORT_NAME_ASCENDING;

  if Assigned(_Everything_List2) then
    Result := _Everything_List2^.sort_type;

  _Everything_Unlock;
end;

function Everything_GetResultListRequestFlags: DWORD;
begin
  _Everything_Lock;

  Result := EVERYTHING_REQUEST_PATH or EVERYTHING_REQUEST_FILE_NAME;

  if Assigned(_Everything_List2) then
    Result := _Everything_List2^.request_flags;

  _Everything_Unlock;
end;

procedure _Everything_FreeLists;
begin
  if Assigned(_Everything_List) then
  begin
    _Everything_Free(_Everything_List);
    _Everything_List := nil;
  end;

  if Assigned(_Everything_List2) then
  begin
    _Everything_Free(_Everything_List2);
    _Everything_List2 := nil;
  end;
end;

function _Everything_IsValidResultIndex(dwIndex: DWORD): BOOL;
begin
  Result := {(dwIndex >= 0) and} (dwIndex < _Everything_GetNumResults);
end;

function _Everything_GetRequestData(dwIndex: DWORD; dwRequestType: DWORD): Pointer;
var
  p: PAnsiChar;
  c, items: PEVERYTHING_IPC_ITEM2;
  len: DWORD;
begin
  items := PEVERYTHING_IPC_ITEM2(NativeUInt(_Everything_List2) + SizeOf(EVERYTHING_IPC_LIST2));
  c := items;
  Inc(c, dwIndex);
  p := PAnsiChar(NativeUInt(_Everything_List2) + c.data_offset);

  if (_Everything_List2.request_flags and EVERYTHING_REQUEST_FILE_NAME) <> 0 then
  begin
    if dwRequestType = EVERYTHING_REQUEST_FILE_NAME then
      Exit(p);

    len := PDWORD(p)^;
    Inc(p, SizeOf(DWORD));

    if _Everything_IsUnicodeQuery then
      Inc(p, (len + 1) * SizeOf(WCHAR))
    else
      Inc(p, (len + 1) * SizeOf(AnsiChar));
  end;

  if (_Everything_List2.request_flags and EVERYTHING_REQUEST_PATH) <> 0 then
  begin
    if dwRequestType = EVERYTHING_REQUEST_PATH then
      Exit(p);

    len := PDWORD(p)^;
    Inc(p, SizeOf(DWORD));

    if _Everything_IsUnicodeQuery then
      Inc(p, (len + 1) * SizeOf(WCHAR))
    else
      Inc(p, (len + 1) * SizeOf(AnsiChar));
  end;

  if (_Everything_List2.request_flags and EVERYTHING_REQUEST_FULL_PATH_AND_FILE_NAME) <> 0 then
  begin
    if dwRequestType = EVERYTHING_REQUEST_FULL_PATH_AND_FILE_NAME then
      Exit(p);

    len := PDWORD(p)^;
    Inc(p, SizeOf(DWORD));

    if _Everything_IsUnicodeQuery then
      Inc(p, (len + 1) * SizeOf(WCHAR))
    else
      Inc(p, (len + 1) * SizeOf(AnsiChar));
  end;

  if (_Everything_List2.request_flags and EVERYTHING_REQUEST_EXTENSION) <> 0 then
  begin
    if dwRequestType = EVERYTHING_REQUEST_EXTENSION then
      Exit(p);

    len := PDWORD(p)^;
    Inc(p, SizeOf(DWORD));

    if _Everything_IsUnicodeQuery then
      Inc(p, (len + 1) * SizeOf(WCHAR))
    else
      Inc(p, (len + 1) * SizeOf(AnsiChar));
  end;

  if (_Everything_List2.request_flags and EVERYTHING_REQUEST_SIZE) <> 0 then
  begin
    if dwRequestType = EVERYTHING_REQUEST_SIZE then
      Exit(p);

    Inc(p, SizeOf(LARGE_INTEGER));
  end;

  if (_Everything_List2.request_flags and EVERYTHING_REQUEST_DATE_CREATED) <> 0 then
  begin
    if dwRequestType = EVERYTHING_REQUEST_DATE_CREATED then
      Exit(p);

    Inc(p, SizeOf(FILETIME));
  end;

  if (_Everything_List2.request_flags and EVERYTHING_REQUEST_DATE_MODIFIED) <> 0 then
  begin
    if dwRequestType = EVERYTHING_REQUEST_DATE_MODIFIED then
      Exit(p);

    Inc(p, SizeOf(FILETIME));
  end;

  if (_Everything_List2.request_flags and EVERYTHING_REQUEST_DATE_ACCESSED) <> 0 then
  begin
    if dwRequestType = EVERYTHING_REQUEST_DATE_ACCESSED then
      Exit(p);

    Inc(p, SizeOf(FILETIME));
  end;

  if (_Everything_List2.request_flags and EVERYTHING_REQUEST_ATTRIBUTES) <> 0 then
  begin
    if dwRequestType = EVERYTHING_REQUEST_ATTRIBUTES then
      Exit(p);

    Inc(p, SizeOf(DWORD));
  end;

  if (_Everything_List2.request_flags and EVERYTHING_REQUEST_FILE_LIST_FILE_NAME) <> 0 then
  begin
    if dwRequestType = EVERYTHING_REQUEST_FILE_LIST_FILE_NAME then
      Exit(p);

    len := PDWORD(p)^;
    Inc(p, SizeOf(DWORD));

    if _Everything_IsUnicodeQuery then
      Inc(p, (len + 1) * SizeOf(WCHAR))
    else
      Inc(p, (len + 1) * SizeOf(AnsiChar));
  end;

  if (_Everything_List2.request_flags and EVERYTHING_REQUEST_RUN_COUNT) <> 0 then
  begin
    if dwRequestType = EVERYTHING_REQUEST_RUN_COUNT then
      Exit(p);

    Inc(p, SizeOf(DWORD));
  end;

  if (_Everything_List2.request_flags and EVERYTHING_REQUEST_DATE_RUN) <> 0 then
  begin
    if dwRequestType = EVERYTHING_REQUEST_DATE_RUN then
      Exit(p);

    Inc(p, SizeOf(FILETIME));
  end;

  if (_Everything_List2.request_flags and EVERYTHING_REQUEST_DATE_RECENTLY_CHANGED) <> 0 then
  begin
    if dwRequestType = EVERYTHING_REQUEST_DATE_RECENTLY_CHANGED then
      Exit(p);

    Inc(p, SizeOf(FILETIME));
  end;

  if (_Everything_List2.request_flags and EVERYTHING_REQUEST_HIGHLIGHTED_FILE_NAME) <> 0 then
  begin
    if dwRequestType = EVERYTHING_REQUEST_HIGHLIGHTED_FILE_NAME then
      Exit(p);

    len := PDWORD(p)^;
    Inc(p, SizeOf(DWORD));

    if _Everything_IsUnicodeQuery then
      Inc(p, (len + 1) * SizeOf(WCHAR))
    else
      Inc(p, (len + 1) * SizeOf(AnsiChar));
  end;

  if (_Everything_List2.request_flags and EVERYTHING_REQUEST_HIGHLIGHTED_PATH) <> 0 then
  begin
    if dwRequestType = EVERYTHING_REQUEST_HIGHLIGHTED_PATH then
      Exit(p);

    len := PDWORD(p)^;
    Inc(p, SizeOf(DWORD));

    if _Everything_IsUnicodeQuery then
      Inc(p, (len + 1) * SizeOf(WCHAR))
    else
      Inc(p, (len + 1) * SizeOf(AnsiChar));
  end;

  if (_Everything_List2.request_flags and EVERYTHING_REQUEST_HIGHLIGHTED_FULL_PATH_AND_FILE_NAME) <> 0 then
  begin
    if dwRequestType = EVERYTHING_REQUEST_HIGHLIGHTED_FULL_PATH_AND_FILE_NAME then
      Exit(p);
{
    len := PDWORD(p)^;
    Inc(p, SizeOf(DWORD));

    if _Everything_IsUnicodeQuery then
      Inc(p, (len + 1) * SizeOf(WCHAR))
    else
      Inc(p, (len + 1) * SizeOf(AnsiChar));
}
  end;

  Result := nil;
end;

function _Everything_IsSchemeNameW(s: LPCWSTR): BOOL;
var
  p: LPCWSTR;
begin
  p := s;

  while p^ <> #0 do
  begin
    if p^ = ':' then
    begin
      Inc(p);

      if (p[0] = '/') and (p[1] = '/') then
      begin
        Result := True;
        Exit;
      end;

      Break;
    end;

    Inc(p);
  end;

  Result := False;
end;

function _Everything_IsSchemeNameA(s: LPCSTR): BOOL;
var
  p: LPCSTR;
begin
  p := s;

  while p^ <> #0 do
  begin
    if p^ = ':' then
    begin
      Inc(p);

      if (p[0] = '/') and (p[1] = '/') then
      begin
        Result := True;
        Exit;
      end;

      Break;
    end;

    Inc(p);
  end;

  Result := False;
end;

procedure _Everything_ChangeWindowMessageFilter(hwnd: HWND);
begin
  if not _Everything_GotChangeWindowMessageFilterEx then
  begin
    // allow the everything window to send a reply.
    _Everything_User32_HDll := LoadLibraryW('user32.dll');

    if _Everything_User32_HDll <> 0 then
    begin
      @_Everything_pChangeWindowMessageFilterEx := GetProcAddress(_Everything_User32_HDll, 'ChangeWindowMessageFilterEx');
    end;

    _Everything_GotChangeWindowMessageFilterEx := True;
  end;

  if _Everything_GotChangeWindowMessageFilterEx then
  begin
    if Assigned(_Everything_pChangeWindowMessageFilterEx) then
    begin
      _Everything_pChangeWindowMessageFilterEx(hwnd, WM_COPYDATA, _EVERYTHING_MSGFLT_ALLOW, nil);
    end;
  end;
end;

function _Everything_GetResultRequestStringW(dwIndex, dwRequestType: DWORD): LPCWSTR;
var
  str: LPCWSTR;
begin
  _Everything_Lock;

  if Assigned(_Everything_List2) and (_Everything_IsUnicodeQuery) then
  begin
    if _Everything_IsValidResultIndex(dwIndex) then
    begin
      str := _Everything_GetRequestData(dwIndex, dwRequestType);
      if Assigned(str) then
      begin
        // skip length in characters.
        str := LPCWSTR(PAnsiChar(str) + SizeOf(DWORD));
      end
      else
      begin
        _Everything_LastError := EVERYTHING_ERROR_INVALIDREQUEST;
      end;
    end
    else
    begin
      _Everything_LastError := EVERYTHING_ERROR_INVALIDINDEX;
      str := nil;
    end;
  end
  else
  begin
    _Everything_LastError := EVERYTHING_ERROR_INVALIDCALL;
    str := nil;
  end;

  _Everything_Unlock;

  Result := str;
end;

function _Everything_GetResultRequestStringA(dwIndex, dwRequestType: DWORD): LPCSTR;
var
  str: LPCSTR;
begin
  _Everything_Lock;

  if Assigned(_Everything_List2) and not _Everything_IsUnicodeQuery then
  begin
    if _Everything_IsValidResultIndex(dwIndex) then
    begin
      str := _Everything_GetRequestData(dwIndex, dwRequestType);
      if Assigned(str) then
      begin
        // skip length in characters.
        str := LPCSTR(PAnsiChar(str) + SizeOf(DWORD));
      end
      else
      begin
        _Everything_LastError := EVERYTHING_ERROR_INVALIDREQUEST;
      end;
    end
    else
    begin
      _Everything_LastError := EVERYTHING_ERROR_INVALIDINDEX;
      str := nil;
    end;
  end
  else
  begin
    _Everything_LastError := EVERYTHING_ERROR_INVALIDCALL;
    str := nil;
  end;

  _Everything_Unlock;

  Result := str;
end;

function _Everything_GetResultRequestData(dwIndex, dwRequestType: DWORD; data: Pointer; size: Integer): BOOL;
var
  ret: BOOL;
  request_data: Pointer;
begin
  _Everything_Lock;

  if Assigned(_Everything_List2) then
  begin
    if _Everything_IsValidResultIndex(dwIndex) then
    begin
      request_data := _Everything_GetRequestData(dwIndex, dwRequestType);
      if Assigned(request_data) then
      begin
        Move(request_data^, data^, size);
        ret := True;
      end
      else
      begin
        _Everything_LastError := EVERYTHING_ERROR_INVALIDREQUEST;
        ret := False;
      end;
    end
    else
    begin
      _Everything_LastError := EVERYTHING_ERROR_INVALIDINDEX;
      ret := False;
    end;
  end
  else
  begin
    _Everything_LastError := EVERYTHING_ERROR_INVALIDCALL;
    ret := False;
  end;

  _Everything_Unlock;

  Result := ret;
end;

function Everything_GetResultExtensionW(dwIndex: DWORD): LPCWSTR;
begin
  Result := _Everything_GetResultRequestStringW(dwIndex, EVERYTHING_REQUEST_EXTENSION);
end;

function Everything_GetResultExtensionA(dwIndex: DWORD): LPCSTR;
begin
  Result := _Everything_GetResultRequestStringA(dwIndex, EVERYTHING_REQUEST_EXTENSION);
end;

function Everything_GetResultSize(dwIndex: DWORD; var lpSize: Int64): BOOL;
begin
  Result := _Everything_GetResultRequestData(dwIndex, EVERYTHING_REQUEST_SIZE, @lpSize, SizeOf(LARGE_INTEGER));
end;

function Everything_GetResultDateCreated(dwIndex: DWORD; var lpDateCreated: TFileTime): BOOL;
begin
  Result := _Everything_GetResultRequestData(dwIndex, EVERYTHING_REQUEST_DATE_CREATED, @lpDateCreated, SizeOf(FILETIME));
end;

function Everything_GetResultDateModified(dwIndex: DWORD; var lpDateModified: TFileTime): BOOL;
begin
  Result := _Everything_GetResultRequestData(dwIndex, EVERYTHING_REQUEST_DATE_MODIFIED, @lpDateModified, SizeOf(FILETIME));
end;

function Everything_GetResultDateAccessed(dwIndex: DWORD; var lpDateAccessed: TFileTime): BOOL;
begin
  Result := _Everything_GetResultRequestData(dwIndex, EVERYTHING_REQUEST_DATE_ACCESSED, @lpDateAccessed, SizeOf(FILETIME));
end;

function Everything_GetResultAttributes(dwIndex: DWORD): DWORD;
var
  dwAttributes: DWORD;
begin
  if _Everything_GetResultRequestData(dwIndex, EVERYTHING_REQUEST_ATTRIBUTES, @dwAttributes, SizeOf(DWORD)) then
  begin
    Result := dwAttributes;
  end
  else
  begin
    Result := INVALID_FILE_ATTRIBUTES;
  end;
end;

function Everything_GetResultFileListFileNameW(dwIndex: DWORD): LPCWSTR;
begin
  Result := _Everything_GetResultRequestStringW(dwIndex, EVERYTHING_REQUEST_FILE_LIST_FILE_NAME);
end;

function Everything_GetResultFileListFileNameA(dwIndex: DWORD): LPCSTR;
begin
  Result := _Everything_GetResultRequestStringA(dwIndex, EVERYTHING_REQUEST_FILE_LIST_FILE_NAME);
end;

function Everything_GetResultRunCount(dwIndex: DWORD): DWORD;
var
  dwRunCount: DWORD;
begin
  if _Everything_GetResultRequestData(dwIndex, EVERYTHING_REQUEST_RUN_COUNT, @dwRunCount, SizeOf(DWORD)) then
  begin
    Result := dwRunCount;
  end
  else
  begin
    Result := 0;
  end;
end;

function Everything_GetResultDateRun(dwIndex: DWORD; var lpDateRun: TFileTime): BOOL;
begin
  Result := _Everything_GetResultRequestData(dwIndex, EVERYTHING_REQUEST_DATE_RUN, @lpDateRun, SizeOf(FILETIME));
end;

function Everything_GetResultDateRecentlyChanged(dwIndex: DWORD; var lpDateRecentlyChanged: TFileTime): BOOL;
begin
  Result := _Everything_GetResultRequestData(dwIndex, EVERYTHING_REQUEST_DATE_RECENTLY_CHANGED, @lpDateRecentlyChanged, SizeOf(FILETIME));
end;

function Everything_GetResultHighlightedFileNameW(dwIndex: DWORD): LPCWSTR;
begin
  Result := _Everything_GetResultRequestStringW(dwIndex, EVERYTHING_REQUEST_HIGHLIGHTED_FILE_NAME);
end;

function Everything_GetResultHighlightedFileNameA(dwIndex: DWORD): LPCSTR;
begin
  Result := _Everything_GetResultRequestStringA(dwIndex, EVERYTHING_REQUEST_HIGHLIGHTED_FILE_NAME);
end;

function Everything_GetResultHighlightedPathW(dwIndex: DWORD): LPCWSTR;
begin
  Result := _Everything_GetResultRequestStringW(dwIndex, EVERYTHING_REQUEST_HIGHLIGHTED_PATH);
end;

function Everything_GetResultHighlightedPathA(dwIndex: DWORD): LPCSTR;
begin
  Result := _Everything_GetResultRequestStringA(dwIndex, EVERYTHING_REQUEST_HIGHLIGHTED_PATH);
end;

function Everything_GetResultHighlightedFullPathAndFileNameW(dwIndex: DWORD): LPCWSTR;
begin
  Result := _Everything_GetResultRequestStringW(dwIndex, EVERYTHING_REQUEST_HIGHLIGHTED_FULL_PATH_AND_FILE_NAME);
end;

function Everything_GetResultHighlightedFullPathAndFileNameA(dwIndex: DWORD): LPCSTR;
begin
  Result := _Everything_GetResultRequestStringA(dwIndex, EVERYTHING_REQUEST_HIGHLIGHTED_FULL_PATH_AND_FILE_NAME);
end;

function _Everything_SendAPIBoolCommand(command: Integer; lParam: LPARAM): BOOL;
var
  everything_hwnd: HWND;
begin
  // find the everything ipc window.
  everything_hwnd := FindWindow(PChar(EVERYTHING_IPC_WNDCLASS), nil);
  if everything_hwnd <> 0 then
  begin
    _Everything_LastError := 0;

    // use SendMessageTimeout and check the message was sent successfully.
    Result := SendMessage(everything_hwnd, EVERYTHING_WM_IPC, command, lParam) <> 0;
  end
  else
  begin
    // the everything window was not found.
    // we can optionally RegisterWindowMessage("EVERYTHING_IPC_CREATED") and
    // wait for Everything to post this message to all top level windows when its up and running.
    _Everything_LastError := EVERYTHING_ERROR_IPC;
    Result := False;
  end;
end;

function _Everything_SendAPIDwordCommand(command: Integer; lParam: LPARAM): DWORD;
var
  everything_hwnd: HWND;
begin
  // find the everything ipc window.
  everything_hwnd := FindWindow(PChar(EVERYTHING_IPC_WNDCLASS), nil);
  if everything_hwnd <> 0 then
  begin
    _Everything_LastError := 0;

    // use SendMessageTimeout and check the message was sent successfully.
    Result := DWORD(SendMessage(everything_hwnd, EVERYTHING_WM_IPC, command, lParam));
  end
  else
  begin
    // the everything window was not found.
    // we can optionally RegisterWindowMessage("EVERYTHING_IPC_CREATED") and
    // wait for Everything to post this message to all top level windows when its up and running.
    _Everything_LastError := EVERYTHING_ERROR_IPC;
    Result := 0;
  end;
end;

function Everything_IsDBLoaded: BOOL;
begin
  Result := _Everything_SendAPIBoolCommand(EVERYTHING_IPC_IS_DB_LOADED, 0);
end;

function Everything_IsAdmin: BOOL;
begin
  Result := _Everything_SendAPIBoolCommand(EVERYTHING_IPC_IS_ADMIN, 0);
end;

function Everything_IsAppData: BOOL;
begin
  Result := _Everything_SendAPIBoolCommand(EVERYTHING_IPC_IS_APPDATA, 0);
end;

function Everything_RebuildDB: BOOL;
begin
  Result := _Everything_SendAPIBoolCommand(EVERYTHING_IPC_REBUILD_DB, 0);
end;

function Everything_UpdateAllFolderIndexes: BOOL;
begin
  Result := _Everything_SendAPIBoolCommand(EVERYTHING_IPC_UPDATE_ALL_FOLDER_INDEXES, 0);
end;

function Everything_SaveDB: BOOL;
begin
  Result := _Everything_SendAPIBoolCommand(EVERYTHING_IPC_SAVE_DB, 0);
end;

function Everything_SaveRunHistory: BOOL;
begin
  Result := _Everything_SendAPIBoolCommand(EVERYTHING_IPC_SAVE_RUN_HISTORY, 0);
end;

function Everything_DeleteRunHistory: BOOL;
begin
  Result := _Everything_SendAPIBoolCommand(EVERYTHING_IPC_DELETE_RUN_HISTORY, 0);
end;

function Everything_GetMajorVersion: DWORD;
begin
  Result := _Everything_SendAPIDwordCommand(EVERYTHING_IPC_GET_MAJOR_VERSION, 0);
end;

function Everything_GetMinorVersion: DWORD;
begin
  Result := _Everything_SendAPIDwordCommand(EVERYTHING_IPC_GET_MINOR_VERSION, 0);
end;

function Everything_GetRevision: DWORD;
begin
  Result := _Everything_SendAPIDwordCommand(EVERYTHING_IPC_GET_REVISION, 0);
end;

function Everything_GetBuildNumber: DWORD;
begin
  Result := _Everything_SendAPIDwordCommand(EVERYTHING_IPC_GET_BUILD_NUMBER, 0);
end;

function Everything_GetTargetMachine: DWORD;
begin
  Result := _Everything_SendAPIDwordCommand(EVERYTHING_IPC_GET_TARGET_MACHINE, 0);
end;

function Everything_Exit: BOOL;
begin
  Result := _Everything_SendAPIBoolCommand(EVERYTHING_IPC_EXIT, 0);
end;

// can be called as admin or standard user.
// will self elevate if needed.
//
// internal use only.
// TODO: no longer used, remove.
function Everything_MSIExitAndStopService(msihandle: Pointer): DWORD;
var
  everything_hwnd: HWND;
  dwProcessId: DWORD;
  process_handle: THandle;
  scm_handle: SC_HANDLE;
  service_handle: SC_HANDLE;
  service_config: LPQUERY_SERVICE_CONFIGW;
  bytes_needed: DWORD;
  filename_wbuf: array[0..MAX_PATH-1] of WideChar;
  p: PWideChar;
  d: PWideChar;
  status_process: SERVICE_STATUS_PROCESS;
  sei: SHELLEXECUTEINFOW;
begin
  // find the everything ipc window.
  everything_hwnd := FindWindow(PChar(EVERYTHING_IPC_WNDCLASS), nil);
  // close Everything client
  if everything_hwnd <> 0 then
  begin
    process_handle := 0;

    if GetWindowThreadProcessId(everything_hwnd, dwProcessId) <> 0 then
    begin
      process_handle := OpenProcess(SYNCHRONIZE, False, dwProcessId);
    end;

    SendMessage(everything_hwnd, WM_CLOSE, 0, 0);

    if process_handle <> 0 then
    begin
      WaitForSingleObject(process_handle, 60000);
      CloseHandle(process_handle);
    end;
  end;

  // stop Everything Service
  scm_handle := OpenSCManager(nil, nil, SC_MANAGER_ENUMERATE_SERVICE);

  if scm_handle <> 0 then
  begin
    service_handle := OpenService(scm_handle, 'Everything', SERVICE_QUERY_CONFIG or SERVICE_QUERY_STATUS);

    if service_handle <> 0 then
    begin
      service_config := LPQUERY_SERVICE_CONFIGW(_Everything_Alloc(8192));
      if service_config <> nil then
      begin
        if QueryServiceConfigW(service_handle, service_config, 8192, bytes_needed) then
        begin
          if _Everything_StringLengthW(service_config.lpBinaryPathName) < MAX_PATH then
          begin
            p := service_config.lpBinaryPathName;
            d := filename_wbuf;

            if p^ = '"' then
            begin
              Inc(p);
              while p^ <> #0 do
              begin
                if p^ = '"' then
                  Break;
                d^ := p^;
                Inc(d);
                Inc(p);
              end;
            end
            else
            begin
              while p^ <> #0 do
              begin
                if p^ = ' ' then
                  Break;
                d^ := p^;
                Inc(d);
                Inc(p);
              end;
            end;

            d^ := #0;

            if filename_wbuf[0] <> #0 then
            begin
              process_handle := 0;

              if QueryServiceStatusEx(service_handle, SC_STATUS_PROCESS_INFO, @status_process, SizeOf(SERVICE_STATUS_PROCESS), bytes_needed) then
              begin
                if status_process.dwProcessId <> 0 then
                begin
                  process_handle := OpenProcess(SYNCHRONIZE, False, status_process.dwProcessId);
                end;
              end;

              // stop service
              if GetFileAttributesW(filename_wbuf) <> INVALID_FILE_ATTRIBUTES then
              begin
                ZeroMemory(@sei, SizeOf(SHELLEXECUTEINFO));

                sei.cbSize := SizeOf(SHELLEXECUTEINFO);
                sei.lpFile := filename_wbuf;
                sei.lpParameters := '-stop-service';
                sei.fMask := SEE_MASK_NOCLOSEPROCESS or SEE_MASK_FLAG_NO_UI;

                if ShellExecuteExW(@sei) then
                begin
                  WaitForSingleObject(sei.hProcess, 60000);
                  CloseHandle(sei.hProcess);
                end;
              end;

              if process_handle <> 0 then
              begin
                WaitForSingleObject(process_handle, 60000);
                CloseHandle(process_handle);
              end;
            end;
          end;
        end;

        _Everything_Free(service_config);
      end;

      CloseServiceHandle(service_handle);
    end;

    CloseServiceHandle(scm_handle);
  end;

  Result := 0;
end;

// MUST be called as an admin
// internal use only.
// TODO: no longer used, remove.
function Everything_MSIStartService(msihandle: Pointer): DWORD;
var
  lpServiceArgVectors: PChar;
  scm_handle: THandle;
  service_handle: THandle;
begin
  scm_handle := OpenSCManager(nil, nil, SC_MANAGER_ENUMERATE_SERVICE);

  if scm_handle <> 0 then
  begin
    service_handle := OpenService(scm_handle, 'Everything', SERVICE_START);

    if service_handle <> 0 then
    begin
      lpServiceArgVectors := nil;
      StartService(service_handle, 0, lpServiceArgVectors);
      CloseServiceHandle(service_handle);
    end;

    CloseServiceHandle(scm_handle);
  end;

  Result := 0;
end;

function Everything_IsFastSort(sortType: DWORD): BOOL;
begin
  Result := _Everything_SendAPIBoolCommand(EVERYTHING_IPC_IS_FAST_SORT, LPARAM(sortType));
end;

function Everything_IsFileInfoIndexed(fileInfoType: DWORD): BOOL;
begin
  Result := _Everything_SendAPIBoolCommand(EVERYTHING_IPC_IS_FILE_INFO_INDEXED, LPARAM(fileInfoType));
end;

function _Everything_SendCopyData(command: Integer; const data: Pointer; size: Integer): LRESULT;
var
  everything_hwnd: HWND;
  cds: TCopyDataStruct;
begin
  // find the everything ipc window.
  everything_hwnd := FindWindow(PChar(EVERYTHING_IPC_WNDCLASS), nil);

  if everything_hwnd <> 0 then
  begin
    cds.cbData := size;
    cds.dwData := command;
    cds.lpData := data;

    Result := SendMessage(everything_hwnd, WM_COPYDATA, 0, LPARAM(@cds));
  end
  else
  begin
    // the everything window was not found.
    // we can optionally RegisterWindowMessage('EVERYTHING_IPC_CREATED') and
    // wait for Everything to post this message to all top level windows when its up and running.
    _Everything_LastError := EVERYTHING_ERROR_IPC;
    Result := 0;
  end;
end;

function Everything_GetRunCountFromFileNameW(lpFileName: PWideChar): DWORD;
begin
  Result := DWORD(_Everything_SendCopyData(EVERYTHING_IPC_COPYDATA_GET_RUN_COUNTW, lpFileName, (_Everything_StringLengthW(lpFileName) + 1) * SizeOf(WideChar)));
end;

function Everything_GetRunCountFromFileNameA(lpFileName: PAnsiChar): DWORD;
begin
  Result := DWORD(_Everything_SendCopyData(EVERYTHING_IPC_COPYDATA_GET_RUN_COUNTA, lpFileName, _Everything_StringLengthA(lpFileName) + 1));
end;

function Everything_SetRunCountFromFileNameW(lpFileName: PWideChar; dwRunCount: DWORD): BOOL;
var
  c, run_history: PEVERYTHING_IPC_RUN_HISTORY;
  len: DWORD;
begin
  len := _Everything_StringLengthW(lpFileName);

  run_history := _Everything_Alloc(SizeOf(EVERYTHING_IPC_RUN_HISTORY) + ((len + 1) * SizeOf(WideChar)));

  if Assigned(run_history) then
  begin
    run_history^.run_count := dwRunCount;
    c := run_history;
    Inc(c);
    Move(lpFileName^, c^, ((len + 1) * SizeOf(WideChar)));

    if _Everything_SendCopyData(EVERYTHING_IPC_COPYDATA_SET_RUN_COUNTW, run_history, SizeOf(EVERYTHING_IPC_RUN_HISTORY) + ((len + 1) * SizeOf(WideChar))) <> 0 then
      Result := True
    else
    begin
      _Everything_LastError := EVERYTHING_ERROR_INVALIDCALL;
      Result := False;
    end;

    _Everything_Free(run_history);
  end
  else
  begin
    _Everything_LastError := EVERYTHING_ERROR_MEMORY;
    Result := False;
  end;
end;

function Everything_SetRunCountFromFileNameA(lpFileName: PAnsiChar; dwRunCount: DWORD): BOOL;
var
  c, run_history: PEVERYTHING_IPC_RUN_HISTORY;
  len: DWORD;
begin
  len := _Everything_StringLengthA(lpFileName);

  run_history := _Everything_Alloc(SizeOf(EVERYTHING_IPC_RUN_HISTORY) + (len + 1));

  if Assigned(run_history) then
  begin
    run_history^.run_count := dwRunCount;
    c := run_history;
    Inc(c);
    Move(lpFileName^, c^, (len + 1));

    if _Everything_SendCopyData(EVERYTHING_IPC_COPYDATA_SET_RUN_COUNTA, run_history, SizeOf(EVERYTHING_IPC_RUN_HISTORY) + (len + 1)) <> 0 then
      Result := True
    else
    begin
      _Everything_LastError := EVERYTHING_ERROR_INVALIDCALL;
      Result := False;
    end;

    _Everything_Free(run_history);
  end
  else
  begin
    _Everything_LastError := EVERYTHING_ERROR_MEMORY;
    Result := False;
  end;
end;

function Everything_IncRunCountFromFileNameW(lpFileName: PWideChar): DWORD;
begin
  Result := DWORD(_Everything_SendCopyData(EVERYTHING_IPC_COPYDATA_INC_RUN_COUNTW, lpFileName, (_Everything_StringLengthW(lpFileName) + 1) * SizeOf(WideChar)));
end;

function Everything_IncRunCountFromFileNameA(lpFileName: PAnsiChar): DWORD;
begin
  Result := DWORD(_Everything_SendCopyData(EVERYTHING_IPC_COPYDATA_INC_RUN_COUNTA, lpFileName, _Everything_StringLengthA(lpFileName) + 1));
end;

end.
