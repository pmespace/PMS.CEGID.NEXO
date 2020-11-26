// USELESS
unit MC_UICallbackParamsIn;

interface

uses
	MC_PluginInterface, NEXOTypes;

// TMC_UICallbackParamsIn
type
	TMC_UICallbackParamsIn = class(TNexoVersionedObjectBase, IMC_UICallbackParamsIn)
	end;

type
	TMC_UICallbackPIMessage = class(TMC_UICallbackParamsIn, IMC_UICallbackPIMessage)
	private
		fsMessage: wideString;
		fiTimeout: integer;
	protected
		function get_Mess: wideString; stdcall;
		function get_TimeOut: integer; stdcall;
	public
		constructor create(const asMess: wideString; aiTimeOut: integer); reintroduce;
		property mess: wideString read get_Mess;
		property timeout: integer read get_TimeOut;
	end;

	TMC_UICallbackPIMove = class(TMC_UICallbackParamsIn, IMC_UICallbackPIMove)
	private
		fsMessage: wideString;
		fbAllowCancel: boolean;
		fiMaxValue: integer;
		fiCurrentValue: integer;
	protected
		function get_Mess: wideString; stdcall;
		function get_AllowCancel: boolean; stdcall;
		function get_MaxValue: integer; stdcall;
		function get_CurrentValue: integer; stdcall;
	public
		constructor create(const asMess: wideString; abAllowCancel: boolean; aiMaxValue, aiCurrentValue: integer); reintroduce;
		property mess: wideString read get_Mess;
		property allowCancel: boolean read get_AllowCancel;
		property maxValue: integer read get_MaxValue;
		property currentValue: integer read get_CurrentValue;
	end;

	TMC_UICallbackPISecurity = class(TMC_UICallbackParamsIn, IMC_UICallbackPISecurity)
	private
		fesECURITYid: TMC_UICBPISecurity;
		fiTimeout: integer;
		feSecurityRequestLevel: TMC_UICBSecurityRequestLevel;
	protected
		function get_SecurityID: TMC_UICBPISecurity; stdcall;
		function get_TimeOut: integer; stdcall;
		function get_SecurityRequestLevel: TMC_UICBSecurityRequestLevel; stdcall;
	public
		constructor create(aeSecurityID: TMC_UICBPISecurity; aiTimeOut: integer; aeSecurityRequestLevel: TMC_UICBSecurityRequestLevel); reintroduce;
		property securitID: TMC_UICBPISecurity read get_SecurityID;
		property timeout: integer read get_TimeOut;
		property SecurityRequestLevel: TMC_UICBSecurityRequestLevel read get_SecurityRequestLevel;
	end;

	TMC_UICallbackPIGetKey = class(TMC_UICallbackParamsIn, IMC_UICallbackPIGetKey)
	private
		feCarAllowed: TMC_UICallbackCarAllowedSet;
		fiTimeout: integer;
		feSecurityRequestLevel: TMC_UICBSecurityRequestLevel;
	protected
		function get_TimeOut: integer; stdcall;
		function get_SecurityRequestLevel: TMC_UICBSecurityRequestLevel; stdcall;
		function get_CarAllowedSet: TMC_UICallbackCarAllowedSet; stdcall;
	public
		constructor create(aiTimeOut: integer; aeSecurityRequestLevel: TMC_UICBSecurityRequestLevel; aeCarAllowed: TMC_UICallbackCarAllowedSet); reintroduce;
		property timeout: integer read get_TimeOut;
		property carAllowedSet: TMC_UICallbackCarAllowedSet read get_CarAllowedSet;
		property SecurityRequestLevel: TMC_UICBSecurityRequestLevel read get_SecurityRequestLevel;
	end;

	TMC_UICallbackPIGetString = class(TMC_UICallbackParamsIn, IMC_UICallbackPIGetString)
	private
		fiAnswerMinLength: integer;
		fiAnswerMaxLength: integer;
		fsMess: wideString;
		fsPasswordChar: widechar;
		fsDefault: wideString;
		fiTimeout: integer;
		feSecurityRequestLevel: TMC_UICBSecurityRequestLevel;
	protected
		function get_AnswerMinLength: integer; stdcall;
		function get_AnswerMaxLength: integer; stdcall;
		function get_Mess: wideString; stdcall;
		function get_PasswordChar: widechar; stdcall;
		function get_Default: wideString; stdcall;
		function get_TimeOut: integer; stdcall;
		function get_SecurityRequestLevel: TMC_UICBSecurityRequestLevel; stdcall;
	public
		constructor create(aiAnswerMinLength, aiAnswerMaxLength: integer; const asMess: wideString; asPasswordChar: widechar; const asDefault: wideString;
			aiTimeOut: integer; aeSecurityRequestLevel: TMC_UICBSecurityRequestLevel); reintroduce;
		property AnswerMinLength: integer read get_AnswerMaxLength;
		property AnswerMaxLength: integer read get_AnswerMaxLength;
		property mess: wideString read get_Mess;
		property passwordChar: widechar read get_PasswordChar;
		property default: wideString read get_Default;
		property timeout: integer read get_TimeOut;
		property SecurityRequestLevel: TMC_UICBSecurityRequestLevel read get_SecurityRequestLevel;
	end;

	TMC_UICallbackPIChoose = class(TMC_UICallbackParamsIn, IMC_UICallbackPIChoose)
	private
		fsMess: wideString;
		fiOptionsCount: integer;
		fsOptionsSep: wideString;
		fsOptions: wideString;
		fsDefault: wideString;
		fiTimeout: integer;
		feSecurityRequestLevel: TMC_UICBSecurityRequestLevel;
	protected
		function get_Mess: wideString; stdcall;
		function get_OptionsCount: integer; stdcall;
		function get_OptionsSep: wideString; stdcall;
		function get_Options: wideString; stdcall;
		function get_Default: wideString; stdcall;
		function get_TimeOut: integer; stdcall;
		function get_SecurityRequestLevel: TMC_UICBSecurityRequestLevel; stdcall;
	public
		constructor create(const asMess: wideString; aiOptionsCount: integer; const asOptionsSep, asOptions, asDefault: wideString; aiTimeOut: integer;
			aeSecurityRequestLevel: TMC_UICBSecurityRequestLevel); reintroduce;
		property mess: wideString read get_Mess;
		property OptionsCount: integer read get_OptionsCount;
		property OptionsSep: wideString read get_OptionsSep;
		property Options: wideString read get_Options;
		property default: wideString read get_Default;
		property timeout: integer read get_TimeOut;
		property SecurityRequestLevel: TMC_UICBSecurityRequestLevel read get_SecurityRequestLevel;
	end;

	TMC_UICallbackPICashDrawerStateChanged = class(TMC_UICallbackParamsIn, IMC_UICallbackPICashDrawerStateChanged)
	private
		fsCashID: wideString;
	protected
		function get_CashDrawerID: wideString; stdcall;
	public
		constructor create(const asCashDrawerID: wideString); reintroduce;
		property CasDrawerID: wideString read get_CashDrawerID;
	end;

	TMC_CPOSCommandPrintXMLStreamContext = class(TMC_UICallbackParamsIn, IMC_CPOSCommandPrintXMLStreamContext)
	private
		feCommandId: TMC_CPOSCommandId;
		feDeviceType: TMC_DeviceType;
		feDeviceNum: integer;
		fsOriginalCommand: wideString;
		feReportType: TMC_ReportType;
		fsPrintingLayout: wideString;
		fsXML: wideString;
	protected
		function GetCommandId: TMC_CPOSCommandId; stdcall;
		function GetDeviceType: TMC_DeviceType; stdcall;
		function GetDeviceNum: integer; stdcall;
		function GetOriginalCommand: wideString; stdcall;
		function GetReportType: TMC_ReportType; stdcall;
		function GetPrintingLayout: wideString; stdcall;
		function GetXml: wideString; stdcall;
		function ToLogString: wideString; stdcall;
	public
		constructor create(const aeCommandId: TMC_CPOSCommandId; const aeDeviceType: TMC_DeviceType; const aeDeviceNum: integer;
			const asOriginalCommand: wideString; const aeReportType: TMC_ReportType; const asPrintingLayout: wideString; const asXML: wideString); reintroduce;
		property CommandId: TMC_CPOSCommandId read GetCommandId;
		property DeviceType: TMC_DeviceType read GetDeviceType;
		property DeviceNum: integer read GetDeviceNum;
		property OriginalCommand: wideString read GetOriginalCommand;
		property ReportType: TMC_ReportType read GetReportType;
		property PrintingLayout: wideString read GetPrintingLayout;
		property Xml: wideString read GetXml;
	end;

implementation

uses
	sysutils;

// TMC_UICallbackPIMessage
constructor TMC_UICallbackPIMessage.create(const asMess: wideString; aiTimeOut: integer);
begin
	inherited create('');

	fsMessage := asMess;
	fiTimeout := aiTimeOut;
end;

function TMC_UICallbackPIMessage.get_Mess: wideString;
begin
	result := fsMessage;
end;

function TMC_UICallbackPIMessage.get_TimeOut: integer;
begin
	result := fiTimeout;
end;

// TMC_UICallbackPIMove
constructor TMC_UICallbackPIMove.create(const asMess: wideString; abAllowCancel: boolean; aiMaxValue, aiCurrentValue: integer);
begin
	inherited create('');

	fsMessage := asMess;
	fbAllowCancel := abAllowCancel;
	fiMaxValue := aiMaxValue;
	fiCurrentValue := aiCurrentValue;
end;

function TMC_UICallbackPIMove.get_Mess: wideString;
begin
	result := fsMessage;
end;

function TMC_UICallbackPIMove.get_AllowCancel: boolean;
begin
	result := fbAllowCancel;
end;

function TMC_UICallbackPIMove.get_MaxValue: integer;
begin
	result := fiMaxValue;
end;

function TMC_UICallbackPIMove.get_CurrentValue: integer;
begin
	result := fiCurrentValue;
end;

// TMC_UICallbackPISecurity
constructor TMC_UICallbackPISecurity.create(aeSecurityID: TMC_UICBPISecurity; aiTimeOut: integer; aeSecurityRequestLevel: TMC_UICBSecurityRequestLevel);
begin
	inherited create('');

	fesECURITYid := aeSecurityID;
	fiTimeout := aiTimeOut;
	feSecurityRequestLevel := aeSecurityRequestLevel;
end;

function TMC_UICallbackPISecurity.get_SecurityID: TMC_UICBPISecurity;
begin
	result := fesECURITYid;
end;

function TMC_UICallbackPISecurity.get_TimeOut: integer;
begin
	result := fiTimeout;
end;

function TMC_UICallbackPISecurity.get_SecurityRequestLevel: TMC_UICBSecurityRequestLevel;
begin
	result := feSecurityRequestLevel;
end;

// TMC_UICallbackPIGetKey
constructor TMC_UICallbackPIGetKey.create(aiTimeOut: integer; aeSecurityRequestLevel: TMC_UICBSecurityRequestLevel; aeCarAllowed: TMC_UICallbackCarAllowedSet);
begin
	inherited create('');

	fiTimeout := aiTimeOut;
	feSecurityRequestLevel := aeSecurityRequestLevel;
	feCarAllowed := aeCarAllowed;
end;

function TMC_UICallbackPIGetKey.get_TimeOut: integer;
begin
	result := fiTimeout;
end;

function TMC_UICallbackPIGetKey.get_SecurityRequestLevel: TMC_UICBSecurityRequestLevel;
begin
	result := feSecurityRequestLevel;
end;

function TMC_UICallbackPIGetKey.get_CarAllowedSet: TMC_UICallbackCarAllowedSet;
begin
	result := feCarAllowed;
end;

// TMC_UICallbackPIGetString
constructor TMC_UICallbackPIGetString.create(aiAnswerMinLength, aiAnswerMaxLength: integer; const asMess: wideString; asPasswordChar: widechar;
	const asDefault: wideString; aiTimeOut: integer; aeSecurityRequestLevel: TMC_UICBSecurityRequestLevel);
begin
	inherited create('');

	fiAnswerMinLength := aiAnswerMinLength;
	fiAnswerMaxLength := aiAnswerMaxLength;
	fsMess := asMess;
	fsPasswordChar := asPasswordChar;
	fsDefault := asDefault;
	fiTimeout := aiTimeOut;
	feSecurityRequestLevel := aeSecurityRequestLevel;
end;

function TMC_UICallbackPIGetString.get_AnswerMinLength: integer;
begin
	result := fiAnswerMinLength;
end;

function TMC_UICallbackPIGetString.get_AnswerMaxLength: integer;
begin
	result := fiAnswerMaxLength;
end;

function TMC_UICallbackPIGetString.get_Mess: wideString;
begin
	result := fsMess;
end;

function TMC_UICallbackPIGetString.get_PasswordChar: widechar;
begin
	result := fsPasswordChar;
end;

function TMC_UICallbackPIGetString.get_Default: wideString;
begin
	result := fsDefault;
end;

function TMC_UICallbackPIGetString.get_TimeOut: integer;
begin
	result := fiTimeout;
end;

function TMC_UICallbackPIGetString.get_SecurityRequestLevel: TMC_UICBSecurityRequestLevel;
begin
	result := feSecurityRequestLevel;
end;

// TMC_UICallbackPIChoose
constructor TMC_UICallbackPIChoose.create(const asMess: wideString; aiOptionsCount: integer; const asOptionsSep, asOptions, asDefault: wideString;
	aiTimeOut: integer; aeSecurityRequestLevel: TMC_UICBSecurityRequestLevel);
begin
	inherited create('');

	fsMess := asMess;
	fiOptionsCount := aiOptionsCount;
	fsOptionsSep := asOptionsSep;
	fsOptions := asOptions;
	fsDefault := asDefault;
	fiTimeout := aiTimeOut;
	feSecurityRequestLevel := aeSecurityRequestLevel;
end;

function TMC_UICallbackPIChoose.get_Mess: wideString;
begin
	result := fsMess;
end;

function TMC_UICallbackPIChoose.get_OptionsCount: integer;
begin
	result := fiOptionsCount;
end;

function TMC_UICallbackPIChoose.get_OptionsSep: wideString;
begin
	result := fsOptionsSep;
end;

function TMC_UICallbackPIChoose.get_Options: wideString;
begin
	result := fsOptions;
end;

function TMC_UICallbackPIChoose.get_Default: wideString;
begin
	result := fsDefault;
end;

function TMC_UICallbackPIChoose.get_TimeOut: integer;
begin
	result := fiTimeout;
end;

function TMC_UICallbackPIChoose.get_SecurityRequestLevel: TMC_UICBSecurityRequestLevel;
begin
	result := feSecurityRequestLevel;
end;

// TMC_UICallbackPICashDrawerStateChanged
constructor TMC_UICallbackPICashDrawerStateChanged.create(const asCashDrawerID: wideString);
begin
	inherited create('');

	fsCashID := asCashDrawerID;
end;

function TMC_UICallbackPICashDrawerStateChanged.get_CashDrawerID: wideString;
begin
	result := fsCashID;
end;

{ TMC_CPOSCommandPrintXMLStreamContext }

constructor TMC_CPOSCommandPrintXMLStreamContext.create(const aeCommandId: TMC_CPOSCommandId; const aeDeviceType: TMC_DeviceType; const aeDeviceNum: integer;
	const asOriginalCommand: wideString; const aeReportType: TMC_ReportType; const asPrintingLayout, asXML: wideString);
begin
	inherited create('');

	feCommandId := aeCommandId;
	feDeviceType := aeDeviceType;
	feDeviceNum := aeDeviceNum;
	fsOriginalCommand := asOriginalCommand;
	feReportType := aeReportType;
	fsPrintingLayout := asPrintingLayout;
	fsXML := asXML;
end;

function TMC_CPOSCommandPrintXMLStreamContext.GetCommandId: TMC_CPOSCommandId;
begin
	result := feCommandId;
end;

function TMC_CPOSCommandPrintXMLStreamContext.GetDeviceNum: integer;
begin
	result := feDeviceNum;
end;

function TMC_CPOSCommandPrintXMLStreamContext.GetDeviceType: TMC_DeviceType;
begin
	result := feDeviceType;
end;

function TMC_CPOSCommandPrintXMLStreamContext.GetOriginalCommand: wideString;
begin
	result := fsOriginalCommand;
end;

function TMC_CPOSCommandPrintXMLStreamContext.GetPrintingLayout: wideString;
begin
	result := fsPrintingLayout;
end;

function TMC_CPOSCommandPrintXMLStreamContext.GetReportType: TMC_ReportType;
begin
	result := feReportType;
end;

function TMC_CPOSCommandPrintXMLStreamContext.GetXml: wideString;
begin
	result := fsXML;
end;

function TMC_CPOSCommandPrintXMLStreamContext.ToLogString: wideString;
begin
	result := '';
end;

end.
