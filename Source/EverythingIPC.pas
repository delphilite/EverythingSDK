{ ***************************************************** }
{                                                       }
{  Pascal language binding for Everything IPC           }
{                                                       }
{  Unit Name: Everything Api Header                     }
{     Author: Lsuper 2024.08.01                         }
{    Purpose: Everything_Ipc.h                          }
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

unit EverythingIPC;

interface

uses
  Windows;

const
  EVERYTHING_WM_IPC                                        = $0400; { WM_USER }

  EVERYTHING_IPC_TARGET_MACHINE_X86                        = 1;
  EVERYTHING_IPC_TARGET_MACHINE_X64                        = 2;
  EVERYTHING_IPC_TARGET_MACHINE_ARM                        = 3;
  EVERYTHING_IPC_TARGET_MACHINE_ARM64                      = 4;

  // built in filters
  EVERYTHING_IPC_FILTER_EVERYTHING                         = 0;
  EVERYTHING_IPC_FILTER_AUDIO                              = 1;
  EVERYTHING_IPC_FILTER_COMPRESSED                         = 2;
  EVERYTHING_IPC_FILTER_DOCUMENT                           = 3;
  EVERYTHING_IPC_FILTER_EXECUTABLE                         = 4;
  EVERYTHING_IPC_FILTER_FOLDER                             = 5;
  EVERYTHING_IPC_FILTER_PICTURE                            = 6;
  EVERYTHING_IPC_FILTER_VIDEO                              = 7;
  EVERYTHING_IPC_FILTER_CUSTOM                             = 8;

  // EVERYTHING_WM_IPC (send to the Everything taskbar notification window)
  // the Everything taskbar notification window is always created when Everything is running. (even when the taskbar notification icon is hidden)
  // HWND everything_taskbar_notification_hwnd = FindWindow(EVERYTHING_IPC_WNDCLASS,0);
  // SendMessage(everything_taskbar_notification_hwnd,EVERYTHING_WM_IPC,EVERYTHING_IPC_*,lParam)

  // version format: major.minor.revision.build
  // example: 1.4.1.877
  EVERYTHING_IPC_GET_MAJOR_VERSION                         = 0; // int major_version = (int)SendMessage(everything_taskbar_notification_hwnd,EVERYTHING_WM_IPC,EVERYTHING_IPC_GET_MAJOR_VERSION,0);
  EVERYTHING_IPC_GET_MINOR_VERSION                         = 1; // int minor_version = (int)SendMessage(everything_taskbar_notification_hwnd,EVERYTHING_WM_IPC,EVERYTHING_IPC_GET_MINOR_VERSION,0);
  EVERYTHING_IPC_GET_REVISION                              = 2; // int revision = (int)SendMessage(everything_taskbar_notification_hwnd,EVERYTHING_WM_IPC,EVERYTHING_IPC_GET_REVISION,0);
  EVERYTHING_IPC_GET_BUILD_NUMBER                          = 3; // int build = (int)SendMessage(everything_taskbar_notification_hwnd,EVERYTHING_WM_IPC,EVERYTHING_IPC_GET_BUILD,0);
  EVERYTHING_IPC_EXIT                                      = 4; // returns 1 if the program closes.
  EVERYTHING_IPC_GET_TARGET_MACHINE                        = 5; // int target_machine = (int)SendMessage(everything_taskbar_notification_hwnd,EVERYTHING_WM_IPC,EVERYTHING_IPC_GET_TARGET_MACHINE,0); returns 0 if not supported. returns a EVERYTHING_IPC_TARGET_MACHINE_* value. requires Everything 1.4.1

  // uninstall options
  EVERYTHING_IPC_DELETE_START_MENU_SHORTCUTS               = 100;  // SendMessage(everything_taskbar_notification_hwnd,EVERYTHING_WM_IPC,EVERYTHING_IPC_DELETE_START_MENU_SHORTCUTS,0);
  EVERYTHING_IPC_DELETE_QUICK_LAUNCH_SHORTCUT              = 101;  // SendMessage(everything_taskbar_notification_hwnd,EVERYTHING_WM_IPC,EVERYTHING_IPC_DELETE_QUICK_LAUNCH_SHORTCUT,0);
  EVERYTHING_IPC_DELETE_DESKTOP_SHORTCUT                   = 102;  // SendMessage(everything_taskbar_notification_hwnd,EVERYTHING_WM_IPC,EVERYTHING_IPC_DELETE_DESKTOP_SHORTCUT,0);
  EVERYTHING_IPC_DELETE_FOLDER_CONTEXT_MENU                = 103;  // SendMessage(everything_taskbar_notification_hwnd,EVERYTHING_WM_IPC,EVERYTHING_IPC_DELETE_FOLDER_CONTEXT_MENU,0);
  EVERYTHING_IPC_DELETE_RUN_ON_SYSTEM_STARTUP              = 104;  // SendMessage(everything_taskbar_notification_hwnd,EVERYTHING_WM_IPC,EVERYTHING_IPC_DELETE_RUN_ON_SYSTEM_STARTUP,0);
  EVERYTHING_IPC_DELETE_URL_PROTOCOL                       = 105;  // SendMessage(everything_taskbar_notification_hwnd,EVERYTHING_WM_IPC,EVERYTHING_IPC_DELETE_URL_PROTOCOL,0);

  // install options
  EVERYTHING_IPC_CREATE_START_MENU_SHORTCUTS               = 200;  // SendMessage(everything_taskbar_notification_hwnd,EVERYTHING_WM_IPC,EVERYTHING_IPC_CREATE_START_MENU_SHORTCUTS,0);
  EVERYTHING_IPC_CREATE_QUICK_LAUNCH_SHORTCUT              = 201;  // SendMessage(everything_taskbar_notification_hwnd,EVERYTHING_WM_IPC,EVERYTHING_IPC_CREATE_QUICK_LAUNCH_SHORTCUT,0);
  EVERYTHING_IPC_CREATE_DESKTOP_SHORTCUT                   = 202;  // SendMessage(everything_taskbar_notification_hwnd,EVERYTHING_WM_IPC,EVERYTHING_IPC_CREATE_DESKTOP_SHORTCUT,0);
  EVERYTHING_IPC_CREATE_FOLDER_CONTEXT_MENU                = 203;  // SendMessage(everything_taskbar_notification_hwnd,EVERYTHING_WM_IPC,EVERYTHING_IPC_CREATE_FOLDER_CONTEXT_MENU,0);
  EVERYTHING_IPC_CREATE_RUN_ON_SYSTEM_STARTUP              = 204;  // SendMessage(everything_taskbar_notification_hwnd,EVERYTHING_WM_IPC,EVERYTHING_IPC_CREATE_RUN_ON_SYSTEM_STARTUP,0);
  EVERYTHING_IPC_CREATE_URL_PROTOCOL                       = 205;  // SendMessage(everything_taskbar_notification_hwnd,EVERYTHING_WM_IPC,EVERYTHING_IPC_CREATE_URL_PROTOCOL,0);

  // get option status; 0 = no, 1 = yes, 2 = indeterminate (partially installed)
  EVERYTHING_IPC_IS_START_MENU_SHORTCUTS                   = 300;  // int ret = (int)SendMessage(everything_taskbar_notification_hwnd,EVERYTHING_WM_IPC,EVERYTHING_IPC_IS_START_MENU_SHORTCUTS,0);
  EVERYTHING_IPC_IS_QUICK_LAUNCH_SHORTCUT                  = 301;  // int ret = (int)SendMessage(everything_taskbar_notification_hwnd,EVERYTHING_WM_IPC,EVERYTHING_IPC_IS_QUICK_LAUNCH_SHORTCUT,0);
  EVERYTHING_IPC_IS_DESKTOP_SHORTCUT                       = 302;  // int ret = (int)SendMessage(everything_taskbar_notification_hwnd,EVERYTHING_WM_IPC,EVERYTHING_IPC_IS_DESKTOP_SHORTCUT,0);
  EVERYTHING_IPC_IS_FOLDER_CONTEXT_MENU                    = 303;  // int ret = (int)SendMessage(everything_taskbar_notification_hwnd,EVERYTHING_WM_IPC,EVERYTHING_IPC_IS_FOLDER_CONTEXT_MENU,0);
  EVERYTHING_IPC_IS_RUN_ON_SYSTEM_STARTUP                  = 304;  // int ret = (int)SendMessage(everything_taskbar_notification_hwnd,EVERYTHING_WM_IPC,EVERYTHING_IPC_IS_RUN_ON_SYSTEM_STARTUP,0);
  EVERYTHING_IPC_IS_URL_PROTOCOL                           = 305;  // int ret = (int)SendMessage(everything_taskbar_notification_hwnd,EVERYTHING_WM_IPC,EVERYTHING_IPC_IS_URL_PROTOCOL,0);
  EVERYTHING_IPC_IS_SERVICE                                = 306;  // int ret = (int)SendMessage(everything_taskbar_notification_hwnd,EVERYTHING_WM_IPC,EVERYTHING_IPC_IS_SERVICE,0);

  // indexing
  EVERYTHING_IPC_IS_NTFS_DRIVE_INDEXED                     = 400;  // int is_indexed = (int)SendMessage(everything_taskbar_notification_hwnd,EVERYTHING_WM_IPC,EVERYTHING_IPC_IS_NTFS_DRIVE_INDEXED,drive_index); drive_index: 0-25 = 0=A:, 1=B:, 2=C:...

  // requires Everything 1.4:
  EVERYTHING_IPC_IS_DB_LOADED                              = 401;  // int is_db_loaded = (int)SendMessage(everything_taskbar_notification_hwnd,EVERYTHING_WM_IPC,EVERYTHING_IPC_IS_DB_LOADED,0);
  EVERYTHING_IPC_IS_DB_BUSY                                = 402;  // int is_db_busy = (int)SendMessage(everything_taskbar_notification_hwnd,EVERYTHING_WM_IPC,EVERYTHING_IPC_IS_DB_BUSY,0); // db is busy, issuing another action will cancel the current one (if possible).
  EVERYTHING_IPC_IS_ADMIN                                  = 403;  // int is_admin = (int)SendMessage(everything_taskbar_notification_hwnd,EVERYTHING_WM_IPC,EVERYTHING_IPC_IS_ADMIN,0);
  EVERYTHING_IPC_IS_APPDATA                                = 404;  // int is_appdata = (int)SendMessage(everything_taskbar_notification_hwnd,EVERYTHING_WM_IPC,EVERYTHING_IPC_IS_APPDATA,0);
  EVERYTHING_IPC_REBUILD_DB                                = 405;  // SendMessage(everything_taskbar_notification_hwnd,EVERYTHING_WM_IPC,EVERYTHING_IPC_REBUILD_DB,0); // forces all indexes to be rescanned.
  EVERYTHING_IPC_UPDATE_ALL_FOLDER_INDEXES                 = 406;  // SendMessage(everything_taskbar_notification_hwnd,EVERYTHING_WM_IPC,EVERYTHING_IPC_UPDATE_ALL_FOLDER_INDEXES,0); // rescan all folder indexes.
  EVERYTHING_IPC_SAVE_DB                                   = 407;  // SendMessage(everything_taskbar_notification_hwnd,EVERYTHING_WM_IPC,EVERYTHING_IPC_SAVE_DB,0); // save the db to disk.
  EVERYTHING_IPC_SAVE_RUN_HISTORY                          = 408;  // SendMessage(everything_taskbar_notification_hwnd,EVERYTHING_WM_IPC,EVERYTHING_IPC_SAVE_RUN_HISTORY,0); // save run history to disk.
  EVERYTHING_IPC_DELETE_RUN_HISTORY                        = 409;  // SendMessage(everything_taskbar_notification_hwnd,EVERYTHING_WM_IPC,EVERYTHING_IPC_DELETE_RUN_HISTORY,0); // deletes all run history from memory and disk.
  EVERYTHING_IPC_IS_FAST_SORT                              = 410;  // SendMessage(everything_taskbar_notification_hwnd,EVERYTHING_WM_IPC,EVERYTHING_IPC_IS_FAST_SORT,EVERYTHING_IPC_SORT_*); // is the sort information indexed?
  EVERYTHING_IPC_IS_FILE_INFO_INDEXED                      = 411;  // SendMessage(everything_taskbar_notification_hwnd,EVERYTHING_WM_IPC,EVERYTHING_IPC_IS_FILE_INFO_INDEXED,EVERYTHING_IPC_FILE_INFO_*); // is the file/folder info indexed?

  // Everything 1.5
  EVERYTHING_IPC_QUEUE_REBUILD_DB                          = 412;  // SendMessage(everything_taskbar_notification_hwnd,EVERYTHING_WM_IPC,EVERYTHING_IPC_QUEUE_REBUILD_DB,0); // forces all indexes to be rescanned when the db is ready.

  // send the following to an existing Everything search window (requires Everything 1.4.1)
  // SendMessage(FindWindow(EVERYTHING_IPC_SEARCH_CLIENT_WNDCLASS,0),EVERYTHING_WM_IPC,EVERYTHING_IPC_*,0);
  EVERYTHING_IPC_IS_MATCH_CASE                             = 500;  // int is_match_case = (int)SendMessage(FindWindow(EVERYTHING_IPC_SEARCH_CLIENT_WNDCLASS,0),EVERYTHING_WM_IPC,EVERYTHING_IPC_IS_MATCH_CASE,0);
  EVERYTHING_IPC_IS_MATCH_WHOLE_WORD                       = 501;  // int is_match_whole_words = (int)SendMessage(FindWindow(EVERYTHING_IPC_SEARCH_CLIENT_WNDCLASS,0),EVERYTHING_WM_IPC,EVERYTHING_IPC_IS_MATCH_WHOLE_WORD,0);
  EVERYTHING_IPC_IS_MATCH_PATH                             = 502;  // int is_match_path = (int)SendMessage(FindWindow(EVERYTHING_IPC_SEARCH_CLIENT_WNDCLASS,0),EVERYTHING_WM_IPC,EVERYTHING_IPC_IS_MATCH_PATH,0);
  EVERYTHING_IPC_IS_MATCH_DIACRITICS                       = 503;  // int is_match_diacritics = (int)SendMessage(FindWindow(EVERYTHING_IPC_SEARCH_CLIENT_WNDCLASS,0),EVERYTHING_WM_IPC,EVERYTHING_IPC_IS_MATCH_DIACRITICS,0);
  EVERYTHING_IPC_IS_REGEX                                  = 504;  // int is_regex = (int)SendMessage(FindWindow(EVERYTHING_IPC_SEARCH_CLIENT_WNDCLASS,0),EVERYTHING_WM_IPC,EVERYTHING_IPC_IS_REGEX,0);
  EVERYTHING_IPC_IS_FILTERS                                = 505;  // int is_filters = (int)SendMessage(FindWindow(EVERYTHING_IPC_SEARCH_CLIENT_WNDCLASS,0),EVERYTHING_WM_IPC,EVERYTHING_IPC_IS_FILTERS,0);
  EVERYTHING_IPC_IS_PREVIEW                                = 506;  // int is_preview = (int)SendMessage(FindWindow(EVERYTHING_IPC_SEARCH_CLIENT_WNDCLASS,0),EVERYTHING_WM_IPC,EVERYTHING_IPC_IS_PREVIEW,0);
  EVERYTHING_IPC_IS_STATUS_BAR                             = 507;  // int is_status_bar = (int)SendMessage(FindWindow(EVERYTHING_IPC_SEARCH_CLIENT_WNDCLASS,0),EVERYTHING_WM_IPC,EVERYTHING_IPC_IS_STATUS_BAR,0);
  EVERYTHING_IPC_IS_DETAILS                                = 508;  // int is_details = (int)SendMessage(FindWindow(EVERYTHING_IPC_SEARCH_CLIENT_WNDCLASS,0),EVERYTHING_WM_IPC,EVERYTHING_IPC_IS_DETAILS,0);
  EVERYTHING_IPC_GET_THUMBNAIL_SIZE                        = 509;  // int thumbnail_size = (int)SendMessage(FindWindow(EVERYTHING_IPC_SEARCH_CLIENT_WNDCLASS,0),EVERYTHING_WM_IPC,EVERYTHING_IPC_GET_THUMBNAIL_SIZE,0); 0 = details
  EVERYTHING_IPC_GET_SORT                                  = 510;  // int sort = (int)SendMessage(FindWindow(EVERYTHING_IPC_SEARCH_CLIENT_WNDCLASS,0),EVERYTHING_WM_IPC,EVERYTHING_IPC_GET_SORT,0); sort can be one of EVERYTHING_IPC_SORT_* types.
  EVERYTHING_IPC_GET_ON_TOP                                = 511;  // int on_top = (int)SendMessage(FindWindow(EVERYTHING_IPC_SEARCH_CLIENT_WNDCLASS,0),EVERYTHING_WM_IPC,EVERYTHING_IPC_GET_ON_TOP,0); 0=never, 1=always, 2=while searching.
  EVERYTHING_IPC_GET_FILTER                                = 512;  // int filter = (int)SendMessage(FindWindow(EVERYTHING_IPC_SEARCH_CLIENT_WNDCLASS,0),EVERYTHING_WM_IPC,EVERYTHING_IPC_GET_FILTER,0); filter can be one of EVERYTHING_IPC_FILTER_* types.
  EVERYTHING_IPC_GET_FILTER_INDEX                          = 513;  // int filter_index = (int)SendMessage(FindWindow(EVERYTHING_IPC_SEARCH_CLIENT_WNDCLASS,0),EVERYTHING_WM_IPC,EVERYTHING_IPC_GET_FILTER_INDEX,0);

  // Everything 1.5
  EVERYTHING_IPC_IS_MATCH_PREFIX                           = 514;  // int is_match_prefix = (int)SendMessage(FindWindow(EVERYTHING_IPC_SEARCH_CLIENT_WNDCLASS,0),EVERYTHING_WM_IPC,EVERYTHING_IPC_IS_MATCH_PREFIX,0);
  EVERYTHING_IPC_IS_MATCH_SUFFIX                           = 515;  // int is_match_suffix = (int)SendMessage(FindWindow(EVERYTHING_IPC_SEARCH_CLIENT_WNDCLASS,0),EVERYTHING_WM_IPC,EVERYTHING_IPC_IS_MATCH_SUFFIX,0);
  EVERYTHING_IPC_IS_IGNORE_PUNCTUATION                     = 516;  // int is_ignore_punctuation = (int)SendMessage(FindWindow(EVERYTHING_IPC_SEARCH_CLIENT_WNDCLASS,0),EVERYTHING_WM_IPC,EVERYTHING_IPC_IS_IGNORE_PUNCTUATION,0);
  EVERYTHING_IPC_IS_IGNORE_WHITESPACE                      = 517;  // int is_ignore_whitespace = (int)SendMessage(FindWindow(EVERYTHING_IPC_SEARCH_CLIENT_WNDCLASS,0),EVERYTHING_WM_IPC,EVERYTHING_IPC_IS_IGNORE_WHITESPACE,0);
  EVERYTHING_IPC_IS_SEARCH_AS_YOU_TYPE                     = 518;  // int is_search_as_you_type = (int)SendMessage(FindWindow(EVERYTHING_IPC_SEARCH_CLIENT_WNDCLASS,0),EVERYTHING_WM_IPC,EVERYTHING_IPC_IS_SEARCH_AS_YOU_TYPE,0);

  // command IDs to send to an Everything search window.
  // SendMessage(FindWindow(EVERYTHING_IPC_SEARCH_CLIENT_WNDCLASS,0),WM_COMMAND,MAKEWPARAM(EVERYTHING_IPC_ID_*,0),0);

  // main menus
  EVERYTHING_IPC_ID_FILE_MENU                              = 10001;
  EVERYTHING_IPC_ID_EDIT_MENU                              = 10002;
  EVERYTHING_IPC_ID_SEARCH_MENU                            = 10003;
  EVERYTHING_IPC_ID_TOOLS_MENU                             = 10004;
  EVERYTHING_IPC_ID_HELP_MENU                              = 10005;
  EVERYTHING_IPC_ID_TOOLBAR                                = 10006;
  EVERYTHING_IPC_ID_SEARCH_EDIT                            = 10007;
  EVERYTHING_IPC_ID_FILTER                                 = 10008;
  EVERYTHING_IPC_ID_RESULTS_HEADER                         = 10009;
  EVERYTHING_IPC_ID_STATUS                                 = 10010;
  EVERYTHING_IPC_ID_VIEW_ZOOM_MENU                         = 10012;
  EVERYTHING_IPC_ID_VIEW_MENU                              = 10013;
  EVERYTHING_IPC_ID_VIEW_WINDOW_SIZE_MENU                  = 10019;
  EVERYTHING_IPC_ID_RESULT_LIST                            = 10020;
  EVERYTHING_IPC_ID_BOOKMARKS_MENU                         = 10021;
  EVERYTHING_IPC_ID_VIEW_SORT_BY_MENU                      = 10022;
  EVERYTHING_IPC_ID_VIEW_GOTO_MENU                         = 10024;
  EVERYTHING_IPC_ID_VIEW_ONTOP_MENU                        = 10025;
  EVERYTHING_IPC_ID_PREVIEW                                = 10026;

  // TRAY
  EVERYTHING_IPC_ID_TRAY_NEW_SEARCH_WINDOW                 = 40001;
  EVERYTHING_IPC_ID_TRAY_CONNECT_TO_ETP_SERVER             = 40004;
  EVERYTHING_IPC_ID_TRAY_OPTIONS                           = 40005;
  EVERYTHING_IPC_ID_TRAY_EXIT                              = 40006;
  EVERYTHING_IPC_ID_TRAY_SHOW_SEARCH_WINDOW                = 40007;
  EVERYTHING_IPC_ID_TRAY_TOGGLE_SEARCH_WINDOW              = 40008;

  // FILE
  EVERYTHING_IPC_ID_FILE_NEW_WINDOW                        = 40010;
  EVERYTHING_IPC_ID_FILE_CLOSE                             = 40011;
  EVERYTHING_IPC_ID_FILE_EXPORT                            = 40012;
  EVERYTHING_IPC_ID_FILE_EXIT                              = 40013;
  EVERYTHING_IPC_ID_FILE_OPEN_FILELIST                     = 40014;
  EVERYTHING_IPC_ID_FILE_CLOSE_FILELIST                    = 40015;

  // EDIT
  EVERYTHING_IPC_ID_EDIT_CUT                               = 40020;
  EVERYTHING_IPC_ID_EDIT_COPY                              = 40021;
  EVERYTHING_IPC_ID_EDIT_PASTE                             = 40022;
  EVERYTHING_IPC_ID_EDIT_SELECT_ALL                        = 40023;
  EVERYTHING_IPC_ID_EDIT_INVERT_SELECTION                  = 40029;

  // VIEW
  EVERYTHING_IPC_ID_VIEW_ZOOM_IN                           = 40030;
  EVERYTHING_IPC_ID_VIEW_ZOOM_OUT                          = 40031;
  EVERYTHING_IPC_ID_VIEW_ZOOM_RESET                        = 40032;
  EVERYTHING_IPC_ID_VIEW_TOGGLE_FULLSCREEN                 = 40034;
  EVERYTHING_IPC_ID_VIEW_AUTO_FIT                          = 40044;
  EVERYTHING_IPC_ID_VIEW_AUTO_SIZE_1                       = 40045;
  EVERYTHING_IPC_ID_VIEW_AUTO_SIZE_2                       = 40046;
  EVERYTHING_IPC_ID_VIEW_AUTO_SIZE_3                       = 40047;
  EVERYTHING_IPC_ID_VIEW_REFRESH                           = 40036;
  EVERYTHING_IPC_ID_VIEW_FILTERS                           = 40035;
  EVERYTHING_IPC_ID_VIEW_SORT_BY_ASCENDING                 = 40037;
  EVERYTHING_IPC_ID_VIEW_SORT_BY_DESCENDING                = 40038;
  EVERYTHING_IPC_ID_VIEW_STATUS_BAR                        = 40039;
  EVERYTHING_IPC_ID_VIEW_GOTO_BACK                         = 40040;
  EVERYTHING_IPC_ID_VIEW_GOTO_FORWARD                      = 40041;
  EVERYTHING_IPC_ID_VIEW_ONTOP_NEVER                       = 40042;
  EVERYTHING_IPC_ID_VIEW_ONTOP_ALWAYS                      = 40043;
  EVERYTHING_IPC_ID_VIEW_ONTOP_WHILE_SEARCHING             = 40048;
  EVERYTHING_IPC_ID_VIEW_GOTO_HOME                         = 40049;
  EVERYTHING_IPC_ID_VIEW_TOGGLE_LTR_RTL                    = 40050;
  EVERYTHING_IPC_ID_VIEW_DETAILS                           = 40051;
  EVERYTHING_IPC_ID_VIEW_MEDIUM_ICONS                      = 40052;
  EVERYTHING_IPC_ID_VIEW_LARGE_ICONS                       = 40053;
  EVERYTHING_IPC_ID_VIEW_EXTRA_LARGE_ICONS                 = 40054;
  EVERYTHING_IPC_ID_VIEW_PREVIEW                           = 40055;
  EVERYTHING_IPC_ID_VIEW_GOTO_SHOW_ALL_HISTORY             = 40056;
  EVERYTHING_IPC_ID_VIEW_INCREASE_THUMBNAIL_SIZE           = 40057;
  EVERYTHING_IPC_ID_VIEW_DECREASE_THUMBNAIL_SIZE           = 40058;
  EVERYTHING_IPC_ID_VIEW_SHOW_FILTERS                      = 40096; // Everything 1.4.1
  EVERYTHING_IPC_ID_VIEW_HIDE_FILTERS                      = 40097; // Everything 1.4.1
  EVERYTHING_IPC_ID_VIEW_SHOW_PREVIEW                      = 40098; // Everything 1.4.1
  EVERYTHING_IPC_ID_VIEW_HIDE_PREVIEW                      = 40099; // Everything 1.4.1
  EVERYTHING_IPC_ID_VIEW_SHOW_STATUS_BAR                   = 40100; // Everything 1.4.1
  EVERYTHING_IPC_ID_VIEW_HIDE_STATUS_BAR                   = 40101; // Everything 1.4.1
  EVERYTHING_IPC_ID_VIEW_DETAILS_NO_TOGGLE                 = 40102; // Everything 1.4.1
  EVERYTHING_IPC_ID_VIEW_MEDIUM_ICONS_NO_TOGGLE            = 40103; // Everything 1.4.1
  EVERYTHING_IPC_ID_VIEW_LARGE_ICONS_NO_TOGGLE             = 40104; // Everything 1.4.1
  EVERYTHING_IPC_ID_VIEW_EXTRA_LARGE_ICONS_NO_TOGGLE       = 40105; // Everything 1.4.1

  // SEARCH
  EVERYTHING_IPC_ID_SEARCH_TOGGLE_MATCH_CASE               = 40060;
  EVERYTHING_IPC_ID_SEARCH_TOGGLE_MATCH_WHOLE_WORD         = 40061;
  EVERYTHING_IPC_ID_SEARCH_TOGGLE_MATCH_PATH               = 40062;
  EVERYTHING_IPC_ID_SEARCH_TOGGLE_REGEX                    = 40063;
  EVERYTHING_IPC_ID_SEARCH_TOGGLE_MATCH_DIACRITICS         = 40066;
  EVERYTHING_IPC_ID_SEARCH_FILTER_ADD                      = 40067;
  EVERYTHING_IPC_ID_SEARCH_FILTER_ORGANIZE                 = 40068;
  EVERYTHING_IPC_ID_SEARCH_ADVANCED_SEARCH                 = 40069;
  EVERYTHING_IPC_ID_SEARCH_ENABLE_MATCH_CASE               = 40106; // Everything 1.4.1
  EVERYTHING_IPC_ID_SEARCH_ENABLE_MATCH_WHOLE_WORD         = 40107; // Everything 1.4.1
  EVERYTHING_IPC_ID_SEARCH_ENABLE_MATCH_PATH               = 40108; // Everything 1.4.1
  EVERYTHING_IPC_ID_SEARCH_ENABLE_REGEX                    = 40109; // Everything 1.4.1
  EVERYTHING_IPC_ID_SEARCH_ENABLE_MATCH_DIACRITICS         = 40110; // Everything 1.4.1
  EVERYTHING_IPC_ID_SEARCH_DISABLE_MATCH_CASE              = 40111; // Everything 1.4.1
  EVERYTHING_IPC_ID_SEARCH_DISABLE_MATCH_WHOLE_WORD        = 40112; // Everything 1.4.1
  EVERYTHING_IPC_ID_SEARCH_DISABLE_MATCH_PATH              = 40113; // Everything 1.4.1
  EVERYTHING_IPC_ID_SEARCH_DISABLE_REGEX                   = 40114; // Everything 1.4.1
  EVERYTHING_IPC_ID_SEARCH_DISABLE_MATCH_DIACRITICS        = 40115; // Everything 1.4.1
  EVERYTHING_IPC_ID_SEARCH_FILTER_EVERYTHING               = 40116; // Everything 1.4.1
  EVERYTHING_IPC_ID_SEARCH_FILTER_AUDIO                    = 40117; // Everything 1.4.1
  EVERYTHING_IPC_ID_SEARCH_FILTER_COMPRESSED               = 40118; // Everything 1.4.1
  EVERYTHING_IPC_ID_SEARCH_FILTER_DOCUMENT                 = 40119; // Everything 1.4.1
  EVERYTHING_IPC_ID_SEARCH_FILTER_EXECUTABLE               = 40120; // Everything 1.4.1
  EVERYTHING_IPC_ID_SEARCH_FILTER_FOLDER                   = 40121; // Everything 1.4.1
  EVERYTHING_IPC_ID_SEARCH_FILTER_PICTURE                  = 40122; // Everything 1.4.1
  EVERYTHING_IPC_ID_SEARCH_FILTER_VIDEO                    = 40123; // Everything 1.4.1
  EVERYTHING_IPC_ID_SEARCH_FILTER_AUDIO_NO_TOGGLE          = 40124; // Everything 1.4.1
  EVERYTHING_IPC_ID_SEARCH_FILTER_COMPRESSED_NO_TOGGLE     = 40125; // Everything 1.4.1
  EVERYTHING_IPC_ID_SEARCH_FILTER_DOCUMENT_NO_TOGGLE       = 40126; // Everything 1.4.1
  EVERYTHING_IPC_ID_SEARCH_FILTER_EXECUTABLE_NO_TOGGLE     = 40127; // Everything 1.4.1
  EVERYTHING_IPC_ID_SEARCH_FILTER_FOLDER_NO_TOGGLE         = 40128; // Everything 1.4.1
  EVERYTHING_IPC_ID_SEARCH_FILTER_PICTURE_NO_TOGGLE        = 40129; // Everything 1.4.1
  EVERYTHING_IPC_ID_SEARCH_FILTER_VIDEO_NO_TOGGLE          = 40130; // Everything 1.4.1

  // TOOLS
  EVERYTHING_IPC_ID_TOOLS_CONNECT_TO_ETP_SERVER            = 40072;
  EVERYTHING_IPC_ID_TOOLS_DISCONNECT_FROM_ETP_SERVER       = 40073;
  EVERYTHING_IPC_ID_TOOLS_OPTIONS                          = 40074;
  EVERYTHING_IPC_ID_TOOLS_CONSOLE                          = 40075;
  EVERYTHING_IPC_ID_TOOLS_EDITOR                           = 40076;

  // HELP
  EVERYTHING_IPC_ID_HELP_VIEW_HELP_TOPICS                  = 40080;
  EVERYTHING_IPC_ID_HELP_OPEN_EVERYTHING_WEBSITE           = 40081;
  EVERYTHING_IPC_ID_HELP_CHECK_FOR_UPDATES                 = 40082;
  EVERYTHING_IPC_ID_HELP_ABOUT_EVERYTHING                  = 40083;
  EVERYTHING_IPC_ID_HELP_SEARCH_SYNTAX                     = 40084;
  EVERYTHING_IPC_ID_HELP_COMMAND_LINE_OPTIONS              = 40085;
  EVERYTHING_IPC_ID_HELP_REGEX_SYNTAX                      = 40086;
  EVERYTHING_IPC_ID_HELP_DONATE                            = 40087;

  // bookmarks
  EVERYTHING_IPC_ID_BOOKMARK_ADD                           = 40090;
  EVERYTHING_IPC_ID_BOOKMARK_ORGANIZE                      = 40091;
  EVERYTHING_IPC_ID_BOOKMARK_START                         = 44000;
  EVERYTHING_IPC_ID_BOOKMARK_END                           = 45000; // exclusive

  EVERYTHING_IPC_ID_FILTER_START                           = 45000;
  EVERYTHING_IPC_ID_FILTER_END                             = 46000; // exclusive

  EVERYTHING_IPC_ID_VIEW_GOTO_START                        = 46000;
  EVERYTHING_IPC_ID_VIEW_GOTO_END                          = 47000; // exclusive

  // files
  EVERYTHING_IPC_ID_FILE_OPEN                              = 41000;
  EVERYTHING_IPC_ID_FILE_OPEN_NEW                          = 41048;
  EVERYTHING_IPC_ID_FILE_OPEN_WITH                         = 41049;
  EVERYTHING_IPC_ID_FILE_EDIT                              = 41050;
  EVERYTHING_IPC_ID_FILE_PLAY                              = 41051;
  EVERYTHING_IPC_ID_FILE_PRINT                             = 41052;
  EVERYTHING_IPC_ID_FILE_PREVIEW                           = 41053;
  EVERYTHING_IPC_ID_FILE_PRINT_TO                          = 41054;
  EVERYTHING_IPC_ID_FILE_RUN_AS                            = 41055;
  EVERYTHING_IPC_ID_FILE_OPEN_WITH_DEFAULT_VERB            = 41056;
  EVERYTHING_IPC_ID_FILE_OPEN_AND_CLOSE                    = 41057;
  EVERYTHING_IPC_ID_FILE_EXPLORE_PATH                      = 41002;
  EVERYTHING_IPC_ID_FILE_OPEN_PATH                         = 41003;
  EVERYTHING_IPC_ID_FILE_DELETE                            = 41004;
  EVERYTHING_IPC_ID_FILE_PERMANENTLY_DELETE                = 41005;
  EVERYTHING_IPC_ID_FILE_RENAME                            = 41006;
  EVERYTHING_IPC_ID_FILE_COPY_FULL_PATH_AND_NAME           = 41007;
  EVERYTHING_IPC_ID_FILE_COPY_PATH                         = 41008;
  EVERYTHING_IPC_ID_FILE_PROPERTIES                        = 41009;
  EVERYTHING_IPC_ID_FILE_READ_EXTENDED_INFORMATION         = 41064;
  EVERYTHING_IPC_ID_FILE_CREATE_SHORTCUT                   = 41065;
  EVERYTHING_IPC_ID_FILE_SET_RUN_COUNT                     = 41068;
  EVERYTHING_IPC_ID_FILE_COPY_NAME                         = 41011;
  EVERYTHING_IPC_ID_FILE_OPEN_AND_DO_NOT_CLOSE             = 41076;

  // result list
  EVERYTHING_IPC_ID_RESULT_LIST_EXPLORE                    = 41001;
  EVERYTHING_IPC_ID_RESULT_LIST_FOCUS                      = 41010;
  EVERYTHING_IPC_ID_RESULT_LIST_AUTOFIT_COLUMNS            = 41012;
  EVERYTHING_IPC_ID_RESULT_LIST_DOWN                       = 41018;
  EVERYTHING_IPC_ID_RESULT_LIST_UP                         = 41019;
  EVERYTHING_IPC_ID_RESULT_LIST_PAGE_UP                    = 41020;
  EVERYTHING_IPC_ID_RESULT_LIST_PAGE_DOWN                  = 41021;
  EVERYTHING_IPC_ID_RESULT_LIST_START                      = 41022;
  EVERYTHING_IPC_ID_RESULT_LIST_END                        = 41023;
  EVERYTHING_IPC_ID_RESULT_LIST_DOWN_EXTEND                = 41024;
  EVERYTHING_IPC_ID_RESULT_LIST_UP_EXTEND                  = 41025;
  EVERYTHING_IPC_ID_RESULT_LIST_PAGE_UP_EXTEND             = 41026;
  EVERYTHING_IPC_ID_RESULT_LIST_PAGE_DOWN_EXTEND           = 41027;
  EVERYTHING_IPC_ID_RESULT_LIST_START_EXTEND               = 41028;
  EVERYTHING_IPC_ID_RESULT_LIST_END_EXTEND                 = 41029;
  EVERYTHING_IPC_ID_RESULT_LIST_FOCUS_DOWN                 = 41030;
  EVERYTHING_IPC_ID_RESULT_LIST_FOCUS_UP                   = 41031;
  EVERYTHING_IPC_ID_RESULT_LIST_FOCUS_PAGE_UP              = 41032;
  EVERYTHING_IPC_ID_RESULT_LIST_FOCUS_PAGE_DOWN            = 41033;
  EVERYTHING_IPC_ID_RESULT_LIST_FOCUS_START                = 41034;
  EVERYTHING_IPC_ID_RESULT_LIST_FOCUS_END                  = 41035;
  EVERYTHING_IPC_ID_RESULT_LIST_SCROLL_LEFT                = 41036;
  EVERYTHING_IPC_ID_RESULT_LIST_SCROLL_RIGHT               = 41037;
  EVERYTHING_IPC_ID_RESULT_LIST_SCROLL_PAGE_LEFT           = 41038;
  EVERYTHING_IPC_ID_RESULT_LIST_SCROLL_PAGE_RIGHT          = 41039;
  EVERYTHING_IPC_ID_RESULT_LIST_SELECT_FOCUS               = 41040;
  EVERYTHING_IPC_ID_RESULT_LIST_TOGGLE_FOCUS_SELECTION     = 41041;
  EVERYTHING_IPC_ID_RESULT_LIST_CONTEXT_MENU               = 41046;
  EVERYTHING_IPC_ID_RESULT_LIST_FOCUS_DOWN_EXTEND          = 41058;
  EVERYTHING_IPC_ID_RESULT_LIST_FOCUS_UP_EXTEND            = 41059;
  EVERYTHING_IPC_ID_RESULT_LIST_FOCUS_PAGE_UP_EXTEND       = 41060;
  EVERYTHING_IPC_ID_RESULT_LIST_FOCUS_PAGE_DOWN_EXTEND     = 41061;
  EVERYTHING_IPC_ID_RESULT_LIST_FOCUS_START_EXTEND         = 41062;
  EVERYTHING_IPC_ID_RESULT_LIST_FOCUS_END_EXTEND           = 41063;
  EVERYTHING_IPC_ID_RESULT_LIST_AUTOFIT                    = 41066;
  EVERYTHING_IPC_ID_RESULT_LIST_COPY_CSV                   = 41067;
  EVERYTHING_IPC_ID_RESULT_LIST_LEFT_EXTEND                = 41070;
  EVERYTHING_IPC_ID_RESULT_LIST_RIGHT_EXTEND               = 41071;
  EVERYTHING_IPC_ID_RESULT_LIST_FOCUS_LEFT_EXTEND          = 41072;
  EVERYTHING_IPC_ID_RESULT_LIST_FOCUS_RIGHT_EXTEND         = 41073;
  EVERYTHING_IPC_ID_RESULT_LIST_FOCUS_MOST_RUN             = 41074;
  EVERYTHING_IPC_ID_RESULT_LIST_FOCUS_LAST_RUN             = 41075;
  EVERYTHING_IPC_ID_RESULT_LIST_LEFT                       = 41079; // Everything 1.4.1
  EVERYTHING_IPC_ID_RESULT_LIST_RIGHT                      = 41080; // Everything 1.4.1
  EVERYTHING_IPC_ID_RESULT_LIST_FOCUS_LEFT                 = 41081; // Everything 1.4.1
  EVERYTHING_IPC_ID_RESULT_LIST_FOCUS_RIGHT                = 41082; // Everything 1.4.1
  EVERYTHING_IPC_ID_RESULT_LIST_SCROLL_LEFT_SCROLL_ONLY    = 41083; // Everything 1.4.1
  EVERYTHING_IPC_ID_RESULT_LIST_SCROLL_RIGHT_SCROLL_ONLY   = 41084; // Everything 1.4.1
  EVERYTHING_IPC_ID_RESULT_LIST_SCROLL_PAGE_LEFT_SCROLL_ONLY = 41085; // Everything 1.4.1
  EVERYTHING_IPC_ID_RESULT_LIST_SCROLL_PAGE_RIGHT_SCROLL_ONLY = 41086; // Everything 1.4.1

  EVERYTHING_IPC_ID_RESULT_LIST_SORT_BY_NAME               = 41300;
  EVERYTHING_IPC_ID_RESULT_LIST_SORT_BY_PATH               = 41301;
  EVERYTHING_IPC_ID_RESULT_LIST_SORT_BY_SIZE               = 41302;
  EVERYTHING_IPC_ID_RESULT_LIST_SORT_BY_EXTENSION          = 41303;
  EVERYTHING_IPC_ID_RESULT_LIST_SORT_BY_TYPE               = 41304;
  EVERYTHING_IPC_ID_RESULT_LIST_SORT_BY_DATE_MODIFIED      = 41305;
  EVERYTHING_IPC_ID_RESULT_LIST_SORT_BY_DATE_CREATED       = 41306;
  EVERYTHING_IPC_ID_RESULT_LIST_SORT_BY_ATTRIBUTES         = 41307;
  EVERYTHING_IPC_ID_RESULT_LIST_SORT_BY_FILE_LIST_FILENAME = 41308;
  EVERYTHING_IPC_ID_RESULT_LIST_SORT_BY_RUN_COUNT          = 41309;
  EVERYTHING_IPC_ID_RESULT_LIST_SORT_BY_DATE_RECENTLY_CHANGED = 41310;
  EVERYTHING_IPC_ID_RESULT_LIST_SORT_BY_DATE_ACCESSED      = 41311;
  EVERYTHING_IPC_ID_RESULT_LIST_SORT_BY_DATE_RUN           = 41312;

  EVERYTHING_IPC_ID_RESULT_LIST_TOGGLE_NAME_COLUMN         = 41400;
  EVERYTHING_IPC_ID_RESULT_LIST_TOGGLE_PATH_COLUMN         = 41401;
  EVERYTHING_IPC_ID_RESULT_LIST_TOGGLE_SIZE_COLUMN         = 41402;
  EVERYTHING_IPC_ID_RESULT_LIST_TOGGLE_EXTENSION_COLUMN    = 41403;
  EVERYTHING_IPC_ID_RESULT_LIST_TOGGLE_TYPE_COLUMN         = 41404;
  EVERYTHING_IPC_ID_RESULT_LIST_TOGGLE_DATE_MODIFIED_COLUMN = 41405;
  EVERYTHING_IPC_ID_RESULT_LIST_TOGGLE_DATE_CREATED_COLUMN = 41406;
  EVERYTHING_IPC_ID_RESULT_LIST_TOGGLE_ATTRIBUTES_COLUMN   = 41407;
  EVERYTHING_IPC_ID_RESULT_LIST_TOGGLE_FILE_LIST_FILENAME_COLUMN = 41408;
  EVERYTHING_IPC_ID_RESULT_LIST_TOGGLE_RUN_COUNT_COLUMN    = 41409;
  EVERYTHING_IPC_ID_RESULT_LIST_TOGGLE_DATE_RECENTLY_CHANGED_COLUMN = 41410;
  EVERYTHING_IPC_ID_RESULT_LIST_TOGGLE_DATE_ACCESSED_COLUMN = 41411;
  EVERYTHING_IPC_ID_RESULT_LIST_TOGGLE_DATE_RUN_COLUMN     = 41412;

  EVERYTHING_IPC_ID_RESULT_LIST_SIZE_NAME_COLUMN_TO_FIT    = 41600;
  EVERYTHING_IPC_ID_RESULT_LIST_SIZE_PATH_COLUMN_TO_FIT    = 41601;
  EVERYTHING_IPC_ID_RESULT_LIST_SIZE_SIZE_COLUMN_TO_FIT    = 41602;
  EVERYTHING_IPC_ID_RESULT_LIST_SIZE_EXTENSION_COLUMN_TO_FIT = 41603;
  EVERYTHING_IPC_ID_RESULT_LIST_SIZE_TYPE_COLUMN_TO_FIT    = 41604;
  EVERYTHING_IPC_ID_RESULT_LIST_SIZE_DATE_MODIFIED_COLUMN_TO_FIT = 41605;
  EVERYTHING_IPC_ID_RESULT_LIST_SIZE_DATE_CREATED_COLUMN_TO_FIT = 41606;
  EVERYTHING_IPC_ID_RESULT_LIST_SIZE_ATTRIBUTES_COLUMN_TO_FIT = 41607;
  EVERYTHING_IPC_ID_RESULT_LIST_SIZE_FILE_LIST_FILENAME_COLUMN_TO_FIT = 41608;
  EVERYTHING_IPC_ID_RESULT_LIST_SIZE_RUN_COUNT_COLUMN_TO_FIT = 41609;
  EVERYTHING_IPC_ID_RESULT_LIST_SIZE_DATE_RECENTLY_CHANGED_COLUMN_TO_FIT = 41610;
  EVERYTHING_IPC_ID_RESULT_LIST_SIZE_DATE_ACCESSED_COLUMN_TO_FIT = 41611;
  EVERYTHING_IPC_ID_RESULT_LIST_SIZE_DATE_RUN_COLUMN_TO_FIT = 41612;

  EVERYTHING_IPC_ID_FILE_CUSTOM_VERB01                     = 41500;
  EVERYTHING_IPC_ID_FILE_CUSTOM_VERB02                     = 41501;
  EVERYTHING_IPC_ID_FILE_CUSTOM_VERB03                     = 41502;
  EVERYTHING_IPC_ID_FILE_CUSTOM_VERB04                     = 41503;
  EVERYTHING_IPC_ID_FILE_CUSTOM_VERB05                     = 41504;
  EVERYTHING_IPC_ID_FILE_CUSTOM_VERB06                     = 41505;
  EVERYTHING_IPC_ID_FILE_CUSTOM_VERB07                     = 41506;
  EVERYTHING_IPC_ID_FILE_CUSTOM_VERB08                     = 41507;
  EVERYTHING_IPC_ID_FILE_CUSTOM_VERB09                     = 41508;
  EVERYTHING_IPC_ID_FILE_CUSTOM_VERB10                     = 41509;
  EVERYTHING_IPC_ID_FILE_CUSTOM_VERB11                     = 41510;
  EVERYTHING_IPC_ID_FILE_CUSTOM_VERB12                     = 41511;

  // search
  EVERYTHING_IPC_ID_SEARCH_EDIT_FOCUS                      = 42000;
  EVERYTHING_IPC_ID_SEARCH_EDIT_WORD_DELETE_TO_START       = 42019;
  EVERYTHING_IPC_ID_SEARCH_EDIT_AUTO_COMPLETE              = 42020;
  EVERYTHING_IPC_ID_SEARCH_EDIT_SHOW_SEARCH_HISTORY        = 42021;
  EVERYTHING_IPC_ID_SEARCH_EDIT_SHOW_ALL_SEARCH_HISTORY    = 42022;

  EVERYTHING_IPC_ID_TRAY_EDITOR                            = 41700;
  EVERYTHING_IPC_ID_TRAY_OPEN_FILELIST                     = 41701;

  EVERYTHING_IPC_ID_INDEX_UPDATE_ALL_FOLDERS_NOW           = 41800;
  EVERYTHING_IPC_ID_INDEX_FORCE_REBUILD                    = 41801;

  // find the everything IPC window
  EVERYTHING_IPC_WNDCLASSW: WideString                     = 'EVERYTHING_TASKBAR_NOTIFICATION';
  EVERYTHING_IPC_WNDCLASSA: AnsiString                     = 'EVERYTHING_TASKBAR_NOTIFICATION';

  EVERYTHING_IPC_WNDCLASS: {$IFDEF UNICODE}WideString{$ELSE}AnsiString{$ENDIF} = 'EVERYTHING_TASKBAR_NOTIFICATION';

  // an Everything search window
  EVERYTHING_IPC_SEARCH_CLIENT_WNDCLASSW: WideString       = 'EVERYTHING';
  EVERYTHING_IPC_SEARCH_CLIENT_WNDCLASSA: AnsiString       = 'EVERYTHING';

  EVERYTHING_IPC_SEARCH_CLIENT_WNDCLASS: {$IFDEF UNICODE}WideString{$ELSE}AnsiString{$ENDIF} = 'EVERYTHING';

  // this global window message is sent to all top level windows when everything starts.
  EVERYTHING_IPC_CREATEDW: WideString                      = 'EVERYTHING_IPC_CREATED';
  EVERYTHING_IPC_CREATEDA: AnsiString                      = 'EVERYTHING_IPC_CREATED';

  EVERYTHING_IPC_CREATED: {$IFDEF UNICODE}WideString{$ELSE}AnsiString{$ENDIF} = 'EVERYTHING_IPC_CREATED';

  // search flags for querys
  EVERYTHING_IPC_MATCHCASE                                 = $00000001; // match case
  EVERYTHING_IPC_MATCHWHOLEWORD                            = $00000002; // match whole word
  EVERYTHING_IPC_MATCHPATH                                 = $00000004; // include paths in search
  EVERYTHING_IPC_REGEX                                     = $00000008; // enable regex
  EVERYTHING_IPC_MATCHACCENTS                              = $00000010; // match diacritic marks
  EVERYTHING_IPC_MATCHDIACRITICS                           = $00000010; // match diacritic marks
  EVERYTHING_IPC_MATCHPREFIX                               = $00000020; // match prefix (Everything 1.5)
  EVERYTHING_IPC_MATCHSUFFIX                               = $00000040; // match suffix (Everything 1.5)
  EVERYTHING_IPC_IGNOREPUNCTUATION                         = $00000080; // ignore punctuation (Everything 1.5)
  EVERYTHING_IPC_IGNOREWHITESPACE                          = $00000100; // ignore white-space (Everything 1.5)

  // item flags
  EVERYTHING_IPC_FOLDER                                    = $00000001;  // The item is a folder. (it's a file if not set)
  EVERYTHING_IPC_DRIVE                                     = $00000002; // the file or folder is a drive/root.
  EVERYTHING_IPC_ROOT                                      = $00000002; // the file or folder is a root.

type
  EVERYTHING_IPC_COMMAND_LINE = packed record
    // MUST be one of the SW_* ShowWindow() commands
    show_command: DWORD;
    // null terminated variable sized command line text in UTF-8.
    command_line_text: array[0..0] of BYTE;
  end;

const
  // the WM_COPYDATA message for a query.
  EVERYTHING_IPC_COPYDATA_COMMAND_LINE_UTF8                = 0; // Send a EVERYTHING_IPC_COMMAND_LINE structure.

  EVERYTHING_IPC_COPYDATAQUERYA                            = 1;
  EVERYTHING_IPC_COPYDATAQUERYW                            = 2;

  EVERYTHING_IPC_COPYDATAQUERY = {$IFDEF UNICODE}EVERYTHING_IPC_COPYDATAQUERYW{$ELSE}EVERYTHING_IPC_COPYDATAQUERYA{$ENDIF};

  // all results
  EVERYTHING_IPC_ALLRESULTS                                = DWORD($FFFFFFFF); // all results

  // macro to get the filename of an item
  function EVERYTHING_IPC_ITEMFILENAMEA(list, item: Pointer): PAnsiChar;
  function EVERYTHING_IPC_ITEMFILENAMEW(list, item: Pointer): PWideChar;

  // macro to get the path of an item
  function EVERYTHING_IPC_ITEMPATHA(list, item: Pointer): PAnsiChar;
  function EVERYTHING_IPC_ITEMPATHW(list, item: Pointer): PWideChar;

type
  // #pragma pack (push,1)
  //
  // Varible sized query struct sent to everything.
  //
  // sent in the form of a WM_COPYDATA message with EVERYTHING_IPC_COPYDATAQUERY as the
  // dwData member in the COPYDATASTRUCT struct.
  // set the lpData member of the COPYDATASTRUCT struct to point to your EVERYTHING_IPC_QUERY struct.
  // set the cbData member of the COPYDATASTRUCT struct to the size of the
  // EVERYTHING_IPC_QUERY struct minus the size of a TCHAR plus the length of the search string in bytes plus
  // one TCHAR for the null terminator.
  //
  // NOTE: to determine the size of this structure use
  // ASCII: sizeof(EVERYTHING_IPC_QUERYA) - sizeof(CHAR) + strlen(search_string)*sizeof(CHAR) + sizeof(CHAR)
  // UNICODE: sizeof(EVERYTHING_IPC_QUERYW) - sizeof(WCHAR) + wcslen(search_string)*sizeof(WCHAR) + sizeof(WCHAR)
  //
  // NOTE: Everything will only do one query per window.
  // Sending another query when a query has not completed
  // will cancel the old query and start the new one.
  //
  // Everything will send the results to the reply_hwnd in the form of a
  // WM_COPYDATA message with the dwData value you specify.
  //
  // Everything will return TRUE if successful.
  // returns FALSE if not supported.
  //
  // If you query with EVERYTHING_IPC_COPYDATAQUERYW, the results sent from Everything will be Unicode.
  //
  EVERYTHING_IPC_QUERYW = packed record
    // the window that will receive the new results.
    // only 32bits are required to store a window handle. (even on x64)
    reply_hwnd: DWORD;
    // the value to set the dwData member in the COPYDATASTRUCT struct
    // sent by Everything when the query is complete.
    reply_copydata_message: DWORD;
    // search flags (see EVERYTHING_IPC_MATCHCASE | EVERYTHING_IPC_MATCHWHOLEWORD | EVERYTHING_IPC_MATCHPATH)
    search_flags: DWORD;
    // only return results after 'offset' results (0 to return from the first result)
    // useful for scrollable lists
    offset: DWORD;
    // the number of results to return
    // zero to return no results
    // EVERYTHING_IPC_ALLRESULTS to return ALL results
    max_results: DWORD;
    // null terminated string. variable lengthed search string buffer.
    search_string: array[0..0] of WCHAR;
  end;
  PEVERYTHING_IPC_QUERYW = ^EVERYTHING_IPC_QUERYW;

  EVERYTHING_IPC_QUERYA = packed record
    // the window that will receive the new results.
    // only 32bits are required to store a window handle. (even on x64)
    reply_hwnd: DWORD;
    // the value to set the dwData member in the COPYDATASTRUCT struct
    // sent by Everything when the query is complete.
    reply_copydata_message: DWORD;
    // search flags (see EVERYTHING_IPC_MATCHCASE | EVERYTHING_IPC_MATCHWHOLEWORD | EVERYTHING_IPC_MATCHPATH)
    search_flags: DWORD;
    // only return results after 'offset' results (0 to return from the first result)
    // useful for scrollable lists
    offset: DWORD;
    // the number of results to return
    // zero to return no results
    // EVERYTHING_IPC_ALLRESULTS to return ALL results
    max_results: DWORD;
    // null terminated string. variable lengthed search string buffer.
    search_string: array[0..0] of CHAR;
  end;
  PEVERYTHING_IPC_QUERYA = ^EVERYTHING_IPC_QUERYA;

  //
  // Varible sized result list struct received from Everything.
  //
  // Sent in the form of a WM_COPYDATA message to the hwnd specifed in the
  // EVERYTHING_IPC_QUERY struct.
  // the dwData member of the COPYDATASTRUCT struct will match the sent
  // reply_copydata_message member in the EVERYTHING_IPC_QUERY struct.
  //
  // make a copy of the data before returning.
  //
  // return TRUE if you processed the WM_COPYDATA message.
  //

  EVERYTHING_IPC_ITEMW = packed record
    // item flags
    flags: DWORD;
    // The offset of the filename from the beginning of the list structure.
    // (wchar_t *)((char *)everything_list + everythinglist->name_offset)
    filename_offset: DWORD;
    // The offset of the filename from the beginning of the list structure.
    // (wchar_t *)((char *)everything_list + everythinglist->path_offset)
    path_offset: DWORD;
  end;
  PEVERYTHING_IPC_ITEMW = ^EVERYTHING_IPC_ITEMW;

  EVERYTHING_IPC_ITEMA = packed record
    // item flags
    flags: DWORD;
    // The offset of the filename from the beginning of the list structure.
    // (char *)((char *)everything_list + everythinglist->name_offset)
    filename_offset: DWORD;
    // The offset of the filename from the beginning of the list structure.
    // (char *)((char *)everything_list + everythinglist->path_offset)
    path_offset: DWORD;
  end;
  PEVERYTHING_IPC_ITEMA = ^EVERYTHING_IPC_ITEMA;

  EVERYTHING_IPC_LISTW = packed record
    // the total number of folders found.
    totfolders: DWORD;
    // the total number of files found.
    totfiles: DWORD;
    // totfolders + totfiles
    totitems: DWORD;
    // the number of folders available.
    numfolders: DWORD;
    // the number of files available.
    numfiles: DWORD;
    // the number of items available.
    numitems: DWORD;
    // index offset of the first result in the item list.
    offset: DWORD;
    // variable length item list.
    // use numitems to determine the actual number of items available.
    items: array[0..0] of EVERYTHING_IPC_ITEMW;
  end;
  PEVERYTHING_IPC_LISTW = ^EVERYTHING_IPC_LISTW;

  EVERYTHING_IPC_LISTA = packed record
    // the total number of folders found.
    totfolders: DWORD;
    // the total number of files found.
    totfiles: DWORD;
    // totfolders + totfiles
    totitems: DWORD;
    // the number of folders available.
    numfolders: DWORD;
    // the number of files available.
    numfiles: DWORD;
    // the number of items available.
    numitems: DWORD;
    // index offset of the first result in the item list.
    offset: DWORD;
    // variable length item list.
    // use numitems to determine the actual number of items available.
    items: array[0..0] of EVERYTHING_IPC_ITEMA;
  end;
  PEVERYTHING_IPC_LISTA = ^EVERYTHING_IPC_LISTA;

  // #pragma pack (pop)

type
  EVERYTHING_IPC_QUERY = {$IFDEF UNICODE}EVERYTHING_IPC_QUERYW{$ELSE}EVERYTHING_IPC_QUERYA{$ENDIF};
  EVERYTHING_IPC_ITEM = {$IFDEF UNICODE}EVERYTHING_IPC_ITEMW{$ELSE}EVERYTHING_IPC_ITEMA{$ENDIF};
  EVERYTHING_IPC_LIST = {$IFDEF UNICODE}EVERYTHING_IPC_LISTW{$ELSE}EVERYTHING_IPC_LISTA{$ENDIF};

type
  // Ansi+Unicode version types
  TEVERYTHING_IPC_ITEMFILENAME = function (list, item: Pointer): PChar;
  TEVERYTHING_IPC_ITEMPATH = function (list, item: Pointer): PChar;

const
  // Ansi+Unicode version function
  EVERYTHING_IPC_ITEMFILENAME: TEVERYTHING_IPC_ITEMFILENAME = {$IFDEF UNICODE}EVERYTHING_IPC_ITEMFILENAMEW{$ELSE}EVERYTHING_IPC_ITEMFILENAMEA{$ENDIF};
  EVERYTHING_IPC_ITEMPATH: TEVERYTHING_IPC_ITEMPATH = {$IFDEF UNICODE}EVERYTHING_IPC_ITEMPATHW{$ELSE}EVERYTHING_IPC_ITEMPATHA{$ENDIF};

const
  // the WM_COPYDATA message for a query.
  // requires Everything 1.4.1
  EVERYTHING_IPC_COPYDATA_QUERY2A                          = 17;
  EVERYTHING_IPC_COPYDATA_QUERY2W                          = 18;

  EVERYTHING_IPC_SORT_NAME_ASCENDING                       = 1;
  EVERYTHING_IPC_SORT_NAME_DESCENDING                      = 2;
  EVERYTHING_IPC_SORT_PATH_ASCENDING                       = 3;
  EVERYTHING_IPC_SORT_PATH_DESCENDING                      = 4;
  EVERYTHING_IPC_SORT_SIZE_ASCENDING                       = 5;
  EVERYTHING_IPC_SORT_SIZE_DESCENDING                      = 6;
  EVERYTHING_IPC_SORT_EXTENSION_ASCENDING                  = 7;
  EVERYTHING_IPC_SORT_EXTENSION_DESCENDING                 = 8;
  EVERYTHING_IPC_SORT_TYPE_NAME_ASCENDING                  = 9;
  EVERYTHING_IPC_SORT_TYPE_NAME_DESCENDING                 = 10;
  EVERYTHING_IPC_SORT_DATE_CREATED_ASCENDING               = 11;
  EVERYTHING_IPC_SORT_DATE_CREATED_DESCENDING              = 12;
  EVERYTHING_IPC_SORT_DATE_MODIFIED_ASCENDING              = 13;
  EVERYTHING_IPC_SORT_DATE_MODIFIED_DESCENDING             = 14;
  EVERYTHING_IPC_SORT_ATTRIBUTES_ASCENDING                 = 15;
  EVERYTHING_IPC_SORT_ATTRIBUTES_DESCENDING                = 16;
  EVERYTHING_IPC_SORT_FILE_LIST_FILENAME_ASCENDING         = 17;
  EVERYTHING_IPC_SORT_FILE_LIST_FILENAME_DESCENDING        = 18;
  EVERYTHING_IPC_SORT_RUN_COUNT_ASCENDING                  = 19;
  EVERYTHING_IPC_SORT_RUN_COUNT_DESCENDING                 = 20;
  EVERYTHING_IPC_SORT_DATE_RECENTLY_CHANGED_ASCENDING      = 21;
  EVERYTHING_IPC_SORT_DATE_RECENTLY_CHANGED_DESCENDING     = 22;
  EVERYTHING_IPC_SORT_DATE_ACCESSED_ASCENDING              = 23;
  EVERYTHING_IPC_SORT_DATE_ACCESSED_DESCENDING             = 24;
  EVERYTHING_IPC_SORT_DATE_RUN_ASCENDING                   = 25;
  EVERYTHING_IPC_SORT_DATE_RUN_DESCENDING                  = 26;

  EVERYTHING_IPC_QUERY2_REQUEST_NAME                       = $00000001;
  EVERYTHING_IPC_QUERY2_REQUEST_PATH                       = $00000002;
  EVERYTHING_IPC_QUERY2_REQUEST_FULL_PATH_AND_NAME         = $00000004;
  EVERYTHING_IPC_QUERY2_REQUEST_EXTENSION                  = $00000008;
  EVERYTHING_IPC_QUERY2_REQUEST_SIZE                       = $00000010;
  EVERYTHING_IPC_QUERY2_REQUEST_DATE_CREATED               = $00000020;
  EVERYTHING_IPC_QUERY2_REQUEST_DATE_MODIFIED              = $00000040;
  EVERYTHING_IPC_QUERY2_REQUEST_DATE_ACCESSED              = $00000080;
  EVERYTHING_IPC_QUERY2_REQUEST_ATTRIBUTES                 = $00000100;
  EVERYTHING_IPC_QUERY2_REQUEST_FILE_LIST_FILE_NAME        = $00000200;
  EVERYTHING_IPC_QUERY2_REQUEST_RUN_COUNT                  = $00000400;
  EVERYTHING_IPC_QUERY2_REQUEST_DATE_RUN                   = $00000800;
  EVERYTHING_IPC_QUERY2_REQUEST_DATE_RECENTLY_CHANGED      = $00001000;
  EVERYTHING_IPC_QUERY2_REQUEST_HIGHLIGHTED_NAME           = $00002000;
  EVERYTHING_IPC_QUERY2_REQUEST_HIGHLIGHTED_PATH           = $00004000;
  EVERYTHING_IPC_QUERY2_REQUEST_HIGHLIGHTED_FULL_PATH_AND_NAME = $00008000;

  EVERYTHING_IPC_FILE_INFO_FILE_SIZE                       = 1;
  EVERYTHING_IPC_FILE_INFO_FOLDER_SIZE                     = 2;
  EVERYTHING_IPC_FILE_INFO_DATE_CREATED                    = 3;
  EVERYTHING_IPC_FILE_INFO_DATE_MODIFIED                   = 4;
  EVERYTHING_IPC_FILE_INFO_DATE_ACCESSED                   = 5;
  EVERYTHING_IPC_FILE_INFO_ATTRIBUTES                      = 6;

type
  // #pragma pack (push,1)
  
  //
  // Varible sized query struct sent to everything.
  //
  // sent in the form of a WM_COPYDATA message with EVERYTHING_IPC_COPYDATA_QUERY2 as the
  // dwData member in the COPYDATASTRUCT struct.
  // set the lpData member of the COPYDATASTRUCT struct to point to your EVERYTHING_IPC_QUERY struct.
  // set the cbData member of the COPYDATASTRUCT struct to the size of the
  // EVERYTHING_IPC_QUERY struct minus the size of a TCHAR plus the length of the search string in bytes plus
  // one TCHAR for the null terminator.
  //
  // NOTE: Everything will only do one query per window.
  // Sending another query when a query has not completed
  // will cancel the old query and start the new one.
  //
  // Everything will send the results to the reply_hwnd in the form of a
  // WM_COPYDATA message with the dwData value you specify.
  //
  // Everything will return TRUE if successful.
  // returns FALSE if not supported.
  //
  // If you query with EVERYTHING_IPC_COPYDATA_QUERYW, the results sent from Everything will be Unicode.
  //

  // ASCII version
  EVERYTHING_IPC_QUERY2 = packed record
    // the window that will receive the new results.
    // only 32bits are required to store a window handle. (even on x64)
    reply_hwnd: DWORD;
    // the value to set the dwData member in the COPYDATASTRUCT struct
    // sent by Everything when the query is complete.
    reply_copydata_message: DWORD;
    // search flags (see EVERYTHING_IPC_MATCHCASE | EVERYTHING_IPC_MATCHWHOLEWORD | EVERYTHING_IPC_MATCHPATH)
    search_flags: DWORD;
    // only return results after 'offset' results (0 to return from the first result)
    // useful for scrollable lists
    offset: DWORD;
    // the number of results to return
    // zero to return no results
    // EVERYTHING_IPC_ALLRESULTS to return ALL results
    max_results: DWORD;
    // request types.
    // one or more of EVERYTHING_IPC_QUERY2_REQUEST_* types.
    request_flags: DWORD;
    // sort type, set to one of EVERYTHING_IPC_SORT_* types.
    // set to EVERYTHING_IPC_SORT_NAME_ASCENDING for the best performance (there will never be a performance hit when sorting by name ascending).
    // Other sorts will also be instant if the corresponding fast sort is enabled from Tools -> Options -> Indexes.
    sort_type: DWORD;
    // followed by null terminated search.
    // TCHAR search_string[1];
  end;
  PEVERYTHING_IPC_QUERY2 = ^EVERYTHING_IPC_QUERY2;

  EVERYTHING_IPC_ITEM2 = packed record
    // item flags one of (EVERYTHING_IPC_FOLDER|EVERYTHING_IPC_DRIVE|EVERYTHING_IPC_ROOT)
    flags: DWORD;
    // offset from the start of the EVERYTHING_IPC_LIST2 struct to the data content
    data_offset: DWORD;
    // data found at data_offset
    // if EVERYTHING_IPC_QUERY2_REQUEST_NAME was set in request_flags, DWORD name_length in characters (excluding the null terminator); followed by null terminated text.
    // if EVERYTHING_IPC_QUERY2_REQUEST_PATH was set in request_flags, DWORD name_length in characters (excluding the null terminator); followed by null terminated text.
    // if EVERYTHING_IPC_QUERY2_REQUEST_FULL_PATH_AND_NAME was set in request_flags, DWORD name_length (excluding the null terminator); followed by null terminated text.
    // if EVERYTHING_IPC_QUERY2_REQUEST_SIZE was set in request_flags, LARGE_INTEGER size;
    // if EVERYTHING_IPC_QUERY2_REQUEST_EXTENSION was set in request_flags, DWORD name_length in characters (excluding the null terminator); followed by null terminated text;
    // if EVERYTHING_IPC_QUERY2_REQUEST_TYPE_NAME was set in request_flags, DWORD name_length in characters (excluding the null terminator); followed by null terminated text;
    // if EVERYTHING_IPC_QUERY2_REQUEST_DATE_CREATED was set in request_flags, FILETIME date;
    // if EVERYTHING_IPC_QUERY2_REQUEST_DATE_MODIFIED was set in request_flags, FILETIME date;
    // if EVERYTHING_IPC_QUERY2_REQUEST_DATE_ACCESSED was set in request_flags, FILETIME date;
    // if EVERYTHING_IPC_QUERY2_REQUEST_ATTRIBUTES was set in request_flags, DWORD attributes;
    // if EVERYTHING_IPC_QUERY2_REQUEST_FILELIST_FILENAME was set in request_flags, DWORD name_length in characters (excluding the null terminator); followed by null terminated text;
    // if EVERYTHING_IPC_QUERY2_REQUEST_RUN_COUNT was set in request_flags, DWORD run_count;
    // if EVERYTHING_IPC_QUERY2_REQUEST_DATE_RUN was set in request_flags, FILETIME date;
    // if EVERYTHING_IPC_QUERY2_REQUEST_DATE_RECENTLY_CHANGED was set in request_flags, FILETIME date;
    // if EVERYTHING_IPC_QUERY2_REQUEST_HIGHLIGHTED_NAME was set in request_flags, DWORD name_length in characters (excluding the null terminator); followed by null terminated text; ** = *, *text* = highlighted text
    // if EVERYTHING_IPC_QUERY2_REQUEST_HIGHLIGHTED_PATH was set in request_flags, DWORD name_length in characters (excluding the null terminator); followed by null terminated text; ** = *, *text* = highlighted text
    // if EVERYTHING_IPC_QUERY2_REQUEST_HIGHLIGHTED_FULL_PATH_AND_NAME was set in request_flags, DWORD name_length in characters (excluding the null terminator); followed by null terminated text; ** = *, *text* = highlighted text
  end;
  PEVERYTHING_IPC_ITEM2 = ^EVERYTHING_IPC_ITEM2;

  EVERYTHING_IPC_LIST2 = packed record
    // number of items found.
    totitems: DWORD;
    // the number of items available.
    numitems: DWORD;
    // index offset of the first result in the item list.
    offset: DWORD;
    // valid request types.
    request_flags: DWORD;
    // this sort type.
    // one of EVERYTHING_IPC_SORT_* types.
    // maybe different to requested sort type.
    sort_type: DWORD;
    // items follow.
    // EVERYTHING_IPC_ITEM2 items[numitems]
    // item data follows.
  end;
  PEVERYTHING_IPC_LIST2 = ^EVERYTHING_IPC_LIST2;

  // #pragma pack (pop)

  // Get the Run Count for a file, by filename.
  // COPYDATASTRUCT cds;
  // cds.dwData = EVERYTHING_IPC_COPYDATA_GET_RUN_COUNTA;
  // cds.lpData = TEXT("C:\\folder\\file.txt");
  // cds.cbData = size in bytes of cds.lpData including null terminator.
  // SendMessage(everything_taskbar_notification_hwnd,WM_COPYDATA,(WPARAM)(HWND)notify_hwnd,(LPARAM)(COPYDATASTRUCT *)&cds);

const
  EVERYTHING_IPC_COPYDATA_GET_RUN_COUNTA                   = 19;
  EVERYTHING_IPC_COPYDATA_GET_RUN_COUNTW                   = 20;

type
  // #pragma pack (push,1)
  
  EVERYTHING_IPC_RUN_HISTORY = packed record
    run_count: DWORD;
    // null terminated ansi/wchar filename follows.
    // TCHAR filename[];
  end;
  PEVERYTHING_IPC_RUN_HISTORY = ^EVERYTHING_IPC_RUN_HISTORY;

  // #pragma pack (pop)

const
  // Set the Run Count by one for a file, by filename.
  // COPYDATASTRUCT cds;
  // cds.dwData = EVERYTHING_IPC_COPYDATA_GET_RUN_COUNTA;
  // cds.lpData = (EVERYTHING_IPC_RUN_HISTORY *)run_history;
  // cds.cbData = size in bytes of cds.lpData including null terminator.
  // SendMessage(everything_taskbar_notification_hwnd,WM_COPYDATA,(WPARAM)(HWND)notify_hwnd,(LPARAM)(COPYDATASTRUCT *)&cds);
  EVERYTHING_IPC_COPYDATA_SET_RUN_COUNTA                   = 21;
  EVERYTHING_IPC_COPYDATA_SET_RUN_COUNTW                   = 22;

  // Increment the Run Count by one for a file, by filename.
  // COPYDATASTRUCT cds;
  // cds.dwData = EVERYTHING_IPC_COPYDATA_GET_RUN_COUNTA;
  // cds.lpData = TEXT("C:\\folder\\file.txt");
  // cds.cbData = size in bytes of cds.lpData including null terminator.
  // SendMessage(everything_taskbar_notification_hwnd,WM_COPYDATA,(WPARAM)(HWND)notify_hwnd,(LPARAM)(COPYDATASTRUCT *)&cds);
  EVERYTHING_IPC_COPYDATA_INC_RUN_COUNTA                   = 23;
  EVERYTHING_IPC_COPYDATA_INC_RUN_COUNTW                   = 24;

{$IFDEF UNICODE}
  EVERYTHING_IPC_COPYDATA_QUERY2                           = EVERYTHING_IPC_COPYDATA_QUERY2W;
{$ELSE}
  EVERYTHING_IPC_COPYDATA_QUERY2                           = EVERYTHING_IPC_COPYDATA_QUERY2A;
{$ENDIF}

implementation

// macro to get the filename of an item
function EVERYTHING_IPC_ITEMFILENAMEA(list, item: Pointer): PAnsiChar;
begin
  Result := PAnsiChar(PAnsiChar(list) + PEVERYTHING_IPC_ITEMA(item)^.filename_offset);
end;

function EVERYTHING_IPC_ITEMFILENAMEW(list, item: Pointer): PWideChar;
begin
  Result := PWideChar(PAnsiChar(list) + PEVERYTHING_IPC_ITEMW(item)^.filename_offset);
end;

// macro to get the path of an item
function EVERYTHING_IPC_ITEMPATHA(list, item: Pointer): PAnsiChar;
begin
  Result := PAnsiChar(PAnsiChar(list) + PEVERYTHING_IPC_ITEMA(item)^.path_offset);
end;

function EVERYTHING_IPC_ITEMPATHW(list, item: Pointer): PWideChar;
begin
  Result := PWideChar(PAnsiChar(list) + PEVERYTHING_IPC_ITEMW(item)^.path_offset);
end;

end.
