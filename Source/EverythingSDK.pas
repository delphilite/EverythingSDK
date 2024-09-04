{ ***************************************************** }
{                                                       }
{  Pascal language binding for Everything SDK           }
{                                                       }
{  Unit Name: Everything Api Header                     }
{     Author: Lsuper 2024.08.01                         }
{    Purpose: Everything.h                              }
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

unit EverythingSDK;

// Define ET_STATICLINK enable static library support, otherwise use dynamic link libraries.
{$DEFINE ET_STATICLINK}

{$IFDEF ET_STATICLINK}
  {$IFDEF FPC}
    {$MESSAGE ERROR 'staticlink not supported'}
  {$ENDIF}
  {$IFNDEF MSWINDOWS}
    {$MESSAGE ERROR 'staticlink not supported'}
  {$ENDIF}
  {$IFNDEF CPUX64}
    {$DEFINE ET_USE_UNDERSCORE}
  {$ENDIF}
{$ELSE}
  {$DEFINE ET_USE_EXTNAME}
{$ENDIF}

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

implementation

{$IFDEF ET_STATICLINK}

// Link static libraries.
{$IFDEF CPUX86}
  // Win32 from Ref\vc\EverythingLib.vcxproj + VS2010 & objconv
  {$L 'Everything32.obj'}
{$ENDIF CPUX86}
{$IFDEF CPUX64}
  // Win64 from Ref\vc\EverythingLib.vcxproj + VS2010 & objconv
  {$L 'Everything64.obj'}
{$ENDIF CPUX64}

// Link static library dependency functions.
const
  libc = 'msvcrt.dll';

procedure {$IFDEF ET_USE_UNDERSCORE}_memcpy{$ELSE}memcpy{$ENDIF}; cdecl;
  external libc name 'memcpy';

procedure {$IFDEF ET_USE_UNDERSCORE}_memset{$ELSE}memset{$ENDIF}; cdecl;
  external libc name 'memset';

procedure {$IFDEF ET_USE_UNDERSCORE}_qsort{$ELSE}qsort{$ENDIF}; cdecl;
  external libc name 'qsort';

procedure {$IFDEF ET_USE_UNDERSCORE}_stricmp{$ELSE}stricmp{$ENDIF}; cdecl;
  external libc name '_stricmp';

procedure {$IFDEF ET_USE_UNDERSCORE}_wcsicmp{$ELSE}wcsicmp{$ENDIF}; cdecl;
  external libc name '_wcsicmp';

// Windows.pas, Reintroduce CreateWindowExW to fix stdcall errors
const
  user32  = 'user32.dll';

procedure CreateWindowExW; external user32 name 'CreateWindowExW';

// ShellAPI.pas, Avoid referencing unnecessary units
const
  shell32 = 'shell32.dll';

procedure ShellExecuteExW; external shell32 name 'ShellExecuteExW';

// WinSvc.pas, Avoid referencing unnecessary units
const
  advapi32 = 'advapi32.dll';

procedure OpenSCManagerW; external advapi32 name 'OpenSCManagerW';
procedure OpenServiceW; external advapi32 name 'OpenServiceW';
procedure QueryServiceConfigW; external advapi32 name 'QueryServiceConfigW';
procedure QueryServiceStatusEx; external advapi32 name 'QueryServiceStatusEx';
procedure StartServiceW; external advapi32 name 'StartServiceW';
procedure CloseServiceHandle; external advapi32 name 'CloseServiceHandle';

const
  // Crt.pas
  imp_qsort: Pointer = @EverythingSDK.{$IFDEF ET_USE_UNDERSCORE}_qsort{$ELSE}qsort{$ENDIF};
  imp_stricmp: Pointer = @EverythingSDK.{$IFDEF ET_USE_UNDERSCORE}_stricmp{$ELSE}stricmp{$ENDIF};
  imp_wcsicmp: Pointer = @EverythingSDK.{$IFDEF ET_USE_UNDERSCORE}_wcsicmp{$ELSE}wcsicmp{$ENDIF};

  // Windows.pas
  imp_CreateWindowExW: Pointer = @EverythingSDK.CreateWindowExW;

  imp_DefWindowProcW: Pointer = @Windows.DefWindowProcW;
  imp_DestroyWindow: Pointer = @Windows.DestroyWindow;
  imp_DispatchMessageW: Pointer = @Windows.DispatchMessageW;
  imp_FindWindowW: Pointer = @Windows.FindWindowW;
  imp_GetClassInfoExW: Pointer = @Windows.GetClassInfoExW;
  imp_GetMessageW: Pointer = @Windows.GetMessageW;
  imp_GetWindowThreadProcessId: Pointer = @Windows.GetWindowThreadProcessId;
  imp_PeekMessageW: Pointer = @Windows.PeekMessageW;
  imp_PostQuitMessage: Pointer = @Windows.PostQuitMessage;
  imp_RegisterClassExW: Pointer = @Windows.RegisterClassExW;
  imp_SendMessageW: Pointer = @Windows.SendMessageW;
  imp_TranslateMessage: Pointer = @Windows.TranslateMessage;
  imp_WaitMessage: Pointer = @Windows.WaitMessage;

  imp_CloseHandle: Pointer = @Windows.CloseHandle;
  imp_CreateThread: Pointer = @Windows.CreateThread;
  imp_DeleteCriticalSection: Pointer = @Windows.DeleteCriticalSection;
  imp_EnterCriticalSection: Pointer = @Windows.EnterCriticalSection;
  imp_GetFileAttributesW: Pointer = @Windows.GetFileAttributesW;
  imp_GetModuleHandleW: Pointer = @Windows.GetModuleHandleW;
  imp_GetProcAddress: Pointer = @Windows.GetProcAddress;
  imp_GetProcessHeap: Pointer = @Windows.GetProcessHeap;
  imp_HeapAlloc: Pointer = @Windows.HeapAlloc;
  imp_HeapFree: Pointer = @Windows.HeapFree;
  imp_InitializeCriticalSection: Pointer = @Windows.InitializeCriticalSection;
  imp_LeaveCriticalSection: Pointer = @Windows.LeaveCriticalSection;
  imp_LoadLibraryW: Pointer = @Windows.LoadLibraryW;
  imp_MultiByteToWideChar: Pointer = @Windows.MultiByteToWideChar;
  imp_OpenProcess: Pointer = @Windows.OpenProcess;
  imp_Sleep: Pointer = @Windows.Sleep;
  imp_WaitForSingleObject: Pointer = @Windows.WaitForSingleObject;
  imp_WideCharToMultiByte: Pointer = @Windows.WideCharToMultiByte;

  imp_InterlockedExchangeAdd: Pointer = @Windows.InterlockedExchangeAdd;
  imp_InterlockedExchange: Pointer = @Windows.InterlockedExchange;
  imp_InterlockedCompareExchange: Pointer = @Windows.InterlockedCompareExchange;
  imp_InterlockedCompareExchange64: Pointer = @Windows.InterlockedCompareExchange64;
  imp_InterlockedIncrement: Pointer = @Windows.InterlockedIncrement;

  // ShellAPI.pas
  imp_ShellExecuteExW: Pointer = @EverythingSDK.ShellExecuteExW;

  // WinSvc.pas
  imp_OpenSCManagerW: Pointer = @EverythingSDK.OpenSCManagerW;
  imp_OpenServiceW: Pointer = @EverythingSDK.OpenServiceW;
  imp_CloseServiceHandle: Pointer = @EverythingSDK.CloseServiceHandle;
  imp_QueryServiceConfigW: Pointer = @EverythingSDK.QueryServiceConfigW;
  imp_QueryServiceStatusEx: Pointer = @EverythingSDK.QueryServiceStatusEx;
  imp_StartServiceW: Pointer = @EverythingSDK.StartServiceW;

{$ELSE ET_STATICLINK}

const
{$IF Defined(WIN32)}
  EverythingDLL = 'Everything32.dll';
{$ELSEIF Defined(WIN64)}
  EverythingDLL = 'Everything64.dll';
{$ELSE}
  {$MESSAGE Error 'Unsupported platform'}
{$IFEND}

{$ENDIF ET_STATICLINK}

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

// Write search state
procedure Everything_SetSearchW; external {$IFDEF ET_USE_EXTNAME}EverythingDLL{$ENDIF} name 'Everything_SetSearchW';
procedure Everything_SetSearchA; external {$IFDEF ET_USE_EXTNAME}EverythingDLL{$ENDIF} name 'Everything_SetSearchA';
procedure Everything_SetMatchPath; external {$IFDEF ET_USE_EXTNAME}EverythingDLL{$ENDIF} name 'Everything_SetMatchPath';
procedure Everything_SetMatchCase; external {$IFDEF ET_USE_EXTNAME}EverythingDLL{$ENDIF} name 'Everything_SetMatchCase';
procedure Everything_SetMatchWholeWord; external {$IFDEF ET_USE_EXTNAME}EverythingDLL{$ENDIF} name 'Everything_SetMatchWholeWord';
procedure Everything_SetRegex; external {$IFDEF ET_USE_EXTNAME}EverythingDLL{$ENDIF} name 'Everything_SetRegex';
procedure Everything_SetMax; external {$IFDEF ET_USE_EXTNAME}EverythingDLL{$ENDIF} name 'Everything_SetMax';
procedure Everything_SetOffset; external {$IFDEF ET_USE_EXTNAME}EverythingDLL{$ENDIF} name 'Everything_SetOffset';
procedure Everything_SetReplyWindow; external {$IFDEF ET_USE_EXTNAME}EverythingDLL{$ENDIF} name 'Everything_SetReplyWindow';
procedure Everything_SetReplyID; external {$IFDEF ET_USE_EXTNAME}EverythingDLL{$ENDIF} name 'Everything_SetReplyID';
procedure Everything_SetSort; external {$IFDEF ET_USE_EXTNAME}EverythingDLL{$ENDIF} name 'Everything_SetSort';
procedure Everything_SetRequestFlags; external {$IFDEF ET_USE_EXTNAME}EverythingDLL{$ENDIF} name 'Everything_SetRequestFlags';

// Read search state
function  Everything_GetMatchPath; external {$IFDEF ET_USE_EXTNAME}EverythingDLL{$ENDIF} name 'Everything_GetMatchPath';
function  Everything_GetMatchCase; external {$IFDEF ET_USE_EXTNAME}EverythingDLL{$ENDIF} name 'Everything_GetMatchCase';
function  Everything_GetMatchWholeWord; external {$IFDEF ET_USE_EXTNAME}EverythingDLL{$ENDIF} name 'Everything_GetMatchWholeWord';
function  Everything_GetRegex; external {$IFDEF ET_USE_EXTNAME}EverythingDLL{$ENDIF} name 'Everything_GetRegex';
function  Everything_GetMax; external {$IFDEF ET_USE_EXTNAME}EverythingDLL{$ENDIF} name 'Everything_GetMax';
function  Everything_GetOffset; external {$IFDEF ET_USE_EXTNAME}EverythingDLL{$ENDIF} name 'Everything_GetOffset';
function  Everything_GetSearchA; external {$IFDEF ET_USE_EXTNAME}EverythingDLL{$ENDIF} name 'Everything_GetSearchA';
function  Everything_GetSearchW; external {$IFDEF ET_USE_EXTNAME}EverythingDLL{$ENDIF} name 'Everything_GetSearchW';
function  Everything_GetLastError; external {$IFDEF ET_USE_EXTNAME}EverythingDLL{$ENDIF} name 'Everything_GetLastError';
function  Everything_GetReplyWindow; external {$IFDEF ET_USE_EXTNAME}EverythingDLL{$ENDIF} name 'Everything_GetReplyWindow';
function  Everything_GetReplyID; external {$IFDEF ET_USE_EXTNAME}EverythingDLL{$ENDIF} name 'Everything_GetReplyID';
function  Everything_GetSort; external {$IFDEF ET_USE_EXTNAME}EverythingDLL{$ENDIF} name 'Everything_GetSort';
function  Everything_GetRequestFlags; external {$IFDEF ET_USE_EXTNAME}EverythingDLL{$ENDIF} name 'Everything_GetRequestFlags';

// Execute query
function  Everything_QueryA; external {$IFDEF ET_USE_EXTNAME}EverythingDLL{$ENDIF} name 'Everything_QueryA';
function  Everything_QueryW; external {$IFDEF ET_USE_EXTNAME}EverythingDLL{$ENDIF} name 'Everything_QueryW';

// Query reply
function  Everything_IsQueryReply; external {$IFDEF ET_USE_EXTNAME}EverythingDLL{$ENDIF} name 'Everything_IsQueryReply';

// Write result state
procedure Everything_SortResultsByPath; external {$IFDEF ET_USE_EXTNAME}EverythingDLL{$ENDIF} name 'Everything_SortResultsByPath';

// Read result state
function  Everything_GetNumFileResults; external {$IFDEF ET_USE_EXTNAME}EverythingDLL{$ENDIF} name 'Everything_GetNumFileResults';
function  Everything_GetNumFolderResults; external {$IFDEF ET_USE_EXTNAME}EverythingDLL{$ENDIF} name 'Everything_GetNumFolderResults';
function  Everything_GetNumResults; external {$IFDEF ET_USE_EXTNAME}EverythingDLL{$ENDIF} name 'Everything_GetNumResults';
function  Everything_GetTotFileResults; external {$IFDEF ET_USE_EXTNAME}EverythingDLL{$ENDIF} name 'Everything_GetTotFileResults';
function  Everything_GetTotFolderResults; external {$IFDEF ET_USE_EXTNAME}EverythingDLL{$ENDIF} name 'Everything_GetTotFolderResults';
function  Everything_GetTotResults; external {$IFDEF ET_USE_EXTNAME}EverythingDLL{$ENDIF} name 'Everything_GetTotResults';
function  Everything_IsVolumeResult; external {$IFDEF ET_USE_EXTNAME}EverythingDLL{$ENDIF} name 'Everything_IsVolumeResult';
function  Everything_IsFolderResult; external {$IFDEF ET_USE_EXTNAME}EverythingDLL{$ENDIF} name 'Everything_IsFolderResult';
function  Everything_IsFileResult; external {$IFDEF ET_USE_EXTNAME}EverythingDLL{$ENDIF} name 'Everything_IsFileResult';
function  Everything_GetResultFileNameW; external {$IFDEF ET_USE_EXTNAME}EverythingDLL{$ENDIF} name 'Everything_GetResultFileNameW';
function  Everything_GetResultFileNameA; external {$IFDEF ET_USE_EXTNAME}EverythingDLL{$ENDIF} name 'Everything_GetResultFileNameA';
function  Everything_GetResultPathW; external {$IFDEF ET_USE_EXTNAME}EverythingDLL{$ENDIF} name 'Everything_GetResultPathW';
function  Everything_GetResultPathA; external {$IFDEF ET_USE_EXTNAME}EverythingDLL{$ENDIF} name 'Everything_GetResultPathA';
function  Everything_GetResultFullPathNameA; external {$IFDEF ET_USE_EXTNAME}EverythingDLL{$ENDIF} name 'Everything_GetResultFullPathNameA';
function  Everything_GetResultFullPathNameW; external {$IFDEF ET_USE_EXTNAME}EverythingDLL{$ENDIF} name 'Everything_GetResultFullPathNameW';
// Everything 1.4.1
function  Everything_GetResultListSort; external {$IFDEF ET_USE_EXTNAME}EverythingDLL{$ENDIF} name 'Everything_GetResultListSort';
// Everything 1.4.1
function  Everything_GetResultListRequestFlags; external {$IFDEF ET_USE_EXTNAME}EverythingDLL{$ENDIF} name 'Everything_GetResultListRequestFlags';
// Everything 1.4.1
function  Everything_GetResultExtensionW; external {$IFDEF ET_USE_EXTNAME}EverythingDLL{$ENDIF} name 'Everything_GetResultExtensionW';
// Everything 1.4.1
function  Everything_GetResultExtensionA; external {$IFDEF ET_USE_EXTNAME}EverythingDLL{$ENDIF} name 'Everything_GetResultExtensionA';
// Everything 1.4.1
function  Everything_GetResultSize; external {$IFDEF ET_USE_EXTNAME}EverythingDLL{$ENDIF} name 'Everything_GetResultSize';
// Everything 1.4.1
function  Everything_GetResultDateCreated; external {$IFDEF ET_USE_EXTNAME}EverythingDLL{$ENDIF} name 'Everything_GetResultDateCreated';
// Everything 1.4.1
function  Everything_GetResultDateModified; external {$IFDEF ET_USE_EXTNAME}EverythingDLL{$ENDIF} name 'Everything_GetResultDateModified';
// Everything 1.4.1
function  Everything_GetResultDateAccessed; external {$IFDEF ET_USE_EXTNAME}EverythingDLL{$ENDIF} name 'Everything_GetResultDateAccessed';
// Everything 1.4.1
function  Everything_GetResultAttributes; external {$IFDEF ET_USE_EXTNAME}EverythingDLL{$ENDIF} name 'Everything_GetResultAttributes';
// Everything 1.4.1
function  Everything_GetResultFileListFileNameW; external {$IFDEF ET_USE_EXTNAME}EverythingDLL{$ENDIF} name 'Everything_GetResultFileListFileNameW';
// Everything 1.4.1
function  Everything_GetResultFileListFileNameA; external {$IFDEF ET_USE_EXTNAME}EverythingDLL{$ENDIF} name 'Everything_GetResultFileListFileNameA';
// Everything 1.4.1
function  Everything_GetResultRunCount; external {$IFDEF ET_USE_EXTNAME}EverythingDLL{$ENDIF} name 'Everything_GetResultRunCount';
function  Everything_GetResultDateRun; external {$IFDEF ET_USE_EXTNAME}EverythingDLL{$ENDIF} name 'Everything_GetResultDateRun';
function  Everything_GetResultDateRecentlyChanged; external {$IFDEF ET_USE_EXTNAME}EverythingDLL{$ENDIF} name 'Everything_GetResultDateRecentlyChanged';
// Everything 1.4.1
function  Everything_GetResultHighlightedFileNameW; external {$IFDEF ET_USE_EXTNAME}EverythingDLL{$ENDIF} name 'Everything_GetResultHighlightedFileNameW';
// Everything 1.4.1
function  Everything_GetResultHighlightedFileNameA; external {$IFDEF ET_USE_EXTNAME}EverythingDLL{$ENDIF} name 'Everything_GetResultHighlightedFileNameA';
// Everything 1.4.1
function  Everything_GetResultHighlightedPathW; external {$IFDEF ET_USE_EXTNAME}EverythingDLL{$ENDIF} name 'Everything_GetResultHighlightedPathW';
// Everything 1.4.1
function  Everything_GetResultHighlightedPathA; external {$IFDEF ET_USE_EXTNAME}EverythingDLL{$ENDIF} name 'Everything_GetResultHighlightedPathA';
// Everything 1.4.1
function  Everything_GetResultHighlightedFullPathAndFileNameW; external {$IFDEF ET_USE_EXTNAME}EverythingDLL{$ENDIF} name 'Everything_GetResultHighlightedFullPathAndFileNameW';
// Everything 1.4.1
function  Everything_GetResultHighlightedFullPathAndFileNameA; external {$IFDEF ET_USE_EXTNAME}EverythingDLL{$ENDIF} name 'Everything_GetResultHighlightedFullPathAndFileNameA';

// Reset state and free any allocated memory
procedure Everything_Reset; external {$IFDEF ET_USE_EXTNAME}EverythingDLL{$ENDIF} name 'Everything_Reset';
procedure Everything_CleanUp; external {$IFDEF ET_USE_EXTNAME}EverythingDLL{$ENDIF} name 'Everything_CleanUp';

function  Everything_GetMajorVersion; external {$IFDEF ET_USE_EXTNAME}EverythingDLL{$ENDIF} name 'Everything_GetMajorVersion';
function  Everything_GetMinorVersion; external {$IFDEF ET_USE_EXTNAME}EverythingDLL{$ENDIF} name 'Everything_GetMinorVersion';
function  Everything_GetRevision; external {$IFDEF ET_USE_EXTNAME}EverythingDLL{$ENDIF} name 'Everything_GetRevision';
function  Everything_GetBuildNumber; external {$IFDEF ET_USE_EXTNAME}EverythingDLL{$ENDIF} name 'Everything_GetBuildNumber';
function  Everything_Exit: BOOL; external {$IFDEF ET_USE_EXTNAME}EverythingDLL{$ENDIF} name 'Everything_Exit';
function  Everything_MSIExitAndStopService; external {$IFDEF ET_USE_EXTNAME}EverythingDLL{$ENDIF} name 'Everything_MSIExitAndStopService';
function  Everything_MSIStartService; external {$IFDEF ET_USE_EXTNAME}EverythingDLL{$ENDIF} name 'Everything_MSIStartService';

// Everything 1.4.1
function  Everything_IsDBLoaded; external {$IFDEF ET_USE_EXTNAME}EverythingDLL{$ENDIF} name 'Everything_IsDBLoaded';
// Everything 1.4.1
function  Everything_IsAdmin; external {$IFDEF ET_USE_EXTNAME}EverythingDLL{$ENDIF} name 'Everything_IsAdmin';
// Everything 1.4.1
function  Everything_IsAppData; external {$IFDEF ET_USE_EXTNAME}EverythingDLL{$ENDIF} name 'Everything_IsAppData';
// Everything 1.4.1
function  Everything_RebuildDB; external {$IFDEF ET_USE_EXTNAME}EverythingDLL{$ENDIF} name 'Everything_RebuildDB';
// Everything 1.4.1
function  Everything_UpdateAllFolderIndexes; external {$IFDEF ET_USE_EXTNAME}EverythingDLL{$ENDIF} name 'Everything_UpdateAllFolderIndexes';
// Everything 1.4.1
function  Everything_SaveDB; external {$IFDEF ET_USE_EXTNAME}EverythingDLL{$ENDIF} name 'Everything_SaveDB';
// Everything 1.4.1
function  Everything_SaveRunHistory; external {$IFDEF ET_USE_EXTNAME}EverythingDLL{$ENDIF} name 'Everything_SaveRunHistory';
// Everything 1.4.1
function  Everything_DeleteRunHistory; external {$IFDEF ET_USE_EXTNAME}EverythingDLL{$ENDIF} name 'Everything_DeleteRunHistory';
// Everything 1.4.1
function  Everything_GetTargetMachine; external {$IFDEF ET_USE_EXTNAME}EverythingDLL{$ENDIF} name 'Everything_GetTargetMachine';
// Everything 1.4.1.859
function  Everything_IsFastSort; external {$IFDEF ET_USE_EXTNAME}EverythingDLL{$ENDIF} name 'Everything_IsFastSort';
// Everything 1.4.1.859
function  Everything_IsFileInfoIndexed; external {$IFDEF ET_USE_EXTNAME}EverythingDLL{$ENDIF} name 'Everything_IsFileInfoIndexed';

// Everything 1.4.1
function  Everything_GetRunCountFromFileNameW; external {$IFDEF ET_USE_EXTNAME}EverythingDLL{$ENDIF} name 'Everything_GetRunCountFromFileNameW';
// Everything 1.4.1
function  Everything_GetRunCountFromFileNameA; external {$IFDEF ET_USE_EXTNAME}EverythingDLL{$ENDIF} name 'Everything_GetRunCountFromFileNameA';
// Everything 1.4.1
function  Everything_SetRunCountFromFileNameW; external {$IFDEF ET_USE_EXTNAME}EverythingDLL{$ENDIF} name 'Everything_SetRunCountFromFileNameW';
// Everything 1.4.1
function  Everything_SetRunCountFromFileNameA; external {$IFDEF ET_USE_EXTNAME}EverythingDLL{$ENDIF} name 'Everything_SetRunCountFromFileNameA';
// Everything 1.4.1
function  Everything_IncRunCountFromFileNameW; external {$IFDEF ET_USE_EXTNAME}EverythingDLL{$ENDIF} name 'Everything_IncRunCountFromFileNameW';
// Everything 1.4.1
function  Everything_IncRunCountFromFileNameA; external {$IFDEF ET_USE_EXTNAME}EverythingDLL{$ENDIF} name 'Everything_IncRunCountFromFileNameA';

// Retrieves a Human-Readable error message corresponding to a given error code
function  Everything_GetErrorMessage(ACode: Integer): string;

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
function  Everything_GetVersion: string;
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

end.
