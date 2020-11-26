UNIT PMS_NEXOSALE_TLB;

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
// Biblio. types : C:\Users\philippe\Documents\Dev\NEXOSale\Release\PMS.NEXOSALE.tlb (1)
// LIBID : {B82C79B0-4829-4E9B-BBD8-993B1D2240DC}
// LCID : 0
// Fichier d'aide :
// Chaîne d'aide : NEXO Retailer 3.0 client interface [COM compatible]
// DepndLst :
// (1) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
// (2) v2.4 mscorlib, (C:\Windows\Microsoft.NET\Framework\v4.0.30319\mscorlib.tlb)
// (3) v2.4 System, (C:\Windows\Microsoft.NET\Framework\v4.0.30319\System.tlb)
// (4) v2.4 System_Windows_Forms, (C:\Windows\Microsoft.NET\Framework\v4.0.30319\System.Windows.Forms.tlb)
// (5) v2.0 PMS_NEXO, (C:\Users\philippe\Documents\Dev\NEXO\Release\PMS.NEXO.tlb)
// SYS_KIND: SYS_WIN32
// ************************************************************************ //

{$TYPEDADDRESS OFF} // L'unité doit être compilée sans pointeur à type contrôlé.

{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
{$ALIGN 4}

INTERFACE

USES
	Winapi.Windows, mscorlib_TLB, PMS_NEXO_TLB, System.Classes, System.Variants, System.Win.StdVCL, System_TLB, System_Windows_Forms_TLB, Vcl.Graphics,
	Vcl.OleServer, Winapi.ActiveX;

// *********************************************************************//
// GUIDS déclarés dans la bibliothèque de types. Préfixes utilisés:
// Bibliothèques de types : LIBID_xxxx
// CoClasses              : CLASS_xxxx
// Interfaces DISP        : DIID_xxxx
// Interfaces Non-DISP    : IID_xxxx
// *********************************************************************//
CONST
	// Versions mineure et majeure de la bibliothèque de types
	PMS_NEXOSALEMajorVersion = 1;
	PMS_NEXOSALEMinorVersion = 0;

	LIBID_PMS_NEXOSALE: TGUID = '{B82C79B0-4829-4E9B-BBD8-993B1D2240DC}';

	IID__ConfirmCancel: TGUID  = '{E8023032-21B6-3872-B114-98D948CC4CEC}';
	IID__Currency: TGUID       = '{9457A49D-F7C7-4F70-A712-9F2652E09C3A}';
	IID__FProcessing: TGUID    = '{A90D2E54-B13B-3238-B283-F3BE59B41045}';
	IID__FSettings: TGUID      = '{BB400D29-BA2E-3F5E-A67B-686A37C25322}';
	IID__FWait: TGUID          = '{4D08397F-21F4-3E4C-B8E9-8AA56AA6D485}';
	IID__NEXOSALE: TGUID       = '{24B500EF-FCF4-4438-9541-2EEB99BEF014}';
	IID__POISettings: TGUID    = '{78192CA7-AD36-408B-B822-A2FDAA6FA65C}';
	IID__Settings: TGUID       = '{56D0D286-89A1-403D-A3CD-F73F2173D7AB}';
	CLASS_Currency: TGUID      = '{A0F233DB-6682-4DC2-9C06-107077CC6717}';
	IID__NexoOperation: TGUID  = '{984CF177-D8A1-3AD7-8B13-2C31985D17BF}';
	CLASS_NEXOSALE: TGUID      = '{C86AC303-6A19-4FE6-91CC-99D9BE369EE5}';
	CLASS_POISettings: TGUID   = '{0ACB497E-FD2B-48D5-A602-EDEC63137A2C}';
	CLASS_Settings: TGUID      = '{CA6F62F3-0D1D-49C0-A8C4-BB46E5390931}';
	CLASS_ConfirmCancel: TGUID = '{4510FEFA-8A5B-3C34-93A1-9159A72E0383}';
	CLASS_FProcessing: TGUID   = '{292CCE57-8D09-324A-970F-3546C3AD0883}';
	CLASS_FSettings: TGUID     = '{1E1EA56E-A455-333E-8074-2607768C7C72}';
	CLASS_FWait: TGUID         = '{5D170CCF-1183-373C-8AEB-A09959B67312}';
	CLASS_NexoOperation: TGUID = '{D878BDF4-7929-342E-95AA-A1C74B8EE840}';

	// *********************************************************************//
	// Déclaration d'énumérations définies dans la bibliothèque de types
	// *********************************************************************//
	// Constantes pour enum Action
TYPE
	Action = TOleEnum;

CONST
	Action__none          = $00000000;
	Action__begin         = $00000001;
	Action_login          = $00000002;
	Action_logout         = $00000003;
	Action_payment        = $00000004;
	Action__base          = $00000005;
	Action_refund         = $00000006;
	Action_reversal       = $00000007;
	Action_reconciliation = $00000008;
	Action_abort          = $00000009;
	Action__end           = $0000000A;

	// Constantes pour enum ActionResult
TYPE
	ActionResult = TOleEnum;

CONST
	ActionResult__begin    = $FFFFFFFF;
	ActionResult_unknown   = $00000000;
	ActionResult_success   = $00000001;
	ActionResult_decline   = $00000002;
	ActionResult_cancel    = $00000003;
	ActionResult_timeout   = $00000004;
	ActionResult_exception = $00000005;
	ActionResult__end      = $00000006;

TYPE

	// *********************************************************************//
	// Déclaration Forward des types définis dans la bibliothèque de types
	// *********************************************************************//
	_ConfirmCancel     = INTERFACE;
	_ConfirmCancelDisp = DISPINTERFACE;
	_Currency          = INTERFACE;
	_CurrencyDisp      = DISPINTERFACE;
	_FProcessing       = INTERFACE;
	_FProcessingDisp   = DISPINTERFACE;
	_FSettings         = INTERFACE;
	_FSettingsDisp     = DISPINTERFACE;
	_FWait             = INTERFACE;
	_FWaitDisp         = DISPINTERFACE;
	_NEXOSALE          = INTERFACE;
	_NEXOSALEDisp      = DISPINTERFACE;
	_POISettings       = INTERFACE;
	_POISettingsDisp   = DISPINTERFACE;
	_Settings          = INTERFACE;
	_SettingsDisp      = DISPINTERFACE;
	_NexoOperation     = INTERFACE;
	_NexoOperationDisp = DISPINTERFACE;

	// *********************************************************************//
	// Déclaration de CoClasses définies dans la bibliothèque de types
	// (REMARQUE: On affecte chaque CoClasse à son Interface par défaut)
	// *********************************************************************//
	Currency      = _Currency;
	NEXOSALE      = _NEXOSALE;
	POISettings   = _POISettings;
	Settings      = _Settings;
	ConfirmCancel = _ConfirmCancel;
	FProcessing   = _FProcessing;
	FSettings     = _FSettings;
	FWait         = _FWait;
	NexoOperation = _NexoOperation;

	// *********************************************************************//
	// Interface :   _ConfirmCancel
	// Indicateurs : (4432) Hidden Dual OleAutomation Dispatchable
	// GUID :        {E8023032-21B6-3872-B114-98D948CC4CEC}
	// *********************************************************************//
	_ConfirmCancel = INTERFACE(IDispatch)
		['{E8023032-21B6-3872-B114-98D948CC4CEC}']
	END;

	// *********************************************************************//
	// DispIntf :    _ConfirmCancelDisp
	// Indicateurs : (4432) Hidden Dual OleAutomation Dispatchable
	// GUID :        {E8023032-21B6-3872-B114-98D948CC4CEC}
	// *********************************************************************//
	_ConfirmCancelDisp = DISPINTERFACE
		['{E8023032-21B6-3872-B114-98D948CC4CEC}']
	END;

	// *********************************************************************//
	// Interface :   _Currency
	// Indicateurs : (4416) Dual OleAutomation Dispatchable
	// GUID :        {9457A49D-F7C7-4F70-A712-9F2652E09C3A}
	// *********************************************************************//
	_Currency = INTERFACE(IDispatch)
		['{9457A49D-F7C7-4F70-A712-9F2652E09C3A}']
		FUNCTION Get_Name: WideString; SAFECALL;
		PROCEDURE Set_Name(CONST pRetVal: WideString); SAFECALL;
		FUNCTION Get_Decimals: LongWord; SAFECALL;
		PROCEDURE Set_Decimals(pRetVal: LongWord); SAFECALL;
		FUNCTION Get_ToString: WideString; SAFECALL;
		PROPERTY NAME: WideString READ Get_Name WRITE Set_Name;
		PROPERTY Decimals: LongWord READ Get_Decimals WRITE Set_Decimals;
		PROPERTY ToString: WideString READ Get_ToString;
	END;

	// *********************************************************************//
	// DispIntf :    _CurrencyDisp
	// Indicateurs : (4416) Dual OleAutomation Dispatchable
	// GUID :        {9457A49D-F7C7-4F70-A712-9F2652E09C3A}
	// *********************************************************************//
	_CurrencyDisp = DISPINTERFACE
		['{9457A49D-F7C7-4F70-A712-9F2652E09C3A}']
		PROPERTY NAME: WideString DISPID 1;
		PROPERTY Decimals: LongWord DISPID 2;
		PROPERTY ToString: WideString READONLY dispid 100;
	END;

	// *********************************************************************//
	// Interface :   _FProcessing
	// Indicateurs : (4432) Hidden Dual OleAutomation Dispatchable
	// GUID :        {A90D2E54-B13B-3238-B283-F3BE59B41045}
	// *********************************************************************//
	_FProcessing = INTERFACE(IDispatch)
		['{A90D2E54-B13B-3238-B283-F3BE59B41045}']
	END;

	// *********************************************************************//
	// DispIntf :    _FProcessingDisp
	// Indicateurs : (4432) Hidden Dual OleAutomation Dispatchable
	// GUID :        {A90D2E54-B13B-3238-B283-F3BE59B41045}
	// *********************************************************************//
	_FProcessingDisp = DISPINTERFACE
		['{A90D2E54-B13B-3238-B283-F3BE59B41045}']
	END;

	// *********************************************************************//
	// Interface :   _FSettings
	// Indicateurs : (4432) Hidden Dual OleAutomation Dispatchable
	// GUID :        {BB400D29-BA2E-3F5E-A67B-686A37C25322}
	// *********************************************************************//
	_FSettings = INTERFACE(IDispatch)
		['{BB400D29-BA2E-3F5E-A67B-686A37C25322}']
	END;

	// *********************************************************************//
	// DispIntf :    _FSettingsDisp
	// Indicateurs : (4432) Hidden Dual OleAutomation Dispatchable
	// GUID :        {BB400D29-BA2E-3F5E-A67B-686A37C25322}
	// *********************************************************************//
	_FSettingsDisp = DISPINTERFACE
		['{BB400D29-BA2E-3F5E-A67B-686A37C25322}']
	END;

	// *********************************************************************//
	// Interface :   _FWait
	// Indicateurs : (4432) Hidden Dual OleAutomation Dispatchable
	// GUID :        {4D08397F-21F4-3E4C-B8E9-8AA56AA6D485}
	// *********************************************************************//
	_FWait = INTERFACE(IDispatch)
		['{4D08397F-21F4-3E4C-B8E9-8AA56AA6D485}']
	END;

	// *********************************************************************//
	// DispIntf :    _FWaitDisp
	// Indicateurs : (4432) Hidden Dual OleAutomation Dispatchable
	// GUID :        {4D08397F-21F4-3E4C-B8E9-8AA56AA6D485}
	// *********************************************************************//
	_FWaitDisp = DISPINTERFACE
		['{4D08397F-21F4-3E4C-B8E9-8AA56AA6D485}']
	END;

	// *********************************************************************//
	// Interface :   _NEXOSALE
	// Indicateurs : (4416) Dual OleAutomation Dispatchable
	// GUID :        {24B500EF-FCF4-4438-9541-2EEB99BEF014}
	// *********************************************************************//
	_NEXOSALE = INTERFACE(IDispatch)
		['{24B500EF-FCF4-4438-9541-2EEB99BEF014}']
		FUNCTION Get_IsLogged: WordBool; SAFECALL;
		FUNCTION Get_Amount: LongWord; SAFECALL;
		PROCEDURE Set_Amount(pRetVal: LongWord); SAFECALL;
		FUNCTION Get_TransactionID: WideString; SAFECALL;
		PROCEDURE Set_TransactionID(CONST pRetVal: WideString); SAFECALL;
		FUNCTION Get_TransactionTimestamp: WideString; SAFECALL;
		PROCEDURE Set_TransactionTimestamp(CONST pRetVal: WideString); SAFECALL;
		FUNCTION Get_MainWindow: Integer; SAFECALL;
		PROCEDURE Set_MainWindow(pRetVal: Integer); SAFECALL;
		FUNCTION Get_Settings: _Settings; SAFECALL;
		PROCEDURE _Set_Settings(CONST pRetVal: _Settings); SAFECALL;
		FUNCTION Get_SaleID: WideString; SAFECALL;
		PROCEDURE Set_SaleID(CONST pRetVal: WideString); SAFECALL;
		FUNCTION Get_POIID: WideString; SAFECALL;
		PROCEDURE Set_POIID(CONST pRetVal: WideString); SAFECALL;
		FUNCTION Get_Login: INexoLogin; SAFECALL;
		FUNCTION Get_Payment: INexoFinancial; SAFECALL;
		FUNCTION Get_Refund: INexoFinancial; SAFECALL;
		FUNCTION Get_Logout: INexoLogout; SAFECALL;
		FUNCTION Get_NexoClient: INexoRetailerClient; SAFECALL;
		FUNCTION Get_Connected: WordBool; SAFECALL;
		FUNCTION Get_Success: WordBool; SAFECALL;
		FUNCTION Get_POITransactionID: WideString; SAFECALL;
		FUNCTION Get_POITransactionTimestamp: WideString; SAFECALL;
		FUNCTION Get_OriginalPOITransactionID: WideString; SAFECALL;
		FUNCTION Get_OriginalPOITransactionTimestamp: WideString; SAFECALL;
		FUNCTION Get_UseBackup: WordBool; SAFECALL;
		PROCEDURE Set_UseBackup(pRetVal: WordBool); SAFECALL;
		FUNCTION Get_LogoutOnTerminate: WordBool; SAFECALL;
		PROCEDURE Set_LogoutOnTerminate(pRetVal: WordBool); SAFECALL;
		FUNCTION Get_Reversal: INexoReversal; SAFECALL;
		FUNCTION Get_Reconciliation: INexoReconciliation; SAFECALL;
		FUNCTION Get_Abort: INexoAbort; SAFECALL;
		FUNCTION Get_ReconciliationID: WideString; SAFECALL;
		PROCEDURE Set_ReconciliationID(CONST pRetVal: WideString); SAFECALL;
		FUNCTION Get_ReconciliationAcquirerID: WideString; SAFECALL;
		PROCEDURE Set_ReconciliationAcquirerID(CONST pRetVal: WideString); SAFECALL;
		FUNCTION Get_ReconciliationType: ReconciliationTypeEnumeration; SAFECALL;
		PROCEDURE Set_ReconciliationType(pRetVal: ReconciliationTypeEnumeration); SAFECALL;
		FUNCTION Get_AbortReason: WideString; SAFECALL;
		PROCEDURE Set_AbortReason(CONST pRetVal: WideString); SAFECALL;
		FUNCTION Get_AbortMessageCategory: MessageCategoryEnumeration; SAFECALL;
		PROCEDURE Set_AbortMessageCategory(pRetVal: MessageCategoryEnumeration); SAFECALL;
		FUNCTION Get_AbortServiceID: WideString; SAFECALL;
		PROCEDURE Set_AbortServiceID(CONST pRetVal: WideString); SAFECALL;
		PROCEDURE DisplaySettings(useAdvancedSettings: WordBool); SAFECALL;
		FUNCTION DisplayProcessing(theAction: Action): ActionResult; SAFECALL;
		FUNCTION Connect: WordBool; SAFECALL;
		PROCEDURE Disconnect; SAFECALL;
		FUNCTION SettingsFileName: WideString; SAFECALL;
		PROPERTY IsLogged: WordBool READ Get_IsLogged;
		PROPERTY Amount: LongWord READ Get_Amount WRITE Set_Amount;
		PROPERTY TransactionID: WideString READ Get_TransactionID WRITE Set_TransactionID;
		PROPERTY TransactionTimestamp: WideString READ Get_TransactionTimestamp WRITE Set_TransactionTimestamp;
		PROPERTY MainWindow: Integer READ Get_MainWindow WRITE Set_MainWindow;
		PROPERTY Settings: _Settings READ Get_Settings WRITE _Set_Settings;
		PROPERTY SaleID: WideString READ Get_SaleID WRITE Set_SaleID;
		PROPERTY POIID: WideString READ Get_POIID WRITE Set_POIID;
		PROPERTY Login: INexoLogin READ Get_Login;
		PROPERTY Payment: INexoFinancial READ Get_Payment;
		PROPERTY Refund: INexoFinancial READ Get_Refund;
		PROPERTY Logout: INexoLogout READ Get_Logout;
		PROPERTY NexoClient: INexoRetailerClient READ Get_NexoClient;
		PROPERTY Connected: WordBool READ Get_Connected;
		PROPERTY Success: WordBool READ Get_Success;
		PROPERTY POITransactionID: WideString READ Get_POITransactionID;
		PROPERTY POITransactionTimestamp: WideString READ Get_POITransactionTimestamp;
		PROPERTY OriginalPOITransactionID: WideString READ Get_OriginalPOITransactionID;
		PROPERTY OriginalPOITransactionTimestamp: WideString READ Get_OriginalPOITransactionTimestamp;
		PROPERTY UseBackup: WordBool READ Get_UseBackup WRITE Set_UseBackup;
		PROPERTY LogoutOnTerminate: WordBool READ Get_LogoutOnTerminate WRITE Set_LogoutOnTerminate;
		PROPERTY Reversal: INexoReversal READ Get_Reversal;
		PROPERTY Reconciliation: INexoReconciliation READ Get_Reconciliation;
		PROPERTY Abort: INexoAbort READ Get_Abort;
		PROPERTY ReconciliationID: WideString READ Get_ReconciliationID WRITE Set_ReconciliationID;
		PROPERTY ReconciliationAcquirerID: WideString READ Get_ReconciliationAcquirerID WRITE Set_ReconciliationAcquirerID;
		PROPERTY ReconciliationType: ReconciliationTypeEnumeration READ Get_ReconciliationType WRITE Set_ReconciliationType;
		PROPERTY AbortReason: WideString READ Get_AbortReason WRITE Set_AbortReason;
		PROPERTY AbortMessageCategory: MessageCategoryEnumeration READ Get_AbortMessageCategory WRITE Set_AbortMessageCategory;
		PROPERTY AbortServiceID: WideString READ Get_AbortServiceID WRITE Set_AbortServiceID;
	END;

	// *********************************************************************//
	// DispIntf :    _NEXOSALEDisp
	// Indicateurs : (4416) Dual OleAutomation Dispatchable
	// GUID :        {24B500EF-FCF4-4438-9541-2EEB99BEF014}
	// *********************************************************************//
	_NEXOSALEDisp = DISPINTERFACE
		['{24B500EF-FCF4-4438-9541-2EEB99BEF014}']
		PROPERTY IsLogged: WordBool READONLY dispid 1;
		PROPERTY Amount: LongWord DISPID 2;
		PROPERTY TransactionID: WideString DISPID 3;
		PROPERTY TransactionTimestamp: WideString DISPID 4;
		PROPERTY MainWindow: Integer DISPID 6;
		PROPERTY Settings: _Settings DISPID 7;
		PROPERTY SaleID: WideString DISPID 8;
		PROPERTY POIID: WideString DISPID 9;
		PROPERTY Login: INexoLogin READONLY dispid 10;
		PROPERTY Payment: INexoFinancial READONLY dispid 11;
		PROPERTY Refund: INexoFinancial READONLY dispid 12;
		PROPERTY Logout: INexoLogout READONLY dispid 13;
		PROPERTY NexoClient: INexoRetailerClient READONLY dispid 14;
		PROPERTY Connected: WordBool READONLY dispid 15;
		PROPERTY Success: WordBool READONLY dispid 16;
		PROPERTY POITransactionID: WideString READONLY dispid 17;
		PROPERTY POITransactionTimestamp: WideString READONLY dispid 18;
		PROPERTY OriginalPOITransactionID: WideString READONLY dispid 19;
		PROPERTY OriginalPOITransactionTimestamp: WideString READONLY dispid 20;
		PROPERTY UseBackup: WordBool DISPID 21;
		PROPERTY LogoutOnTerminate: WordBool DISPID 22;
		PROPERTY Reversal: INexoReversal READONLY dispid 23;
		PROPERTY Reconciliation: INexoReconciliation READONLY dispid 24;
		PROPERTY Abort: INexoAbort READONLY dispid 25;
		PROPERTY ReconciliationID: WideString DISPID 26;
		PROPERTY ReconciliationAcquirerID: WideString DISPID 27;
		PROPERTY ReconciliationType: ReconciliationTypeEnumeration DISPID 28;
		PROPERTY AbortReason: WideString DISPID 29;
		PROPERTY AbortMessageCategory: MessageCategoryEnumeration DISPID 30;
		PROPERTY AbortServiceID: WideString DISPID 31;
		PROCEDURE DisplaySettings(useAdvancedSettings: WordBool); DISPID 100;
		FUNCTION DisplayProcessing(theAction: Action): ActionResult; DISPID 101;
		FUNCTION Connect: WordBool; DISPID 200;
		PROCEDURE Disconnect; DISPID 201;
		FUNCTION SettingsFileName: WideString; DISPID 500;
	END;

	// *********************************************************************//
	// Interface :   _POISettings
	// Indicateurs : (4416) Dual OleAutomation Dispatchable
	// GUID :        {78192CA7-AD36-408B-B822-A2FDAA6FA65C}
	// *********************************************************************//
	_POISettings = INTERFACE(IDispatch)
		['{78192CA7-AD36-408B-B822-A2FDAA6FA65C}']
		FUNCTION Get_ServerIP: WideString; SAFECALL;
		PROCEDURE Set_ServerIP(CONST pRetVal: WideString); SAFECALL;
		FUNCTION Get_ServerPort: TDecimal; SAFECALL;
		PROCEDURE Set_ServerPort(pRetVal: TDecimal); SAFECALL;
		FUNCTION Get_PrintReceipt: WordBool; SAFECALL;
		PROCEDURE Set_PrintReceipt(pRetVal: WordBool); SAFECALL;
		FUNCTION Get_Synchronous: WordBool; SAFECALL;
		PROCEDURE Set_Synchronous(pRetVal: WordBool); SAFECALL;
		FUNCTION Get_SupportsCancel: WordBool; SAFECALL;
		PROCEDURE Set_SupportsCancel(pRetVal: WordBool); SAFECALL;
		FUNCTION Get_SupportsAbort: WordBool; SAFECALL;
		PROCEDURE Set_SupportsAbort(pRetVal: WordBool); SAFECALL;
		FUNCTION Get_SupportsRefund: WordBool; SAFECALL;
		PROCEDURE Set_SupportsRefund(pRetVal: WordBool); SAFECALL;
		FUNCTION Get_SupportsReconciliation: WordBool; SAFECALL;
		PROCEDURE Set_SupportsReconciliation(pRetVal: WordBool); SAFECALL;
		FUNCTION Get_SupportsCheck: WordBool; SAFECALL;
		PROCEDURE Set_SupportsCheck(pRetVal: WordBool); SAFECALL;
		FUNCTION Get_SupportsReversal: WordBool; SAFECALL;
		PROCEDURE Set_SupportsReversal(pRetVal: WordBool); SAFECALL;
		FUNCTION Get_GeneralTimer: Integer; SAFECALL;
		PROCEDURE Set_GeneralTimer(pRetVal: Integer); SAFECALL;
		FUNCTION Get_PaymentTimer: Integer; SAFECALL;
		PROCEDURE Set_PaymentTimer(pRetVal: Integer); SAFECALL;
		FUNCTION Get_CheckTimer: Integer; SAFECALL;
		PROCEDURE Set_CheckTimer(pRetVal: Integer); SAFECALL;
		PROPERTY ServerIP: WideString READ Get_ServerIP WRITE Set_ServerIP;
		PROPERTY ServerPort: TDecimal READ Get_ServerPort WRITE Set_ServerPort;
		PROPERTY PrintReceipt: WordBool READ Get_PrintReceipt WRITE Set_PrintReceipt;
		PROPERTY Synchronous: WordBool READ Get_Synchronous WRITE Set_Synchronous;
		PROPERTY SupportsCancel: WordBool READ Get_SupportsCancel WRITE Set_SupportsCancel;
		PROPERTY SupportsAbort: WordBool READ Get_SupportsAbort WRITE Set_SupportsAbort;
		PROPERTY SupportsRefund: WordBool READ Get_SupportsRefund WRITE Set_SupportsRefund;
		PROPERTY SupportsReconciliation: WordBool READ Get_SupportsReconciliation WRITE Set_SupportsReconciliation;
		PROPERTY SupportsCheck: WordBool READ Get_SupportsCheck WRITE Set_SupportsCheck;
		PROPERTY SupportsReversal: WordBool READ Get_SupportsReversal WRITE Set_SupportsReversal;
		PROPERTY GeneralTimer: Integer READ Get_GeneralTimer WRITE Set_GeneralTimer;
		PROPERTY PaymentTimer: Integer READ Get_PaymentTimer WRITE Set_PaymentTimer;
		PROPERTY CheckTimer: Integer READ Get_CheckTimer WRITE Set_CheckTimer;
	END;

	// *********************************************************************//
	// DispIntf :    _POISettingsDisp
	// Indicateurs : (4416) Dual OleAutomation Dispatchable
	// GUID :        {78192CA7-AD36-408B-B822-A2FDAA6FA65C}
	// *********************************************************************//
	_POISettingsDisp = DISPINTERFACE
		['{78192CA7-AD36-408B-B822-A2FDAA6FA65C}']
		PROPERTY ServerIP: WideString DISPID 1;
		PROPERTY ServerPort: { NOT_OLEAUTO(TDecimal) }OleVariant DISPID 2;
		PROPERTY PrintReceipt: WordBool DISPID 10;
		PROPERTY Synchronous: WordBool DISPID 20;
		PROPERTY SupportsCancel: WordBool DISPID 30;
		PROPERTY SupportsAbort: WordBool DISPID 31;
		PROPERTY SupportsRefund: WordBool DISPID 32;
		PROPERTY SupportsReconciliation: WordBool DISPID 33;
		PROPERTY SupportsCheck: WordBool DISPID 34;
		PROPERTY SupportsReversal: WordBool DISPID 35;
		PROPERTY GeneralTimer: Integer DISPID 50;
		PROPERTY PaymentTimer: Integer DISPID 51;
		PROPERTY CheckTimer: Integer DISPID 52;
	END;

	// *********************************************************************//
	// Interface :   _Settings
	// Indicateurs : (4416) Dual OleAutomation Dispatchable
	// GUID :        {56D0D286-89A1-403D-A3CD-F73F2173D7AB}
	// *********************************************************************//
	_Settings = INTERFACE(IDispatch)
		['{56D0D286-89A1-403D-A3CD-F73F2173D7AB}']
		FUNCTION Get_SaleID: WideString; SAFECALL;
		PROCEDURE Set_SaleID(CONST pRetVal: WideString); SAFECALL;
		FUNCTION Get_SaleIDUseIP: WordBool; SAFECALL;
		PROCEDURE Set_SaleIDUseIP(pRetVal: WordBool); SAFECALL;
		FUNCTION Get_POIID: WideString; SAFECALL;
		PROCEDURE Set_POIID(CONST pRetVal: WideString); SAFECALL;
		FUNCTION Get_POIIDUseIP: WordBool; SAFECALL;
		PROCEDURE Set_POIIDUseIP(pRetVal: WordBool); SAFECALL;
		FUNCTION Get_ApplicationName: WideString; SAFECALL;
		PROCEDURE Set_ApplicationName(CONST pRetVal: WideString); SAFECALL;
		FUNCTION Get_ManufacturerName: WideString; SAFECALL;
		PROCEDURE Set_ManufacturerName(CONST pRetVal: WideString); SAFECALL;
		FUNCTION Get_SoftwareVersion: WideString; SAFECALL;
		PROCEDURE Set_SoftwareVersion(CONST pRetVal: WideString); SAFECALL;
		FUNCTION Get_CertificationCode: WideString; SAFECALL;
		PROCEDURE Set_CertificationCode(CONST pRetVal: WideString); SAFECALL;
		FUNCTION Get_Currency: WideString; SAFECALL;
		PROCEDURE Set_Currency(CONST pRetVal: WideString); SAFECALL;
		FUNCTION Get_Decimals: LongWord; SAFECALL;
		PROCEDURE Set_Decimals(pRetVal: LongWord); SAFECALL;
		FUNCTION Get_SettingsFileName: WideString; SAFECALL;
		PROCEDURE Set_SettingsFileName(CONST pRetVal: WideString); SAFECALL;
		FUNCTION Get_LogFileName: WideString; SAFECALL;
		PROCEDURE Set_LogFileName(CONST pRetVal: WideString); SAFECALL;
		FUNCTION Get_Autoclose: WordBool; SAFECALL;
		PROCEDURE Set_Autoclose(pRetVal: WordBool); SAFECALL;
		FUNCTION Get_AutocloseDelay: LongWord; SAFECALL;
		PROCEDURE Set_AutocloseDelay(pRetVal: LongWord); SAFECALL;
		FUNCTION Get_Primary: _POISettings; SAFECALL;
		PROCEDURE _Set_Primary(CONST pRetVal: _POISettings); SAFECALL;
		FUNCTION Get_Backup: _POISettings; SAFECALL;
		PROCEDURE _Set_Backup(CONST pRetVal: _POISettings); SAFECALL;
		FUNCTION Get_AdminCode: WideString; SAFECALL;
		PROCEDURE Set_AdminCode(CONST pRetVal: WideString); SAFECALL;
		FUNCTION Get_UseDate: WordBool; SAFECALL;
		PROCEDURE Set_UseDate(pRetVal: WordBool); SAFECALL;
		FUNCTION RegistryEntry: WideString; SAFECALL;
		FUNCTION RegistryKeySettingsFileName: WideString; SAFECALL;
		FUNCTION DefaultSettingsFileName: WideString; SAFECALL;
		FUNCTION DefaultSettingsFolder: WideString; SAFECALL;
		PROPERTY SaleID: WideString READ Get_SaleID WRITE Set_SaleID;
		PROPERTY SaleIDUseIP: WordBool READ Get_SaleIDUseIP WRITE Set_SaleIDUseIP;
		PROPERTY POIID: WideString READ Get_POIID WRITE Set_POIID;
		PROPERTY POIIDUseIP: WordBool READ Get_POIIDUseIP WRITE Set_POIIDUseIP;
		PROPERTY ApplicationName: WideString READ Get_ApplicationName WRITE Set_ApplicationName;
		PROPERTY ManufacturerName: WideString READ Get_ManufacturerName WRITE Set_ManufacturerName;
		PROPERTY SoftwareVersion: WideString READ Get_SoftwareVersion WRITE Set_SoftwareVersion;
		PROPERTY CertificationCode: WideString READ Get_CertificationCode WRITE Set_CertificationCode;
		PROPERTY Currency: WideString READ Get_Currency WRITE Set_Currency;
		PROPERTY Decimals: LongWord READ Get_Decimals WRITE Set_Decimals;
		PROPERTY SettingsFileName: WideString READ Get_SettingsFileName WRITE Set_SettingsFileName;
		PROPERTY LogFileName: WideString READ Get_LogFileName WRITE Set_LogFileName;
		PROPERTY Autoclose: WordBool READ Get_Autoclose WRITE Set_Autoclose;
		PROPERTY AutocloseDelay: LongWord READ Get_AutocloseDelay WRITE Set_AutocloseDelay;
		PROPERTY Primary: _POISettings READ Get_Primary WRITE _Set_Primary;
		PROPERTY Backup: _POISettings READ Get_Backup WRITE _Set_Backup;
		PROPERTY AdminCode: WideString READ Get_AdminCode WRITE Set_AdminCode;
		PROPERTY UseDate: WordBool READ Get_UseDate WRITE Set_UseDate;
	END;

	// *********************************************************************//
	// DispIntf :    _SettingsDisp
	// Indicateurs : (4416) Dual OleAutomation Dispatchable
	// GUID :        {56D0D286-89A1-403D-A3CD-F73F2173D7AB}
	// *********************************************************************//
	_SettingsDisp = DISPINTERFACE
		['{56D0D286-89A1-403D-A3CD-F73F2173D7AB}']
		PROPERTY SaleID: WideString DISPID 1;
		PROPERTY SaleIDUseIP: WordBool DISPID 2;
		PROPERTY POIID: WideString DISPID 3;
		PROPERTY POIIDUseIP: WordBool DISPID 4;
		PROPERTY ApplicationName: WideString DISPID 10;
		PROPERTY ManufacturerName: WideString DISPID 11;
		PROPERTY SoftwareVersion: WideString DISPID 12;
		PROPERTY CertificationCode: WideString DISPID 13;
		PROPERTY Currency: WideString DISPID 20;
		PROPERTY Decimals: LongWord DISPID 21;
		PROPERTY SettingsFileName: WideString DISPID 30;
		PROPERTY LogFileName: WideString DISPID 31;
		PROPERTY Autoclose: WordBool DISPID 50;
		PROPERTY AutocloseDelay: LongWord DISPID 51;
		PROPERTY Primary: _POISettings DISPID 60;
		PROPERTY Backup: _POISettings DISPID 61;
		PROPERTY AdminCode: WideString DISPID 65;
		PROPERTY UseDate: WordBool DISPID 66;
		FUNCTION RegistryEntry: WideString; DISPID 500;
		FUNCTION RegistryKeySettingsFileName: WideString; DISPID 501;
		FUNCTION DefaultSettingsFileName: WideString; DISPID 502;
		FUNCTION DefaultSettingsFolder: WideString; DISPID 503;
	END;

	// *********************************************************************//
	// Interface :   _NexoOperation
	// Indicateurs : (4432) Hidden Dual OleAutomation Dispatchable
	// GUID :        {984CF177-D8A1-3AD7-8B13-2C31985D17BF}
	// *********************************************************************//
	_NexoOperation = INTERFACE(IDispatch)
		['{984CF177-D8A1-3AD7-8B13-2C31985D17BF}']
	END;

	// *********************************************************************//
	// DispIntf :    _NexoOperationDisp
	// Indicateurs : (4432) Hidden Dual OleAutomation Dispatchable
	// GUID :        {984CF177-D8A1-3AD7-8B13-2C31985D17BF}
	// *********************************************************************//
	_NexoOperationDisp = DISPINTERFACE
		['{984CF177-D8A1-3AD7-8B13-2C31985D17BF}']
	END;

	// *********************************************************************//
	// La classe CoCurrency fournit une méthode Create et CreateRemote pour
	// créer des instances de l'interface par défaut _Currency exposée
	// par la CoClasse Currency. Les fonctions sont destinées à être utilisées par
	// les clients désirant automatiser les objets CoClasse exposés par
	// le serveur de cette bibliothèque de types.
	// *********************************************************************//
	CoCurrency = CLASS
		CLASS FUNCTION Create: _Currency;
		CLASS FUNCTION CreateRemote(CONST MachineName: STRING): _Currency;
	END;

	// *********************************************************************//
	// La classe CoNEXOSALE fournit une méthode Create et CreateRemote pour
	// créer des instances de l'interface par défaut _NEXOSALE exposée
	// par la CoClasse NEXOSALE. Les fonctions sont destinées à être utilisées par
	// les clients désirant automatiser les objets CoClasse exposés par
	// le serveur de cette bibliothèque de types.
	// *********************************************************************//
	CoNEXOSALE = CLASS
		CLASS FUNCTION Create: _NEXOSALE;
		CLASS FUNCTION CreateRemote(CONST MachineName: STRING): _NEXOSALE;
	END;

	// *********************************************************************//
	// La classe CoPOISettings fournit une méthode Create et CreateRemote pour
	// créer des instances de l'interface par défaut _POISettings exposée
	// par la CoClasse POISettings. Les fonctions sont destinées à être utilisées par
	// les clients désirant automatiser les objets CoClasse exposés par
	// le serveur de cette bibliothèque de types.
	// *********************************************************************//
	CoPOISettings = CLASS
		CLASS FUNCTION Create: _POISettings;
		CLASS FUNCTION CreateRemote(CONST MachineName: STRING): _POISettings;
	END;

	// *********************************************************************//
	// La classe CoSettings fournit une méthode Create et CreateRemote pour
	// créer des instances de l'interface par défaut _Settings exposée
	// par la CoClasse Settings. Les fonctions sont destinées à être utilisées par
	// les clients désirant automatiser les objets CoClasse exposés par
	// le serveur de cette bibliothèque de types.
	// *********************************************************************//
	CoSettings = CLASS
		CLASS FUNCTION Create: _Settings;
		CLASS FUNCTION CreateRemote(CONST MachineName: STRING): _Settings;
	END;

	// *********************************************************************//
	// La classe CoConfirmCancel fournit une méthode Create et CreateRemote pour
	// créer des instances de l'interface par défaut _ConfirmCancel exposée
	// par la CoClasse ConfirmCancel. Les fonctions sont destinées à être utilisées par
	// les clients désirant automatiser les objets CoClasse exposés par
	// le serveur de cette bibliothèque de types.
	// *********************************************************************//
	CoConfirmCancel = CLASS
		CLASS FUNCTION Create: _ConfirmCancel;
		CLASS FUNCTION CreateRemote(CONST MachineName: STRING): _ConfirmCancel;
	END;

	// *********************************************************************//
	// La classe CoFProcessing fournit une méthode Create et CreateRemote pour
	// créer des instances de l'interface par défaut _FProcessing exposée
	// par la CoClasse FProcessing. Les fonctions sont destinées à être utilisées par
	// les clients désirant automatiser les objets CoClasse exposés par
	// le serveur de cette bibliothèque de types.
	// *********************************************************************//
	CoFProcessing = CLASS
		CLASS FUNCTION Create: _FProcessing;
		CLASS FUNCTION CreateRemote(CONST MachineName: STRING): _FProcessing;
	END;

	// *********************************************************************//
	// La classe CoFSettings fournit une méthode Create et CreateRemote pour
	// créer des instances de l'interface par défaut _FSettings exposée
	// par la CoClasse FSettings. Les fonctions sont destinées à être utilisées par
	// les clients désirant automatiser les objets CoClasse exposés par
	// le serveur de cette bibliothèque de types.
	// *********************************************************************//
	CoFSettings = CLASS
		CLASS FUNCTION Create: _FSettings;
		CLASS FUNCTION CreateRemote(CONST MachineName: STRING): _FSettings;
	END;

	// *********************************************************************//
	// La classe CoFWait fournit une méthode Create et CreateRemote pour
	// créer des instances de l'interface par défaut _FWait exposée
	// par la CoClasse FWait. Les fonctions sont destinées à être utilisées par
	// les clients désirant automatiser les objets CoClasse exposés par
	// le serveur de cette bibliothèque de types.
	// *********************************************************************//
	CoFWait = CLASS
		CLASS FUNCTION Create: _FWait;
		CLASS FUNCTION CreateRemote(CONST MachineName: STRING): _FWait;
	END;

	// *********************************************************************//
	// La classe CoNexoOperation fournit une méthode Create et CreateRemote pour
	// créer des instances de l'interface par défaut _NexoOperation exposée
	// par la CoClasse NexoOperation. Les fonctions sont destinées à être utilisées par
	// les clients désirant automatiser les objets CoClasse exposés par
	// le serveur de cette bibliothèque de types.
	// *********************************************************************//
	CoNexoOperation = CLASS
		CLASS FUNCTION Create: _NexoOperation;
		CLASS FUNCTION CreateRemote(CONST MachineName: STRING): _NexoOperation;
	END;

IMPLEMENTATION

USES
	System.Win.ComObj;

CLASS FUNCTION CoCurrency.Create: _Currency;
BEGIN
	Result := CreateComObject(CLASS_Currency) AS _Currency;
END;

CLASS FUNCTION CoCurrency.CreateRemote(CONST MachineName: STRING): _Currency;
BEGIN
	Result := CreateRemoteComObject(MachineName, CLASS_Currency) AS _Currency;
END;

CLASS FUNCTION CoNEXOSALE.Create: _NEXOSALE;
BEGIN
	Result := CreateComObject(CLASS_NEXOSALE) AS _NEXOSALE;
END;

CLASS FUNCTION CoNEXOSALE.CreateRemote(CONST MachineName: STRING): _NEXOSALE;
BEGIN
	Result := CreateRemoteComObject(MachineName, CLASS_NEXOSALE) AS _NEXOSALE;
END;

CLASS FUNCTION CoPOISettings.Create: _POISettings;
BEGIN
	Result := CreateComObject(CLASS_POISettings) AS _POISettings;
END;

CLASS FUNCTION CoPOISettings.CreateRemote(CONST MachineName: STRING): _POISettings;
BEGIN
	Result := CreateRemoteComObject(MachineName, CLASS_POISettings) AS _POISettings;
END;

CLASS FUNCTION CoSettings.Create: _Settings;
BEGIN
	Result := CreateComObject(CLASS_Settings) AS _Settings;
END;

CLASS FUNCTION CoSettings.CreateRemote(CONST MachineName: STRING): _Settings;
BEGIN
	Result := CreateRemoteComObject(MachineName, CLASS_Settings) AS _Settings;
END;

CLASS FUNCTION CoConfirmCancel.Create: _ConfirmCancel;
BEGIN
	Result := CreateComObject(CLASS_ConfirmCancel) AS _ConfirmCancel;
END;

CLASS FUNCTION CoConfirmCancel.CreateRemote(CONST MachineName: STRING): _ConfirmCancel;
BEGIN
	Result := CreateRemoteComObject(MachineName, CLASS_ConfirmCancel) AS _ConfirmCancel;
END;

CLASS FUNCTION CoFProcessing.Create: _FProcessing;
BEGIN
	Result := CreateComObject(CLASS_FProcessing) AS _FProcessing;
END;

CLASS FUNCTION CoFProcessing.CreateRemote(CONST MachineName: STRING): _FProcessing;
BEGIN
	Result := CreateRemoteComObject(MachineName, CLASS_FProcessing) AS _FProcessing;
END;

CLASS FUNCTION CoFSettings.Create: _FSettings;
BEGIN
	Result := CreateComObject(CLASS_FSettings) AS _FSettings;
END;

CLASS FUNCTION CoFSettings.CreateRemote(CONST MachineName: STRING): _FSettings;
BEGIN
	Result := CreateRemoteComObject(MachineName, CLASS_FSettings) AS _FSettings;
END;

CLASS FUNCTION CoFWait.Create: _FWait;
BEGIN
	Result := CreateComObject(CLASS_FWait) AS _FWait;
END;

CLASS FUNCTION CoFWait.CreateRemote(CONST MachineName: STRING): _FWait;
BEGIN
	Result := CreateRemoteComObject(MachineName, CLASS_FWait) AS _FWait;
END;

CLASS FUNCTION CoNexoOperation.Create: _NexoOperation;
BEGIN
	Result := CreateComObject(CLASS_NexoOperation) AS _NexoOperation;
END;

CLASS FUNCTION CoNexoOperation.CreateRemote(CONST MachineName: STRING): _NexoOperation;
BEGIN
	Result := CreateRemoteComObject(MachineName, CLASS_NexoOperation) AS _NexoOperation;
END;

END.
