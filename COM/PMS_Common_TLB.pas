unit PMS_COMMON_TLB;

// ************************************************************************ //
// AVERTISSEMENT
// -------
// Les types déclarés dans ce fichier ont été générés à partir de données lues
// depuis la bibliothèque de types. Si cette dernière (via une autre bibliothèque de types
// s'y référant) est explicitement ou indirectement ré-importée, ou la commande "Actualiser"
// de l'éditeur de bibliothèque de types est activée lors de la modification de la bibliothèque
// de types, le contenu de ce fichier sera régénéré et toutes les modifications
// manuellement apportées seront perdues.
// ************************************************************************ //

// $Rev: 52393 $
// Fichier généré le 25/11/2020 19:23:56 depuis la bibliothèque de types ci-dessous.

// ************************************************************************  //
// Biblio. types : C:\Users\philippe\Documents\Dev\COMMON\Release\PMS.COMMON.tlb (1)
// LIBID : {8293F43E-FD5D-4FB7-A22F-E5968515947F}
// LCID : 0
// Fichier d'aide : 
// Chaîne d'aide : PMS.COMMON
// DepndLst : 
//   (1) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
//   (2) v2.4 mscorlib, (C:\Windows\Microsoft.NET\Framework\v4.0.30319\mscorlib.tlb)
// Bibliothèque de types parent :
//   (0) v1.0 PMS_NEXOSALE, (C:\Users\philippe\Documents\Dev\NEXOSale\Release\PMS.NEXOSALE.tlb)
// SYS_KIND: SYS_WIN32
// ************************************************************************ //
{$TYPEDADDRESS OFF} // L'unité doit être compilée sans pointeur à type contrôlé.  
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
{$ALIGN 4}

interface

uses Winapi.Windows, mscorlib_TLB, System.Classes, System.Variants, System.Win.StdVCL, Vcl.Graphics, Vcl.OleServer, Winapi.ActiveX;
  

// *********************************************************************//
// GUIDS déclarés dans la bibliothèque de types. Préfixes utilisés:        
//   Bibliothèques de types : LIBID_xxxx                                      
//   CoClasses              : CLASS_xxxx                                      
//   Interfaces DISP        : DIID_xxxx                                       
//   Interfaces Non-DISP    : IID_xxxx                                        
// *********************************************************************//
const
  // Versions mineure et majeure de la bibliothèque de types
  PMS_COMMONMajorVersion = 3;
  PMS_COMMONMinorVersion = 0;

  LIBID_PMS_COMMON: TGUID = '{8293F43E-FD5D-4FB7-A22F-E5968515947F}';

  IID_IStreamClientSettings: TGUID = '{BE7495F7-DA7A-4584-AEB9-789AF316C971}';
  CLASS_CStreamClientSettings: TGUID = '{990A2D0C-1A1C-4E34-9C9D-75905AC95915}';
  IID_IStreamServerSettings: TGUID = '{F4BC72B2-4375-4723-B59D-809182C8CFDE}';
  CLASS_CStreamServerSettings: TGUID = '{EF1D0636-72B9-4F21-98A2-6F0EE3B048B5}';
  IID_IStreamClientThreadSettings: TGUID = '{966E7BDC-A560-4988-8AF7-717FF1341E4D}';
  CLASS_CStreamClientThreadSettings: TGUID = '{1BB1B102-74BC-4795-98A1-14DD94D851B6}';
  IID_IStreamServerThreadSettings: TGUID = '{FC4ED317-6B75-474A-B51F-4AD71734881F}';
  CLASS_CStreamServerThreadSettings: TGUID = '{56BF8966-E7FF-4B42-A255-A89EF0226FD1}';
  IID_IThread: TGUID = '{420E0E6B-C6D4-499A-87A7-992FECBFEFC3}';
  CLASS_CThread: TGUID = '{87BB223F-6A59-4592-8A0F-057625532B8C}';
  IID_IThreadData: TGUID = '{CD4AB05D-ED37-493A-B658-C4D5D86B6864}';
  CLASS_CThreadData: TGUID = '{A6DA1EAA-A706-4D89-A790-B34710EB2818}';
  IID__FeedRecordDelegate: TGUID = '{D7F0F2A0-F646-30CD-99A9-E61692F3D3A0}';
  IID__SendAsyncType: TGUID = '{DCFE0E70-4BCF-3612-B3E9-C9B7EAF687E9}';
  IID__ServerOnStartDelegate: TGUID = '{A08079B2-47AC-36E9-8A8E-7273B55BD5D2}';
  IID__ServerOnConnectDelegate: TGUID = '{472D1DE4-CCB1-3FC5-BCE0-F6003FF187F8}';
  IID__ServerOnMessageDelegate: TGUID = '{BFA46CC8-A3DA-38CC-9BD9-7FCB40394348}';
  IID__ServerOnDisconnectDelegate: TGUID = '{4B81353D-4733-3D6B-9C90-835D1DFB0B66}';
  IID__ServerOnStopDelegate: TGUID = '{B6BAA48E-2E1B-38AB-AA93-CCD29074370E}';
  IID__ClientOnReceivedMessageDelegate: TGUID = '{684612E3-7F2F-34AA-AD46-78FBB4E99A84}';
  IID__ClientOnSendMessageDelegate: TGUID = '{37485B63-0D28-3643-B8B0-3E023FD9D4F9}';
  IID__ClientOnReplyDelegate: TGUID = '{630876F9-312A-3345-817E-E41461F337A8}';
  IID__CThreadFunction: TGUID = '{9FF3E249-7C77-3D69-B639-2ED302F3EA0E}';
  IID__TimerCompleteDelegate: TGUID = '{958992F3-D314-31B9-8EE1-98F6430FE074}';
  CLASS_FeedRecordDelegate: TGUID = '{44231134-B00E-35B9-BE63-910427A8300B}';
  CLASS_SendAsyncType: TGUID = '{3D1999D4-354F-3FF9-AC99-05BD0BB4975B}';
  CLASS_ServerOnStartDelegate: TGUID = '{44A1D20E-2BA6-3A0B-B708-1DA85D36CD8F}';
  CLASS_ServerOnConnectDelegate: TGUID = '{D44EBB95-7AB9-3750-9450-B3D54C853D5D}';
  CLASS_ServerOnMessageDelegate: TGUID = '{E672CBB2-DF8F-3B60-BCF9-F6DBB6F87FF3}';
  CLASS_ServerOnDisconnectDelegate: TGUID = '{AFA50764-135C-3E67-A2B5-649AB52DF9D3}';
  CLASS_ServerOnStopDelegate: TGUID = '{C3B1B249-7757-3832-9BED-215BD01A1A4D}';
  CLASS_ClientOnReceivedMessageDelegate: TGUID = '{4608FB20-B6E8-39A4-827C-1933CB73D9BE}';
  CLASS_ClientOnSendMessageDelegate: TGUID = '{177C072C-FF61-30C8-8346-1E680EEF9637}';
  CLASS_ClientOnReplyDelegate: TGUID = '{3086C995-4775-3D7B-B207-92C6909718E7}';
  CLASS_CThreadFunction: TGUID = '{560D8AF1-2724-3C41-A78A-5D6F47807F84}';
  CLASS_TimerCompleteDelegate: TGUID = '{BF9ECD3F-BD26-3111-B933-FC4A22D9F653}';

// *********************************************************************//
// Déclaration d'énumérations définies dans la bibliothèque de types                    
// *********************************************************************//
// Constantes pour enum TLog
type
  TLog = TOleEnum;
const
  TLog_INFOR = $00000000;
  TLog_WARNG = $00000001;
  TLog_ERROR = $00000002;
  TLog_EXCPT = $00000003;

// Constantes pour enum SendAsyncEnum
type
  SendAsyncEnum = TOleEnum;
const
  SendAsyncEnum_OK = $00000000;
  SendAsyncEnum_KO = $00000001;
  SendAsyncEnum_NoData = $00000002;
  SendAsyncEnum_Timeout = $00000003;
  SendAsyncEnum_SendError = $00000004;
  SendAsyncEnum_ReceiveError = $00000005;

// Constantes pour enum ThreadResult
type
  ThreadResult = TOleEnum;
const
  ThreadResult__begin = $FFFFFFFF;
  ThreadResult_UNKNOWN = $00000000;
  ThreadResult_OK = $00000001;
  ThreadResult_KO = $00000002;
  ThreadResult_Exception = $00000003;
  ThreadResult__end = $00000004;

// Constantes pour enum VersionType
type
  VersionType = TOleEnum;
const
  VersionType_assembly = $00000000;
  VersionType_assemblyFile = $00000001;
  VersionType_assemblyInfo = $00000002;

// Constantes pour enum SWL
type
  SWL = TOleEnum;
const
  SWL_GWL_EXSTYLE = $FFFFFFEC;
  SWL_GWLP_HINSTANCE = $FFFFFFFA;
  SWL_GWLP_HWNDPARENT = $FFFFFFF8;
  SWL_GWL_ID = $FFFFFFF4;
  SWL_GWL_STYLE = $FFFFFFF0;
  SWL_GWL_USERDATA = $FFFFFFEB;
  SWL_GWL_WNDPROC = $FFFFFFFC;
  SWL_DWLP_USER = $00000008;
  SWL_DWLP_MSGRESULT = $00000000;
  SWL_DWLP_DLGPROC = $00000004;

type

// *********************************************************************//
// Déclaration Forward des types définis dans la bibliothèque de types                     
// *********************************************************************//
  IStreamClientSettings = interface;
  IStreamClientSettingsDisp = dispinterface;
  IStreamServerSettings = interface;
  IStreamServerSettingsDisp = dispinterface;
  IStreamClientThreadSettings = interface;
  IStreamClientThreadSettingsDisp = dispinterface;
  IStreamServerThreadSettings = interface;
  IStreamServerThreadSettingsDisp = dispinterface;
  IThread = interface;
  IThreadDisp = dispinterface;
  IThreadData = interface;
  IThreadDataDisp = dispinterface;
  _FeedRecordDelegate = interface;
  _FeedRecordDelegateDisp = dispinterface;
  _SendAsyncType = interface;
  _SendAsyncTypeDisp = dispinterface;
  _ServerOnStartDelegate = interface;
  _ServerOnStartDelegateDisp = dispinterface;
  _ServerOnConnectDelegate = interface;
  _ServerOnConnectDelegateDisp = dispinterface;
  _ServerOnMessageDelegate = interface;
  _ServerOnMessageDelegateDisp = dispinterface;
  _ServerOnDisconnectDelegate = interface;
  _ServerOnDisconnectDelegateDisp = dispinterface;
  _ServerOnStopDelegate = interface;
  _ServerOnStopDelegateDisp = dispinterface;
  _ClientOnReceivedMessageDelegate = interface;
  _ClientOnReceivedMessageDelegateDisp = dispinterface;
  _ClientOnSendMessageDelegate = interface;
  _ClientOnSendMessageDelegateDisp = dispinterface;
  _ClientOnReplyDelegate = interface;
  _ClientOnReplyDelegateDisp = dispinterface;
  _CThreadFunction = interface;
  _CThreadFunctionDisp = dispinterface;
  _TimerCompleteDelegate = interface;
  _TimerCompleteDelegateDisp = dispinterface;

// *********************************************************************//
// Déclaration de CoClasses définies dans la bibliothèque de types        
// (REMARQUE: On affecte chaque CoClasse à son Interface par défaut)      
// *********************************************************************//
  CStreamClientSettings = IStreamClientSettings;
  CStreamServerSettings = IStreamServerSettings;
  CStreamClientThreadSettings = IStreamClientThreadSettings;
  CStreamServerThreadSettings = IStreamServerThreadSettings;
  CThread = IThread;
  CThreadData = IThreadData;
  FeedRecordDelegate = _FeedRecordDelegate;
  SendAsyncType = _SendAsyncType;
  ServerOnStartDelegate = _ServerOnStartDelegate;
  ServerOnConnectDelegate = _ServerOnConnectDelegate;
  ServerOnMessageDelegate = _ServerOnMessageDelegate;
  ServerOnDisconnectDelegate = _ServerOnDisconnectDelegate;
  ServerOnStopDelegate = _ServerOnStopDelegate;
  ClientOnReceivedMessageDelegate = _ClientOnReceivedMessageDelegate;
  ClientOnSendMessageDelegate = _ClientOnSendMessageDelegate;
  ClientOnReplyDelegate = _ClientOnReplyDelegate;
  CThreadFunction = _CThreadFunction;
  TimerCompleteDelegate = _TimerCompleteDelegate;


// *********************************************************************//
// Interface :   IStreamClientSettings
// Indicateurs : (4416) Dual OleAutomation Dispatchable
// GUID :        {BE7495F7-DA7A-4584-AEB9-789AF316C971}
// *********************************************************************//
  IStreamClientSettings = interface(IDispatch)
    ['{BE7495F7-DA7A-4584-AEB9-789AF316C971}']
    function Get_IP: WideString; safecall;
    procedure Set_IP(const pRetVal: WideString); safecall;
    function Get_Port: LongWord; safecall;
    procedure Set_Port(pRetVal: LongWord); safecall;
    function Get_FoundOnDNS: WordBool; safecall;
    function Get_IsValid: WordBool; safecall;
    function Get_ServerName: WideString; safecall;
    procedure Set_ServerName(const pRetVal: WideString); safecall;
    function Get_CheckCertificate: WordBool; safecall;
    procedure Set_CheckCertificate(pRetVal: WordBool); safecall;
    function Get_FullIP: WideString; safecall;
    function Get_ToString: WideString; safecall;
    function Get_NoTimeout: Integer; safecall;
    function Get_ReceiveTimeout: Integer; safecall;
    procedure Set_ReceiveTimeout(pRetVal: Integer); safecall;
    function Get_SendTimeout: Integer; safecall;
    procedure Set_SendTimeout(pRetVal: Integer); safecall;
    function Get_ReceiveBufferSize: Integer; safecall;
    procedure Set_ReceiveBufferSize(pRetVal: Integer); safecall;
    function Get_SendBufferSize: Integer; safecall;
    procedure Set_SendBufferSize(pRetVal: Integer); safecall;
    function Get_UseSsl: WordBool; safecall;
    function Get_Localhost: WideString; safecall;
    function Get_DefaultServerPort: LongWord; safecall;
    property IP: WideString read Get_IP write Set_IP;
    property Port: LongWord read Get_Port write Set_Port;
    property FoundOnDNS: WordBool read Get_FoundOnDNS;
    property IsValid: WordBool read Get_IsValid;
    property ServerName: WideString read Get_ServerName write Set_ServerName;
    property CheckCertificate: WordBool read Get_CheckCertificate write Set_CheckCertificate;
    property FullIP: WideString read Get_FullIP;
    property ToString: WideString read Get_ToString;
    property NoTimeout: Integer read Get_NoTimeout;
    property ReceiveTimeout: Integer read Get_ReceiveTimeout write Set_ReceiveTimeout;
    property SendTimeout: Integer read Get_SendTimeout write Set_SendTimeout;
    property ReceiveBufferSize: Integer read Get_ReceiveBufferSize write Set_ReceiveBufferSize;
    property SendBufferSize: Integer read Get_SendBufferSize write Set_SendBufferSize;
    property UseSsl: WordBool read Get_UseSsl;
    property Localhost: WideString read Get_Localhost;
    property DefaultServerPort: LongWord read Get_DefaultServerPort;
  end;

// *********************************************************************//
// DispIntf :    IStreamClientSettingsDisp
// Indicateurs : (4416) Dual OleAutomation Dispatchable
// GUID :        {BE7495F7-DA7A-4584-AEB9-789AF316C971}
// *********************************************************************//
  IStreamClientSettingsDisp = dispinterface
    ['{BE7495F7-DA7A-4584-AEB9-789AF316C971}']
    property IP: WideString dispid 1;
    property Port: LongWord dispid 2;
    property FoundOnDNS: WordBool readonly dispid 3;
    property IsValid: WordBool readonly dispid 4;
    property ServerName: WideString dispid 5;
    property CheckCertificate: WordBool dispid 6;
    property FullIP: WideString readonly dispid 7;
    property ToString: WideString readonly dispid 100;
    property NoTimeout: Integer readonly dispid 1001;
    property ReceiveTimeout: Integer dispid 1002;
    property SendTimeout: Integer dispid 1003;
    property ReceiveBufferSize: Integer dispid 1004;
    property SendBufferSize: Integer dispid 1005;
    property UseSsl: WordBool readonly dispid 1006;
    property Localhost: WideString readonly dispid 1007;
    property DefaultServerPort: LongWord readonly dispid 1008;
  end;

// *********************************************************************//
// Interface :   IStreamServerSettings
// Indicateurs : (4416) Dual OleAutomation Dispatchable
// GUID :        {F4BC72B2-4375-4723-B59D-809182C8CFDE}
// *********************************************************************//
  IStreamServerSettings = interface(IDispatch)
    ['{F4BC72B2-4375-4723-B59D-809182C8CFDE}']
    function Get_IsValid: WordBool; safecall;
    function Get_Port: LongWord; safecall;
    procedure Set_Port(pRetVal: LongWord); safecall;
    function Get_Certificate: WideString; safecall;
    procedure Set_Certificate(const pRetVal: WideString); safecall;
    function Get_ServerCertificate: _X509Certificate; safecall;
    procedure _Set_ServerCertificate(const pRetVal: _X509Certificate); safecall;
    function Get_ToString: WideString; safecall;
    function Get_NoTimeout: Integer; safecall;
    function Get_ReceiveTimeout: Integer; safecall;
    procedure Set_ReceiveTimeout(pRetVal: Integer); safecall;
    function Get_SendTimeout: Integer; safecall;
    procedure Set_SendTimeout(pRetVal: Integer); safecall;
    function Get_ReceiveBufferSize: Integer; safecall;
    procedure Set_ReceiveBufferSize(pRetVal: Integer); safecall;
    function Get_SendBufferSize: Integer; safecall;
    procedure Set_SendBufferSize(pRetVal: Integer); safecall;
    function Get_UseSsl: WordBool; safecall;
    function Get_Localhost: WideString; safecall;
    function Get_DefaultServerPort: LongWord; safecall;
    property IsValid: WordBool read Get_IsValid;
    property Port: LongWord read Get_Port write Set_Port;
    property Certificate: WideString read Get_Certificate write Set_Certificate;
    property ServerCertificate: _X509Certificate read Get_ServerCertificate write _Set_ServerCertificate;
    property ToString: WideString read Get_ToString;
    property NoTimeout: Integer read Get_NoTimeout;
    property ReceiveTimeout: Integer read Get_ReceiveTimeout write Set_ReceiveTimeout;
    property SendTimeout: Integer read Get_SendTimeout write Set_SendTimeout;
    property ReceiveBufferSize: Integer read Get_ReceiveBufferSize write Set_ReceiveBufferSize;
    property SendBufferSize: Integer read Get_SendBufferSize write Set_SendBufferSize;
    property UseSsl: WordBool read Get_UseSsl;
    property Localhost: WideString read Get_Localhost;
    property DefaultServerPort: LongWord read Get_DefaultServerPort;
  end;

// *********************************************************************//
// DispIntf :    IStreamServerSettingsDisp
// Indicateurs : (4416) Dual OleAutomation Dispatchable
// GUID :        {F4BC72B2-4375-4723-B59D-809182C8CFDE}
// *********************************************************************//
  IStreamServerSettingsDisp = dispinterface
    ['{F4BC72B2-4375-4723-B59D-809182C8CFDE}']
    property IsValid: WordBool readonly dispid 1;
    property Port: LongWord dispid 2;
    property Certificate: WideString dispid 3;
    property ServerCertificate: _X509Certificate dispid 4;
    property ToString: WideString readonly dispid 100;
    property NoTimeout: Integer readonly dispid 1001;
    property ReceiveTimeout: Integer dispid 1002;
    property SendTimeout: Integer dispid 1003;
    property ReceiveBufferSize: Integer dispid 1004;
    property SendBufferSize: Integer dispid 1005;
    property UseSsl: WordBool readonly dispid 1006;
    property Localhost: WideString readonly dispid 1007;
    property DefaultServerPort: LongWord readonly dispid 1008;
  end;

// *********************************************************************//
// Interface :   IStreamClientThreadSettings
// Indicateurs : (4416) Dual OleAutomation Dispatchable
// GUID :        {966E7BDC-A560-4988-8AF7-717FF1341E4D}
// *********************************************************************//
  IStreamClientThreadSettings = interface(IDispatch)
    ['{966E7BDC-A560-4988-8AF7-717FF1341E4D}']
    function Get_IsValid: WordBool; safecall;
    function Get_Parameters: OleVariant; safecall;
    procedure _Set_Parameters(pRetVal: OleVariant); safecall;
    function Get_ThreadData: IThreadData; safecall;
    procedure _Set_ThreadData(const pRetVal: IThreadData); safecall;
    function Get_OnReply: _ClientOnReplyDelegate; safecall;
    procedure _Set_OnReply(const pRetVal: _ClientOnReplyDelegate); safecall;
    property IsValid: WordBool read Get_IsValid;
    property Parameters: OleVariant read Get_Parameters write _Set_Parameters;
    property ThreadData: IThreadData read Get_ThreadData write _Set_ThreadData;
    property OnReply: _ClientOnReplyDelegate read Get_OnReply write _Set_OnReply;
  end;

// *********************************************************************//
// DispIntf :    IStreamClientThreadSettingsDisp
// Indicateurs : (4416) Dual OleAutomation Dispatchable
// GUID :        {966E7BDC-A560-4988-8AF7-717FF1341E4D}
// *********************************************************************//
  IStreamClientThreadSettingsDisp = dispinterface
    ['{966E7BDC-A560-4988-8AF7-717FF1341E4D}']
    property IsValid: WordBool readonly dispid 1;
    property Parameters: OleVariant dispid 2;
    property ThreadData: IThreadData dispid 3;
    property OnReply: _ClientOnReplyDelegate dispid 4;
  end;

// *********************************************************************//
// Interface :   IStreamServerThreadSettings
// Indicateurs : (4416) Dual OleAutomation Dispatchable
// GUID :        {FC4ED317-6B75-474A-B51F-4AD71734881F}
// *********************************************************************//
  IStreamServerThreadSettings = interface(IDispatch)
    ['{FC4ED317-6B75-474A-B51F-4AD71734881F}']
    function Get_IsValid: WordBool; safecall;
    function Get_Parameters: OleVariant; safecall;
    procedure _Set_Parameters(pRetVal: OleVariant); safecall;
    function Get_ThreadData: IThreadData; safecall;
    procedure _Set_ThreadData(const pRetVal: IThreadData); safecall;
    function Get_OnStart: _ServerOnStartDelegate; safecall;
    procedure _Set_OnStart(const pRetVal: _ServerOnStartDelegate); safecall;
    function Get_OnMessage: _ServerOnMessageDelegate; safecall;
    procedure _Set_OnMessage(const pRetVal: _ServerOnMessageDelegate); safecall;
    function Get_OnStop: _ServerOnStopDelegate; safecall;
    procedure _Set_OnStop(const pRetVal: _ServerOnStopDelegate); safecall;
    property IsValid: WordBool read Get_IsValid;
    property Parameters: OleVariant read Get_Parameters write _Set_Parameters;
    property ThreadData: IThreadData read Get_ThreadData write _Set_ThreadData;
    property OnStart: _ServerOnStartDelegate read Get_OnStart write _Set_OnStart;
    property OnMessage: _ServerOnMessageDelegate read Get_OnMessage write _Set_OnMessage;
    property OnStop: _ServerOnStopDelegate read Get_OnStop write _Set_OnStop;
  end;

// *********************************************************************//
// DispIntf :    IStreamServerThreadSettingsDisp
// Indicateurs : (4416) Dual OleAutomation Dispatchable
// GUID :        {FC4ED317-6B75-474A-B51F-4AD71734881F}
// *********************************************************************//
  IStreamServerThreadSettingsDisp = dispinterface
    ['{FC4ED317-6B75-474A-B51F-4AD71734881F}']
    property IsValid: WordBool readonly dispid 1;
    property Parameters: OleVariant dispid 2;
    property ThreadData: IThreadData dispid 3;
    property OnStart: _ServerOnStartDelegate dispid 4;
    property OnMessage: _ServerOnMessageDelegate dispid 5;
    property OnStop: _ServerOnStopDelegate dispid 6;
  end;

// *********************************************************************//
// Interface :   IThread
// Indicateurs : (4416) Dual OleAutomation Dispatchable
// GUID :        {420E0E6B-C6D4-499A-87A7-992FECBFEFC3}
// *********************************************************************//
  IThread = interface(IDispatch)
    ['{420E0E6B-C6D4-499A-87A7-992FECBFEFC3}']
    function Get_IsRunning: WordBool; safecall;
    function Get_Result: Integer; safecall;
    function Get_UniqueID: Integer; safecall;
    function Get_NoThread: Integer; safecall;
    function Get_FinalDelayWhenThreadTerminates: Integer; safecall;
    procedure Set_FinalDelayWhenThreadTerminates(pRetVal: Integer); safecall;
    function Get_Thread: _Thread; safecall;
    function Get_ID: Integer; safecall;
    procedure Set_ID(pRetVal: Integer); safecall;
    function Get_Name: WideString; safecall;
    procedure Set_Name(const pRetVal: WideString); safecall;
    function Get_Description: WideString; safecall;
    function Get_HasBeenStarted: WordBool; safecall;
    function Get_CanStart: WordBool; safecall;
    function Wait(timer: Integer): WordBool; safecall;
    procedure SendNotification(value: Integer; stopped: WordBool); safecall;
    property IsRunning: WordBool read Get_IsRunning;
    property Result: Integer read Get_Result;
    property UniqueID: Integer read Get_UniqueID;
    property NoThread: Integer read Get_NoThread;
    property FinalDelayWhenThreadTerminates: Integer read Get_FinalDelayWhenThreadTerminates write Set_FinalDelayWhenThreadTerminates;
    property Thread: _Thread read Get_Thread;
    property ID: Integer read Get_ID write Set_ID;
    property Name: WideString read Get_Name write Set_Name;
    property Description: WideString read Get_Description;
    property HasBeenStarted: WordBool read Get_HasBeenStarted;
    property CanStart: WordBool read Get_CanStart;
  end;

// *********************************************************************//
// DispIntf :    IThreadDisp
// Indicateurs : (4416) Dual OleAutomation Dispatchable
// GUID :        {420E0E6B-C6D4-499A-87A7-992FECBFEFC3}
// *********************************************************************//
  IThreadDisp = dispinterface
    ['{420E0E6B-C6D4-499A-87A7-992FECBFEFC3}']
    property IsRunning: WordBool readonly dispid 5001;
    property Result: Integer readonly dispid 5002;
    property UniqueID: Integer readonly dispid 5003;
    property NoThread: Integer readonly dispid 5004;
    property FinalDelayWhenThreadTerminates: Integer dispid 5006;
    property Thread: _Thread readonly dispid 5007;
    property ID: Integer dispid 5008;
    property Name: WideString dispid 5009;
    property Description: WideString readonly dispid 5010;
    property HasBeenStarted: WordBool readonly dispid 5011;
    property CanStart: WordBool readonly dispid 5012;
    function Wait(timer: Integer): WordBool; dispid 5100;
    procedure SendNotification(value: Integer; stopped: WordBool); dispid 5101;
  end;

// *********************************************************************//
// Interface :   IThreadData
// Indicateurs : (4416) Dual OleAutomation Dispatchable
// GUID :        {CD4AB05D-ED37-493A-B658-C4D5D86B6864}
// *********************************************************************//
  IThreadData = interface(IDispatch)
    ['{CD4AB05D-ED37-493A-B658-C4D5D86B6864}']
    function Get_WindowToWarn: Integer; safecall;
    procedure Set_WindowToWarn(pRetVal: Integer); safecall;
    function Get_StoppedMessage: LongWord; safecall;
    procedure Set_StoppedMessage(pRetVal: LongWord); safecall;
    function Get_InformationMessage: LongWord; safecall;
    procedure Set_InformationMessage(pRetVal: LongWord); safecall;
    function Get_IsValid: WordBool; safecall;
    function Get_WMThreadStopped: LongWord; safecall;
    function Get_WMThreadInformation: LongWord; safecall;
    function Get_EventToSignal: _EventWaitHandle; safecall;
    procedure _Set_EventToSignal(const pRetVal: _EventWaitHandle); safecall;
    property WindowToWarn: Integer read Get_WindowToWarn write Set_WindowToWarn;
    property StoppedMessage: LongWord read Get_StoppedMessage write Set_StoppedMessage;
    property InformationMessage: LongWord read Get_InformationMessage write Set_InformationMessage;
    property IsValid: WordBool read Get_IsValid;
    property WMThreadStopped: LongWord read Get_WMThreadStopped;
    property WMThreadInformation: LongWord read Get_WMThreadInformation;
    property EventToSignal: _EventWaitHandle read Get_EventToSignal write _Set_EventToSignal;
  end;

// *********************************************************************//
// DispIntf :    IThreadDataDisp
// Indicateurs : (4416) Dual OleAutomation Dispatchable
// GUID :        {CD4AB05D-ED37-493A-B658-C4D5D86B6864}
// *********************************************************************//
  IThreadDataDisp = dispinterface
    ['{CD4AB05D-ED37-493A-B658-C4D5D86B6864}']
    property WindowToWarn: Integer dispid 1;
    property StoppedMessage: LongWord dispid 2;
    property InformationMessage: LongWord dispid 3;
    property IsValid: WordBool readonly dispid 10;
    property WMThreadStopped: LongWord readonly dispid 50;
    property WMThreadInformation: LongWord readonly dispid 51;
    property EventToSignal: _EventWaitHandle dispid 60;
  end;

// *********************************************************************//
// Interface :   _FeedRecordDelegate
// Indicateurs : (4432) Hidden Dual OleAutomation Dispatchable
// GUID :        {D7F0F2A0-F646-30CD-99A9-E61692F3D3A0}
// *********************************************************************//
  _FeedRecordDelegate = interface(IDispatch)
    ['{D7F0F2A0-F646-30CD-99A9-E61692F3D3A0}']
  end;

// *********************************************************************//
// DispIntf :    _FeedRecordDelegateDisp
// Indicateurs : (4432) Hidden Dual OleAutomation Dispatchable
// GUID :        {D7F0F2A0-F646-30CD-99A9-E61692F3D3A0}
// *********************************************************************//
  _FeedRecordDelegateDisp = dispinterface
    ['{D7F0F2A0-F646-30CD-99A9-E61692F3D3A0}']
  end;

// *********************************************************************//
// Interface :   _SendAsyncType
// Indicateurs : (4432) Hidden Dual OleAutomation Dispatchable
// GUID :        {DCFE0E70-4BCF-3612-B3E9-C9B7EAF687E9}
// *********************************************************************//
  _SendAsyncType = interface(IDispatch)
    ['{DCFE0E70-4BCF-3612-B3E9-C9B7EAF687E9}']
  end;

// *********************************************************************//
// DispIntf :    _SendAsyncTypeDisp
// Indicateurs : (4432) Hidden Dual OleAutomation Dispatchable
// GUID :        {DCFE0E70-4BCF-3612-B3E9-C9B7EAF687E9}
// *********************************************************************//
  _SendAsyncTypeDisp = dispinterface
    ['{DCFE0E70-4BCF-3612-B3E9-C9B7EAF687E9}']
  end;

// *********************************************************************//
// Interface :   _ServerOnStartDelegate
// Indicateurs : (4432) Hidden Dual OleAutomation Dispatchable
// GUID :        {A08079B2-47AC-36E9-8A8E-7273B55BD5D2}
// *********************************************************************//
  _ServerOnStartDelegate = interface(IDispatch)
    ['{A08079B2-47AC-36E9-8A8E-7273B55BD5D2}']
  end;

// *********************************************************************//
// DispIntf :    _ServerOnStartDelegateDisp
// Indicateurs : (4432) Hidden Dual OleAutomation Dispatchable
// GUID :        {A08079B2-47AC-36E9-8A8E-7273B55BD5D2}
// *********************************************************************//
  _ServerOnStartDelegateDisp = dispinterface
    ['{A08079B2-47AC-36E9-8A8E-7273B55BD5D2}']
  end;

// *********************************************************************//
// Interface :   _ServerOnConnectDelegate
// Indicateurs : (4432) Hidden Dual OleAutomation Dispatchable
// GUID :        {472D1DE4-CCB1-3FC5-BCE0-F6003FF187F8}
// *********************************************************************//
  _ServerOnConnectDelegate = interface(IDispatch)
    ['{472D1DE4-CCB1-3FC5-BCE0-F6003FF187F8}']
  end;

// *********************************************************************//
// DispIntf :    _ServerOnConnectDelegateDisp
// Indicateurs : (4432) Hidden Dual OleAutomation Dispatchable
// GUID :        {472D1DE4-CCB1-3FC5-BCE0-F6003FF187F8}
// *********************************************************************//
  _ServerOnConnectDelegateDisp = dispinterface
    ['{472D1DE4-CCB1-3FC5-BCE0-F6003FF187F8}']
  end;

// *********************************************************************//
// Interface :   _ServerOnMessageDelegate
// Indicateurs : (4432) Hidden Dual OleAutomation Dispatchable
// GUID :        {BFA46CC8-A3DA-38CC-9BD9-7FCB40394348}
// *********************************************************************//
  _ServerOnMessageDelegate = interface(IDispatch)
    ['{BFA46CC8-A3DA-38CC-9BD9-7FCB40394348}']
  end;

// *********************************************************************//
// DispIntf :    _ServerOnMessageDelegateDisp
// Indicateurs : (4432) Hidden Dual OleAutomation Dispatchable
// GUID :        {BFA46CC8-A3DA-38CC-9BD9-7FCB40394348}
// *********************************************************************//
  _ServerOnMessageDelegateDisp = dispinterface
    ['{BFA46CC8-A3DA-38CC-9BD9-7FCB40394348}']
  end;

// *********************************************************************//
// Interface :   _ServerOnDisconnectDelegate
// Indicateurs : (4432) Hidden Dual OleAutomation Dispatchable
// GUID :        {4B81353D-4733-3D6B-9C90-835D1DFB0B66}
// *********************************************************************//
  _ServerOnDisconnectDelegate = interface(IDispatch)
    ['{4B81353D-4733-3D6B-9C90-835D1DFB0B66}']
  end;

// *********************************************************************//
// DispIntf :    _ServerOnDisconnectDelegateDisp
// Indicateurs : (4432) Hidden Dual OleAutomation Dispatchable
// GUID :        {4B81353D-4733-3D6B-9C90-835D1DFB0B66}
// *********************************************************************//
  _ServerOnDisconnectDelegateDisp = dispinterface
    ['{4B81353D-4733-3D6B-9C90-835D1DFB0B66}']
  end;

// *********************************************************************//
// Interface :   _ServerOnStopDelegate
// Indicateurs : (4432) Hidden Dual OleAutomation Dispatchable
// GUID :        {B6BAA48E-2E1B-38AB-AA93-CCD29074370E}
// *********************************************************************//
  _ServerOnStopDelegate = interface(IDispatch)
    ['{B6BAA48E-2E1B-38AB-AA93-CCD29074370E}']
  end;

// *********************************************************************//
// DispIntf :    _ServerOnStopDelegateDisp
// Indicateurs : (4432) Hidden Dual OleAutomation Dispatchable
// GUID :        {B6BAA48E-2E1B-38AB-AA93-CCD29074370E}
// *********************************************************************//
  _ServerOnStopDelegateDisp = dispinterface
    ['{B6BAA48E-2E1B-38AB-AA93-CCD29074370E}']
  end;

// *********************************************************************//
// Interface :   _ClientOnReceivedMessageDelegate
// Indicateurs : (4432) Hidden Dual OleAutomation Dispatchable
// GUID :        {684612E3-7F2F-34AA-AD46-78FBB4E99A84}
// *********************************************************************//
  _ClientOnReceivedMessageDelegate = interface(IDispatch)
    ['{684612E3-7F2F-34AA-AD46-78FBB4E99A84}']
  end;

// *********************************************************************//
// DispIntf :    _ClientOnReceivedMessageDelegateDisp
// Indicateurs : (4432) Hidden Dual OleAutomation Dispatchable
// GUID :        {684612E3-7F2F-34AA-AD46-78FBB4E99A84}
// *********************************************************************//
  _ClientOnReceivedMessageDelegateDisp = dispinterface
    ['{684612E3-7F2F-34AA-AD46-78FBB4E99A84}']
  end;

// *********************************************************************//
// Interface :   _ClientOnSendMessageDelegate
// Indicateurs : (4432) Hidden Dual OleAutomation Dispatchable
// GUID :        {37485B63-0D28-3643-B8B0-3E023FD9D4F9}
// *********************************************************************//
  _ClientOnSendMessageDelegate = interface(IDispatch)
    ['{37485B63-0D28-3643-B8B0-3E023FD9D4F9}']
  end;

// *********************************************************************//
// DispIntf :    _ClientOnSendMessageDelegateDisp
// Indicateurs : (4432) Hidden Dual OleAutomation Dispatchable
// GUID :        {37485B63-0D28-3643-B8B0-3E023FD9D4F9}
// *********************************************************************//
  _ClientOnSendMessageDelegateDisp = dispinterface
    ['{37485B63-0D28-3643-B8B0-3E023FD9D4F9}']
  end;

// *********************************************************************//
// Interface :   _ClientOnReplyDelegate
// Indicateurs : (4432) Hidden Dual OleAutomation Dispatchable
// GUID :        {630876F9-312A-3345-817E-E41461F337A8}
// *********************************************************************//
  _ClientOnReplyDelegate = interface(IDispatch)
    ['{630876F9-312A-3345-817E-E41461F337A8}']
  end;

// *********************************************************************//
// DispIntf :    _ClientOnReplyDelegateDisp
// Indicateurs : (4432) Hidden Dual OleAutomation Dispatchable
// GUID :        {630876F9-312A-3345-817E-E41461F337A8}
// *********************************************************************//
  _ClientOnReplyDelegateDisp = dispinterface
    ['{630876F9-312A-3345-817E-E41461F337A8}']
  end;

// *********************************************************************//
// Interface :   _CThreadFunction
// Indicateurs : (4432) Hidden Dual OleAutomation Dispatchable
// GUID :        {9FF3E249-7C77-3D69-B639-2ED302F3EA0E}
// *********************************************************************//
  _CThreadFunction = interface(IDispatch)
    ['{9FF3E249-7C77-3D69-B639-2ED302F3EA0E}']
  end;

// *********************************************************************//
// DispIntf :    _CThreadFunctionDisp
// Indicateurs : (4432) Hidden Dual OleAutomation Dispatchable
// GUID :        {9FF3E249-7C77-3D69-B639-2ED302F3EA0E}
// *********************************************************************//
  _CThreadFunctionDisp = dispinterface
    ['{9FF3E249-7C77-3D69-B639-2ED302F3EA0E}']
  end;

// *********************************************************************//
// Interface :   _TimerCompleteDelegate
// Indicateurs : (4432) Hidden Dual OleAutomation Dispatchable
// GUID :        {958992F3-D314-31B9-8EE1-98F6430FE074}
// *********************************************************************//
  _TimerCompleteDelegate = interface(IDispatch)
    ['{958992F3-D314-31B9-8EE1-98F6430FE074}']
  end;

// *********************************************************************//
// DispIntf :    _TimerCompleteDelegateDisp
// Indicateurs : (4432) Hidden Dual OleAutomation Dispatchable
// GUID :        {958992F3-D314-31B9-8EE1-98F6430FE074}
// *********************************************************************//
  _TimerCompleteDelegateDisp = dispinterface
    ['{958992F3-D314-31B9-8EE1-98F6430FE074}']
  end;

// *********************************************************************//
// La classe CoCStreamClientSettings fournit une méthode Create et CreateRemote pour
// créer des instances de l'interface par défaut IStreamClientSettings exposée
// par la CoClasse CStreamClientSettings. Les fonctions sont destinées à être utilisées par
// les clients désirant automatiser les objets CoClasse exposés par
// le serveur de cette bibliothèque de types.
// *********************************************************************//
  CoCStreamClientSettings = class
    class function Create: IStreamClientSettings;
    class function CreateRemote(const MachineName: string): IStreamClientSettings;
  end;

// *********************************************************************//
// La classe CoCStreamServerSettings fournit une méthode Create et CreateRemote pour
// créer des instances de l'interface par défaut IStreamServerSettings exposée
// par la CoClasse CStreamServerSettings. Les fonctions sont destinées à être utilisées par
// les clients désirant automatiser les objets CoClasse exposés par
// le serveur de cette bibliothèque de types.
// *********************************************************************//
  CoCStreamServerSettings = class
    class function Create: IStreamServerSettings;
    class function CreateRemote(const MachineName: string): IStreamServerSettings;
  end;

// *********************************************************************//
// La classe CoCStreamClientThreadSettings fournit une méthode Create et CreateRemote pour
// créer des instances de l'interface par défaut IStreamClientThreadSettings exposée
// par la CoClasse CStreamClientThreadSettings. Les fonctions sont destinées à être utilisées par
// les clients désirant automatiser les objets CoClasse exposés par
// le serveur de cette bibliothèque de types.
// *********************************************************************//
  CoCStreamClientThreadSettings = class
    class function Create: IStreamClientThreadSettings;
    class function CreateRemote(const MachineName: string): IStreamClientThreadSettings;
  end;

// *********************************************************************//
// La classe CoCStreamServerThreadSettings fournit une méthode Create et CreateRemote pour
// créer des instances de l'interface par défaut IStreamServerThreadSettings exposée
// par la CoClasse CStreamServerThreadSettings. Les fonctions sont destinées à être utilisées par
// les clients désirant automatiser les objets CoClasse exposés par
// le serveur de cette bibliothèque de types.
// *********************************************************************//
  CoCStreamServerThreadSettings = class
    class function Create: IStreamServerThreadSettings;
    class function CreateRemote(const MachineName: string): IStreamServerThreadSettings;
  end;

// *********************************************************************//
// La classe CoCThread fournit une méthode Create et CreateRemote pour
// créer des instances de l'interface par défaut IThread exposée
// par la CoClasse CThread. Les fonctions sont destinées à être utilisées par
// les clients désirant automatiser les objets CoClasse exposés par
// le serveur de cette bibliothèque de types.
// *********************************************************************//
  CoCThread = class
    class function Create: IThread;
    class function CreateRemote(const MachineName: string): IThread;
  end;

// *********************************************************************//
// La classe CoCThreadData fournit une méthode Create et CreateRemote pour
// créer des instances de l'interface par défaut IThreadData exposée
// par la CoClasse CThreadData. Les fonctions sont destinées à être utilisées par
// les clients désirant automatiser les objets CoClasse exposés par
// le serveur de cette bibliothèque de types.
// *********************************************************************//
  CoCThreadData = class
    class function Create: IThreadData;
    class function CreateRemote(const MachineName: string): IThreadData;
  end;

// *********************************************************************//
// La classe CoFeedRecordDelegate fournit une méthode Create et CreateRemote pour
// créer des instances de l'interface par défaut _FeedRecordDelegate exposée
// par la CoClasse FeedRecordDelegate. Les fonctions sont destinées à être utilisées par
// les clients désirant automatiser les objets CoClasse exposés par
// le serveur de cette bibliothèque de types.
// *********************************************************************//
  CoFeedRecordDelegate = class
    class function Create: _FeedRecordDelegate;
    class function CreateRemote(const MachineName: string): _FeedRecordDelegate;
  end;

// *********************************************************************//
// La classe CoSendAsyncType fournit une méthode Create et CreateRemote pour
// créer des instances de l'interface par défaut _SendAsyncType exposée
// par la CoClasse SendAsyncType. Les fonctions sont destinées à être utilisées par
// les clients désirant automatiser les objets CoClasse exposés par
// le serveur de cette bibliothèque de types.
// *********************************************************************//
  CoSendAsyncType = class
    class function Create: _SendAsyncType;
    class function CreateRemote(const MachineName: string): _SendAsyncType;
  end;

// *********************************************************************//
// La classe CoServerOnStartDelegate fournit une méthode Create et CreateRemote pour
// créer des instances de l'interface par défaut _ServerOnStartDelegate exposée
// par la CoClasse ServerOnStartDelegate. Les fonctions sont destinées à être utilisées par
// les clients désirant automatiser les objets CoClasse exposés par
// le serveur de cette bibliothèque de types.
// *********************************************************************//
  CoServerOnStartDelegate = class
    class function Create: _ServerOnStartDelegate;
    class function CreateRemote(const MachineName: string): _ServerOnStartDelegate;
  end;

// *********************************************************************//
// La classe CoServerOnConnectDelegate fournit une méthode Create et CreateRemote pour
// créer des instances de l'interface par défaut _ServerOnConnectDelegate exposée
// par la CoClasse ServerOnConnectDelegate. Les fonctions sont destinées à être utilisées par
// les clients désirant automatiser les objets CoClasse exposés par
// le serveur de cette bibliothèque de types.
// *********************************************************************//
  CoServerOnConnectDelegate = class
    class function Create: _ServerOnConnectDelegate;
    class function CreateRemote(const MachineName: string): _ServerOnConnectDelegate;
  end;

// *********************************************************************//
// La classe CoServerOnMessageDelegate fournit une méthode Create et CreateRemote pour
// créer des instances de l'interface par défaut _ServerOnMessageDelegate exposée
// par la CoClasse ServerOnMessageDelegate. Les fonctions sont destinées à être utilisées par
// les clients désirant automatiser les objets CoClasse exposés par
// le serveur de cette bibliothèque de types.
// *********************************************************************//
  CoServerOnMessageDelegate = class
    class function Create: _ServerOnMessageDelegate;
    class function CreateRemote(const MachineName: string): _ServerOnMessageDelegate;
  end;

// *********************************************************************//
// La classe CoServerOnDisconnectDelegate fournit une méthode Create et CreateRemote pour
// créer des instances de l'interface par défaut _ServerOnDisconnectDelegate exposée
// par la CoClasse ServerOnDisconnectDelegate. Les fonctions sont destinées à être utilisées par
// les clients désirant automatiser les objets CoClasse exposés par
// le serveur de cette bibliothèque de types.
// *********************************************************************//
  CoServerOnDisconnectDelegate = class
    class function Create: _ServerOnDisconnectDelegate;
    class function CreateRemote(const MachineName: string): _ServerOnDisconnectDelegate;
  end;

// *********************************************************************//
// La classe CoServerOnStopDelegate fournit une méthode Create et CreateRemote pour
// créer des instances de l'interface par défaut _ServerOnStopDelegate exposée
// par la CoClasse ServerOnStopDelegate. Les fonctions sont destinées à être utilisées par
// les clients désirant automatiser les objets CoClasse exposés par
// le serveur de cette bibliothèque de types.
// *********************************************************************//
  CoServerOnStopDelegate = class
    class function Create: _ServerOnStopDelegate;
    class function CreateRemote(const MachineName: string): _ServerOnStopDelegate;
  end;

// *********************************************************************//
// La classe CoClientOnReceivedMessageDelegate fournit une méthode Create et CreateRemote pour
// créer des instances de l'interface par défaut _ClientOnReceivedMessageDelegate exposée
// par la CoClasse ClientOnReceivedMessageDelegate. Les fonctions sont destinées à être utilisées par
// les clients désirant automatiser les objets CoClasse exposés par
// le serveur de cette bibliothèque de types.
// *********************************************************************//
  CoClientOnReceivedMessageDelegate = class
    class function Create: _ClientOnReceivedMessageDelegate;
    class function CreateRemote(const MachineName: string): _ClientOnReceivedMessageDelegate;
  end;

// *********************************************************************//
// La classe CoClientOnSendMessageDelegate fournit une méthode Create et CreateRemote pour
// créer des instances de l'interface par défaut _ClientOnSendMessageDelegate exposée
// par la CoClasse ClientOnSendMessageDelegate. Les fonctions sont destinées à être utilisées par
// les clients désirant automatiser les objets CoClasse exposés par
// le serveur de cette bibliothèque de types.
// *********************************************************************//
  CoClientOnSendMessageDelegate = class
    class function Create: _ClientOnSendMessageDelegate;
    class function CreateRemote(const MachineName: string): _ClientOnSendMessageDelegate;
  end;

// *********************************************************************//
// La classe CoClientOnReplyDelegate fournit une méthode Create et CreateRemote pour
// créer des instances de l'interface par défaut _ClientOnReplyDelegate exposée
// par la CoClasse ClientOnReplyDelegate. Les fonctions sont destinées à être utilisées par
// les clients désirant automatiser les objets CoClasse exposés par
// le serveur de cette bibliothèque de types.
// *********************************************************************//
  CoClientOnReplyDelegate = class
    class function Create: _ClientOnReplyDelegate;
    class function CreateRemote(const MachineName: string): _ClientOnReplyDelegate;
  end;

// *********************************************************************//
// La classe CoCThreadFunction fournit une méthode Create et CreateRemote pour
// créer des instances de l'interface par défaut _CThreadFunction exposée
// par la CoClasse CThreadFunction. Les fonctions sont destinées à être utilisées par
// les clients désirant automatiser les objets CoClasse exposés par
// le serveur de cette bibliothèque de types.
// *********************************************************************//
  CoCThreadFunction = class
    class function Create: _CThreadFunction;
    class function CreateRemote(const MachineName: string): _CThreadFunction;
  end;

// *********************************************************************//
// La classe CoTimerCompleteDelegate fournit une méthode Create et CreateRemote pour
// créer des instances de l'interface par défaut _TimerCompleteDelegate exposée
// par la CoClasse TimerCompleteDelegate. Les fonctions sont destinées à être utilisées par
// les clients désirant automatiser les objets CoClasse exposés par
// le serveur de cette bibliothèque de types.
// *********************************************************************//
  CoTimerCompleteDelegate = class
    class function Create: _TimerCompleteDelegate;
    class function CreateRemote(const MachineName: string): _TimerCompleteDelegate;
  end;

implementation

uses System.Win.ComObj;

class function CoCStreamClientSettings.Create: IStreamClientSettings;
begin
  Result := CreateComObject(CLASS_CStreamClientSettings) as IStreamClientSettings;
end;

class function CoCStreamClientSettings.CreateRemote(const MachineName: string): IStreamClientSettings;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_CStreamClientSettings) as IStreamClientSettings;
end;

class function CoCStreamServerSettings.Create: IStreamServerSettings;
begin
  Result := CreateComObject(CLASS_CStreamServerSettings) as IStreamServerSettings;
end;

class function CoCStreamServerSettings.CreateRemote(const MachineName: string): IStreamServerSettings;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_CStreamServerSettings) as IStreamServerSettings;
end;

class function CoCStreamClientThreadSettings.Create: IStreamClientThreadSettings;
begin
  Result := CreateComObject(CLASS_CStreamClientThreadSettings) as IStreamClientThreadSettings;
end;

class function CoCStreamClientThreadSettings.CreateRemote(const MachineName: string): IStreamClientThreadSettings;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_CStreamClientThreadSettings) as IStreamClientThreadSettings;
end;

class function CoCStreamServerThreadSettings.Create: IStreamServerThreadSettings;
begin
  Result := CreateComObject(CLASS_CStreamServerThreadSettings) as IStreamServerThreadSettings;
end;

class function CoCStreamServerThreadSettings.CreateRemote(const MachineName: string): IStreamServerThreadSettings;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_CStreamServerThreadSettings) as IStreamServerThreadSettings;
end;

class function CoCThread.Create: IThread;
begin
  Result := CreateComObject(CLASS_CThread) as IThread;
end;

class function CoCThread.CreateRemote(const MachineName: string): IThread;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_CThread) as IThread;
end;

class function CoCThreadData.Create: IThreadData;
begin
  Result := CreateComObject(CLASS_CThreadData) as IThreadData;
end;

class function CoCThreadData.CreateRemote(const MachineName: string): IThreadData;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_CThreadData) as IThreadData;
end;

class function CoFeedRecordDelegate.Create: _FeedRecordDelegate;
begin
  Result := CreateComObject(CLASS_FeedRecordDelegate) as _FeedRecordDelegate;
end;

class function CoFeedRecordDelegate.CreateRemote(const MachineName: string): _FeedRecordDelegate;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_FeedRecordDelegate) as _FeedRecordDelegate;
end;

class function CoSendAsyncType.Create: _SendAsyncType;
begin
  Result := CreateComObject(CLASS_SendAsyncType) as _SendAsyncType;
end;

class function CoSendAsyncType.CreateRemote(const MachineName: string): _SendAsyncType;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SendAsyncType) as _SendAsyncType;
end;

class function CoServerOnStartDelegate.Create: _ServerOnStartDelegate;
begin
  Result := CreateComObject(CLASS_ServerOnStartDelegate) as _ServerOnStartDelegate;
end;

class function CoServerOnStartDelegate.CreateRemote(const MachineName: string): _ServerOnStartDelegate;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ServerOnStartDelegate) as _ServerOnStartDelegate;
end;

class function CoServerOnConnectDelegate.Create: _ServerOnConnectDelegate;
begin
  Result := CreateComObject(CLASS_ServerOnConnectDelegate) as _ServerOnConnectDelegate;
end;

class function CoServerOnConnectDelegate.CreateRemote(const MachineName: string): _ServerOnConnectDelegate;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ServerOnConnectDelegate) as _ServerOnConnectDelegate;
end;

class function CoServerOnMessageDelegate.Create: _ServerOnMessageDelegate;
begin
  Result := CreateComObject(CLASS_ServerOnMessageDelegate) as _ServerOnMessageDelegate;
end;

class function CoServerOnMessageDelegate.CreateRemote(const MachineName: string): _ServerOnMessageDelegate;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ServerOnMessageDelegate) as _ServerOnMessageDelegate;
end;

class function CoServerOnDisconnectDelegate.Create: _ServerOnDisconnectDelegate;
begin
  Result := CreateComObject(CLASS_ServerOnDisconnectDelegate) as _ServerOnDisconnectDelegate;
end;

class function CoServerOnDisconnectDelegate.CreateRemote(const MachineName: string): _ServerOnDisconnectDelegate;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ServerOnDisconnectDelegate) as _ServerOnDisconnectDelegate;
end;

class function CoServerOnStopDelegate.Create: _ServerOnStopDelegate;
begin
  Result := CreateComObject(CLASS_ServerOnStopDelegate) as _ServerOnStopDelegate;
end;

class function CoServerOnStopDelegate.CreateRemote(const MachineName: string): _ServerOnStopDelegate;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ServerOnStopDelegate) as _ServerOnStopDelegate;
end;

class function CoClientOnReceivedMessageDelegate.Create: _ClientOnReceivedMessageDelegate;
begin
  Result := CreateComObject(CLASS_ClientOnReceivedMessageDelegate) as _ClientOnReceivedMessageDelegate;
end;

class function CoClientOnReceivedMessageDelegate.CreateRemote(const MachineName: string): _ClientOnReceivedMessageDelegate;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ClientOnReceivedMessageDelegate) as _ClientOnReceivedMessageDelegate;
end;

class function CoClientOnSendMessageDelegate.Create: _ClientOnSendMessageDelegate;
begin
  Result := CreateComObject(CLASS_ClientOnSendMessageDelegate) as _ClientOnSendMessageDelegate;
end;

class function CoClientOnSendMessageDelegate.CreateRemote(const MachineName: string): _ClientOnSendMessageDelegate;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ClientOnSendMessageDelegate) as _ClientOnSendMessageDelegate;
end;

class function CoClientOnReplyDelegate.Create: _ClientOnReplyDelegate;
begin
  Result := CreateComObject(CLASS_ClientOnReplyDelegate) as _ClientOnReplyDelegate;
end;

class function CoClientOnReplyDelegate.CreateRemote(const MachineName: string): _ClientOnReplyDelegate;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ClientOnReplyDelegate) as _ClientOnReplyDelegate;
end;

class function CoCThreadFunction.Create: _CThreadFunction;
begin
  Result := CreateComObject(CLASS_CThreadFunction) as _CThreadFunction;
end;

class function CoCThreadFunction.CreateRemote(const MachineName: string): _CThreadFunction;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_CThreadFunction) as _CThreadFunction;
end;

class function CoTimerCompleteDelegate.Create: _TimerCompleteDelegate;
begin
  Result := CreateComObject(CLASS_TimerCompleteDelegate) as _TimerCompleteDelegate;
end;

class function CoTimerCompleteDelegate.CreateRemote(const MachineName: string): _TimerCompleteDelegate;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_TimerCompleteDelegate) as _TimerCompleteDelegate;
end;

end.
