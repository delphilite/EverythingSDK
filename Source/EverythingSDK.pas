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

interface

uses
  SysUtils, Windows;

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

type
  // Ansi version types
  TEverything_SetSearchA = procedure(lpString: PAnsiChar); stdcall;
  TEverything_GetSearchA = function: PAnsiChar; stdcall;
  TEverything_QueryA = function(bWait: BOOL): BOOL; stdcall;
{
  TEverything_Query2A = function(bWait: BOOL; pContext: Pointer): BOOL; stdcall;
}
  TEverything_GetResultFileNameA = function(dwIndex: DWORD): PAnsiChar; stdcall;
  TEverything_GetResultPathA = function(dwIndex: DWORD): PAnsiChar; stdcall;
  TEverything_GetResultFullPathNameA = function(dwIndex: DWORD; buf: PAnsiChar; bufsize: DWORD): DWORD; stdcall;
  TEverything_GetResultExtensionA = function(dwIndex: DWORD): PAnsiChar; stdcall;
  TEverything_GetResultFileListFileNameA = function(dwIndex: DWORD): PAnsiChar; stdcall;
  TEverything_GetResultHighlightedFileNameA = function(dwIndex: DWORD): PAnsiChar; stdcall;
  TEverything_GetResultHighlightedPathA = function(dwIndex: DWORD): PAnsiChar; stdcall;
  TEverything_GetResultHighlightedFullPathAndFileNameA = function(dwIndex: DWORD): PAnsiChar; stdcall;
  TEverything_GetRunCountFromFileNameA = function(lpFileName: PAnsiChar): DWORD; stdcall;
  TEverything_SetRunCountFromFileNameA = function(lpFileName: PAnsiChar; dwRunCount: DWORD): BOOL; stdcall;
  TEverything_IncRunCountFromFileNameA = function(lpFileName: PAnsiChar): DWORD; stdcall;

  // Unicode version types
  TEverything_SetSearchW = procedure(lpString: PWideChar); stdcall;
  TEverything_GetSearchW = function: PWideChar; stdcall;
  TEverything_QueryW = function(bWait: BOOL): BOOL; stdcall;
{
  TEverything_Query2W = function(bWait: BOOL; pContext: Pointer): BOOL; stdcall;
}
  TEverything_GetResultFileNameW = function(dwIndex: DWORD): PWideChar; stdcall;
  TEverything_GetResultPathW = function(dwIndex: DWORD): PWideChar; stdcall;
  TEverything_GetResultFullPathNameW = function(dwIndex: DWORD; wbuf: PWideChar; wbuf_size_in_wchars: DWORD): DWORD; stdcall;
  TEverything_GetResultExtensionW = function(dwIndex: DWORD): PWideChar; stdcall;
  TEverything_GetResultFileListFileNameW = function(dwIndex: DWORD): PWideChar; stdcall;
  TEverything_GetResultHighlightedFileNameW = function(dwIndex: DWORD): PWideChar; stdcall;
  TEverything_GetResultHighlightedPathW = function(dwIndex: DWORD): PWideChar; stdcall;
  TEverything_GetResultHighlightedFullPathAndFileNameW = function(dwIndex: DWORD): PWideChar; stdcall;
  TEverything_GetRunCountFromFileNameW = function(lpFileName: PWideChar): DWORD; stdcall;
  TEverything_SetRunCountFromFileNameW = function(lpFileName: PWideChar; dwRunCount: DWORD): BOOL; stdcall;
  TEverything_IncRunCountFromFileNameW = function(lpFileName: PWideChar): DWORD; stdcall;

const
{$IFDEF UNICODE}
  Everything_SetSearch: TEverything_SetSearchW = Everything_SetSearchW;
  Everything_GetSearch: TEverything_GetSearchW = Everything_GetSearchW;
  Everything_Query: TEverything_QueryW = Everything_QueryW;
{
  Everything_Query2: TEverything_Query2W = Everything_Query2W;
}
  Everything_GetResultFileName: TEverything_GetResultFileNameW = Everything_GetResultFileNameW;
  Everything_GetResultPath: TEverything_GetResultPathW = Everything_GetResultPathW;
  Everything_GetResultFullPathName: TEverything_GetResultFullPathNameW = Everything_GetResultFullPathNameW;
  Everything_GetResultExtension: TEverything_GetResultExtensionW = Everything_GetResultExtensionW;
  Everything_GetResultFileListFileName: TEverything_GetResultFileListFileNameW = Everything_GetResultFileListFileNameW;
  Everything_GetResultHighlightedFileName: TEverything_GetResultHighlightedFileNameW = Everything_GetResultHighlightedFileNameW;
  Everything_GetResultHighlightedPath: TEverything_GetResultHighlightedPathW = Everything_GetResultHighlightedPathW;
  Everything_GetResultHighlightedFullPathAndFileName: TEverything_GetResultHighlightedFullPathAndFileNameW = Everything_GetResultHighlightedFullPathAndFileNameW;
  Everything_GetRunCountFromFileName: TEverything_GetRunCountFromFileNameW = Everything_GetRunCountFromFileNameW;
  Everything_SetRunCountFromFileName: TEverything_SetRunCountFromFileNameW = Everything_SetRunCountFromFileNameW;
  Everything_IncRunCountFromFileName: TEverything_IncRunCountFromFileNameW = Everything_IncRunCountFromFileNameW;
{$ELSE}
  Everything_SetSearch: TEverything_SetSearchA = Everything_SetSearchA;
  Everything_GetSearch: TEverything_GetSearchA = Everything_GetSearchA;
  Everything_Query: TEverything_QueryA = Everything_QueryA;
{
  Everything_Query2: TEverything_Query2A = Everything_Query2A;
}
  Everything_GetResultFileName: TEverything_GetResultFileNameA = Everything_GetResultFileNameA;
  Everything_GetResultPath: TEverything_GetResultPathA = Everything_GetResultPathA;
  Everything_GetResultFullPathName: TEverything_GetResultFullPathNameA = Everything_GetResultFullPathNameA;
  Everything_GetResultExtension: TEverything_GetResultExtensionA = Everything_GetResultExtensionA;
  Everything_GetResultFileListFileName: TEverything_GetResultFileListFileNameA = Everything_GetResultFileListFileNameA;
  Everything_GetResultHighlightedFileName: TEverything_GetResultHighlightedFileNameA = Everything_GetResultHighlightedFileNameA;
  Everything_GetResultHighlightedPath: TEverything_GetResultHighlightedPathA = Everything_GetResultHighlightedPathA;
  Everything_GetResultHighlightedFullPathAndFileName: TEverything_GetResultHighlightedFullPathAndFileNameA = Everything_GetResultHighlightedFullPathAndFileNameA;
  Everything_GetRunCountFromFileName: TEverything_GetRunCountFromFileNameA = Everything_GetRunCountFromFileNameA;
  Everything_SetRunCountFromFileName: TEverything_SetRunCountFromFileNameA = Everything_SetRunCountFromFileNameA;
  Everything_IncRunCountFromFileName: TEverything_IncRunCountFromFileNameA = Everything_IncRunCountFromFileNameA;
{$ENDIF}

  // Retrieves a Human-Readable error message corresponding to a given error code
  function  Everything_GetErrorMessage(ACode: Integer): string;
  // Retrieves the current version of the Everything SDK
  function  Everything_GetVersion: string;

implementation

const
{$IF Defined(WIN32)}
  EverythingDLL = 'Everything32.dll';
{$ELSEIF Defined(WIN64)}
  EverythingDLL = 'Everything64.dll';
{$ELSE}
  {$MESSAGE Error 'Unsupported platform'}
{$IFEND}

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
  rsErrUnKnownErrorFmt  = 'Unknown Error code: %d';

// Write search state
procedure Everything_SetSearchW; external EverythingDLL name 'Everything_SetSearchW';
procedure Everything_SetSearchA; external EverythingDLL name 'Everything_SetSearchA';
procedure Everything_SetMatchPath; external EverythingDLL name 'Everything_SetMatchPath';
procedure Everything_SetMatchCase; external EverythingDLL name 'Everything_SetMatchCase';
procedure Everything_SetMatchWholeWord; external EverythingDLL name 'Everything_SetMatchWholeWord';
procedure Everything_SetRegex; external EverythingDLL name 'Everything_SetRegex';
procedure Everything_SetMax; external EverythingDLL name 'Everything_SetMax';
procedure Everything_SetOffset; external EverythingDLL name 'Everything_SetOffset';
procedure Everything_SetReplyWindow; external EverythingDLL name 'Everything_SetReplyWindow';
procedure Everything_SetReplyID; external EverythingDLL name 'Everything_SetReplyID';
procedure Everything_SetSort; external EverythingDLL name 'Everything_SetSort';
procedure Everything_SetRequestFlags; external EverythingDLL name 'Everything_SetRequestFlags';

// Read search state
function  Everything_GetMatchPath; external EverythingDLL name 'Everything_GetMatchPath';
function  Everything_GetMatchCase; external EverythingDLL name 'Everything_GetMatchCase';
function  Everything_GetMatchWholeWord; external EverythingDLL name 'Everything_GetMatchWholeWord';
function  Everything_GetRegex; external EverythingDLL name 'Everything_GetRegex';
function  Everything_GetMax; external EverythingDLL name 'Everything_GetMax';
function  Everything_GetOffset; external EverythingDLL name 'Everything_GetOffset';
function  Everything_GetSearchA; external EverythingDLL name 'Everything_GetSearchA';
function  Everything_GetSearchW; external EverythingDLL name 'Everything_GetSearchW';
function  Everything_GetLastError; external EverythingDLL name 'Everything_GetLastError';
function  Everything_GetReplyWindow; external EverythingDLL name 'Everything_GetReplyWindow';
function  Everything_GetReplyID; external EverythingDLL name 'Everything_GetReplyID';
function  Everything_GetSort; external EverythingDLL name 'Everything_GetSort';
function  Everything_GetRequestFlags; external EverythingDLL name 'Everything_GetRequestFlags';

// Execute query
function  Everything_QueryA; external EverythingDLL name 'Everything_QueryA';
function  Everything_QueryW; external EverythingDLL name 'Everything_QueryW';

// Query reply
function  Everything_IsQueryReply; external EverythingDLL name 'Everything_IsQueryReply';

// Write result state
procedure Everything_SortResultsByPath; external EverythingDLL name 'Everything_SortResultsByPath';

// Read result state
function  Everything_GetNumFileResults; external EverythingDLL name 'Everything_GetNumFileResults';
function  Everything_GetNumFolderResults; external EverythingDLL name 'Everything_GetNumFolderResults';
function  Everything_GetNumResults; external EverythingDLL name 'Everything_GetNumResults';
function  Everything_GetTotFileResults; external EverythingDLL name 'Everything_GetTotFileResults';
function  Everything_GetTotFolderResults; external EverythingDLL name 'Everything_GetTotFolderResults';
function  Everything_GetTotResults; external EverythingDLL name 'Everything_GetTotResults';
function  Everything_IsVolumeResult; external EverythingDLL name 'Everything_IsVolumeResult';
function  Everything_IsFolderResult; external EverythingDLL name 'Everything_IsFolderResult';
function  Everything_IsFileResult; external EverythingDLL name 'Everything_IsFileResult';
function  Everything_GetResultFileNameW; external EverythingDLL name 'Everything_GetResultFileNameW';
function  Everything_GetResultFileNameA; external EverythingDLL name 'Everything_GetResultFileNameA';
function  Everything_GetResultPathW; external EverythingDLL name 'Everything_GetResultPathW';
function  Everything_GetResultPathA; external EverythingDLL name 'Everything_GetResultPathA';
function  Everything_GetResultFullPathNameA; external EverythingDLL name 'Everything_GetResultFullPathNameA';
function  Everything_GetResultFullPathNameW; external EverythingDLL name 'Everything_GetResultFullPathNameW';
// Everything 1.4.1
function  Everything_GetResultListSort; external EverythingDLL name 'Everything_GetResultListSort';
// Everything 1.4.1
function  Everything_GetResultListRequestFlags; external EverythingDLL name 'Everything_GetResultListRequestFlags';
// Everything 1.4.1
function  Everything_GetResultExtensionW; external EverythingDLL name 'Everything_GetResultExtensionW';
// Everything 1.4.1
function  Everything_GetResultExtensionA; external EverythingDLL name 'Everything_GetResultExtensionA';
// Everything 1.4.1
function  Everything_GetResultSize; external EverythingDLL name 'Everything_GetResultSize';
// Everything 1.4.1
function  Everything_GetResultDateCreated; external EverythingDLL name 'Everything_GetResultDateCreated';
// Everything 1.4.1
function  Everything_GetResultDateModified; external EverythingDLL name 'Everything_GetResultDateModified';
// Everything 1.4.1
function  Everything_GetResultDateAccessed; external EverythingDLL name 'Everything_GetResultDateAccessed';
// Everything 1.4.1
function  Everything_GetResultAttributes; external EverythingDLL name 'Everything_GetResultAttributes';
// Everything 1.4.1
function  Everything_GetResultFileListFileNameW; external EverythingDLL name 'Everything_GetResultFileListFileNameW';
// Everything 1.4.1
function  Everything_GetResultFileListFileNameA; external EverythingDLL name 'Everything_GetResultFileListFileNameA';
// Everything 1.4.1
function  Everything_GetResultRunCount; external EverythingDLL name 'Everything_GetResultRunCount';
function  Everything_GetResultDateRun; external EverythingDLL name 'Everything_GetResultDateRun';
function  Everything_GetResultDateRecentlyChanged; external EverythingDLL name 'Everything_GetResultDateRecentlyChanged';
// Everything 1.4.1
function  Everything_GetResultHighlightedFileNameW; external EverythingDLL name 'Everything_GetResultHighlightedFileNameW';
// Everything 1.4.1
function  Everything_GetResultHighlightedFileNameA; external EverythingDLL name 'Everything_GetResultHighlightedFileNameA';
// Everything 1.4.1
function  Everything_GetResultHighlightedPathW; external EverythingDLL name 'Everything_GetResultHighlightedPathW';
// Everything 1.4.1
function  Everything_GetResultHighlightedPathA; external EverythingDLL name 'Everything_GetResultHighlightedPathA';
// Everything 1.4.1
function  Everything_GetResultHighlightedFullPathAndFileNameW; external EverythingDLL name 'Everything_GetResultHighlightedFullPathAndFileNameW';
// Everything 1.4.1
function  Everything_GetResultHighlightedFullPathAndFileNameA; external EverythingDLL name 'Everything_GetResultHighlightedFullPathAndFileNameA';

// Reset state and free any allocated memory
procedure Everything_Reset; external EverythingDLL name 'Everything_Reset';
procedure Everything_CleanUp; external EverythingDLL name 'Everything_CleanUp';

function  Everything_GetMajorVersion; external EverythingDLL name 'Everything_GetMajorVersion';
function  Everything_GetMinorVersion; external EverythingDLL name 'Everything_GetMinorVersion';
function  Everything_GetRevision; external EverythingDLL name 'Everything_GetRevision';
function  Everything_GetBuildNumber; external EverythingDLL name 'Everything_GetBuildNumber';
function  Everything_Exit: BOOL; external EverythingDLL name 'Everything_Exit';
function  Everything_MSIExitAndStopService; external EverythingDLL name 'Everything_MSIExitAndStopService';
function  Everything_MSIStartService; external EverythingDLL name 'Everything_MSIStartService';

// Everything 1.4.1
function  Everything_IsDBLoaded; external EverythingDLL name 'Everything_IsDBLoaded';
// Everything 1.4.1
function  Everything_IsAdmin; external EverythingDLL name 'Everything_IsAdmin';
// Everything 1.4.1
function  Everything_IsAppData; external EverythingDLL name 'Everything_IsAppData';
// Everything 1.4.1
function  Everything_RebuildDB; external EverythingDLL name 'Everything_RebuildDB';
// Everything 1.4.1
function  Everything_UpdateAllFolderIndexes; external EverythingDLL name 'Everything_UpdateAllFolderIndexes';
// Everything 1.4.1
function  Everything_SaveDB; external EverythingDLL name 'Everything_SaveDB';
// Everything 1.4.1
function  Everything_SaveRunHistory; external EverythingDLL name 'Everything_SaveRunHistory';
// Everything 1.4.1
function  Everything_DeleteRunHistory; external EverythingDLL name 'Everything_DeleteRunHistory';
// Everything 1.4.1
function  Everything_GetTargetMachine; external EverythingDLL name 'Everything_GetTargetMachine';
// Everything 1.4.1.859
function  Everything_IsFastSort; external EverythingDLL name 'Everything_IsFastSort';
// Everything 1.4.1.859
function  Everything_IsFileInfoIndexed; external EverythingDLL name 'Everything_IsFileInfoIndexed';

// Everything 1.4.1
function  Everything_GetRunCountFromFileNameW; external EverythingDLL name 'Everything_GetRunCountFromFileNameW';
// Everything 1.4.1
function  Everything_GetRunCountFromFileNameA; external EverythingDLL name 'Everything_GetRunCountFromFileNameA';
// Everything 1.4.1
function  Everything_SetRunCountFromFileNameW; external EverythingDLL name 'Everything_SetRunCountFromFileNameW';
// Everything 1.4.1
function  Everything_SetRunCountFromFileNameA; external EverythingDLL name 'Everything_SetRunCountFromFileNameA';
// Everything 1.4.1
function  Everything_IncRunCountFromFileNameW; external EverythingDLL name 'Everything_IncRunCountFromFileNameW';
// Everything 1.4.1
function  Everything_IncRunCountFromFileNameA; external EverythingDLL name 'Everything_IncRunCountFromFileNameA';

// Retrieves a Human-Readable error message corresponding to a given error code
function  Everything_GetErrorMessage(ACode: Integer): string;
var
  I: Integer;
begin
  for I := Low(defEverythingErrorInfos) to High(defEverythingErrorInfos) do
    if defEverythingErrorInfos[I].Code = ACode then
  begin
    Result := defEverythingErrorInfos[I].Description;
    Exit;
  end;
  Result := Format(rsErrUnKnownErrorFmt, [ACode]);
end;

// Retrieves the current version of the Everything SDK
function  Everything_GetVersion: string;
begin
  Result := Format('%d.%d.%d.%d', [Everything_GetMajorVersion, Everything_GetMinorVersion, Everything_GetRevision, Everything_GetBuildNumber]);
end;

end.
