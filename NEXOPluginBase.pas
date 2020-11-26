unit NEXOPluginBase;

interface

uses
	MC_PluginInterface, NEXOTypes, activeX;

const
	_RESULT    = ' - result: ';
	_BEGIN     = ' - BEGIN';
	_END       = ' - END';
	_ENDRESULT = _END + _RESULT;

type
	TNexoPluginBase = class(TNexoVersionedObjectBase, IMC_PluginBase)
		public
			_FUNCTION: widestring;
		protected
			function CF: widestring; virtual;
			function CFB: widestring; virtual;
			function CFE: widestring; virtual;
			function CFER: widestring; virtual;
			procedure _F(s: widestring);

		private
			fsLangId: widestring;
			fcCallBack: IMC_PluginCallback;
			fcError: IMC_Error;
			feState: TMC_StateDevice;
			fsSendTraceAsUICallback: string;
		protected
			function GetLogClass: widestring; virtual; abstract;
			function doUICallback(aeType: TMC_UICallbackType; acParamsIn: IMC_UICallbackParamsIn; out zcParamOut: IMC_UICallbackResult): TMC_CallbackResult;
			function doMC_Callback(aeDeviceType: TMC_DeviceType; aiDeviceNum: integer; acInput: IStream; out zcAnswer: IStream; out zcErr: IMC_Error)
				: TMC_CallbackResult;
			procedure doAddLog(aeSeverity: TMC_LogSeverity; const asMessage: widestring);
			function doManageLog(aeSeverity: TMC_LogSeverity): TMC_CallbackResult;
			function notError: boolean;
			procedure setState(aeState: TMC_StateDevice);
			function doGetState: TMC_StateDevice;
			function setError(acError: IMC_Error): widestring;
			function get_PluginInformations: IMC_PluginInformations; stdcall;
			function get_State: TMC_StateDevice; stdcall;
			procedure set_Callback(acCallback: IMC_PluginCallback); stdcall;
			function get_CallBack: IMC_PluginCallback; stdcall;
			function doGetPluginInformations: IMC_PluginInformations; virtual; abstract;
			function doGetCapabilities(aiCapability: TMC_Capabilities; const asOptArgs: widestring): widestring; virtual;
			function doConnect(const asConnectString: widestring): boolean; virtual; abstract;
			function doOpen(): boolean; virtual; abstract;
			function doClose(): boolean; virtual; abstract;
			function doDisconnect(): boolean; virtual; abstract;
			function doCheckHealth(const asConnectString: widestring; out zsAnswer: widestring): boolean; virtual; abstract;
			function doInitDevice(): boolean; virtual; abstract;
			function doDirectCommand(const asCommand: widestring; acDataIn: IStream; out zcDataOut: IStream): boolean; virtual; abstract;
		public
			constructor create(const asLangID: widestring); reintroduce; virtual;
			// Comes from IMC_PLuginBase Interface
			function getLastError: IMC_Error; stdcall;
			function clearLastError: IMC_Error; stdcall;
			function getCapabilities(aiCapability: TMC_Capabilities; const asOptArgs: widestring): widestring; stdcall;
			function connect(const asConnectString: widestring): boolean; stdcall;
			function open(): boolean; stdcall;
			function close(): boolean; stdcall;
			function disconnect(): boolean; stdcall;
			function checkHealth(const asConnectString: widestring; out zsAnswer: widestring): boolean; stdcall;
			function InitDevice(): boolean; stdcall;
			function directCommand(const asCommand: widestring; acDataIn: IStream; out zcDataOut: IStream): boolean; stdcall;
			property pluginInformations: IMC_PluginInformations read get_PluginInformations;
			property state: TMC_StateDevice read get_State;
			property callback: IMC_PluginCallback read get_CallBack write set_Callback;
			property LangId: widestring read fsLangId;

		protected
			// EDEL
			procedure AddLog(fTest: boolean; level: integer; szMessage: widestring);
			procedure AddLogInformation(szMessage: widestring);
			procedure AddLogVerbose(szMessage: widestring);
			procedure AddLogWarning(szMessage: widestring);
			procedure AddLogError(szMessage: widestring);
			procedure AddLogX(level: integer; szMessage: widestring);
	end;

implementation

uses
	sysutils, NEXOLib, MC_UICallbackParamsIn;

constructor TNexoPluginBase.create(const asLangID: widestring);
begin
	inherited create('');
	feState := dsOnLine;
	fsLangId := asLangID;
	fsSendTraceAsUICallback := CEGID_STRING_FALSE;
end;

procedure TNexoPluginBase.AddLogError(szMessage: widestring);
begin
	AddLogX(lsError, szMessage);
end;

procedure TNexoPluginBase.AddLogInformation(szMessage: widestring);
begin
	AddLogX(lsInformation, szMessage);
end;

procedure TNexoPluginBase.AddLogVerbose(szMessage: widestring);
begin
	AddLogX(lsVerbose, szMessage);
end;

procedure TNexoPluginBase.AddLogWarning(szMessage: widestring);
begin
	AddLogX(lsWarning, szMessage);
end;

procedure TNexoPluginBase.AddLogX(level: integer; szMessage: widestring);
begin
	AddLog(doManageLog(level) = cbrOk, level, szMessage);
end;

function TNexoPluginBase.CFB: widestring;
begin
	result := CF + _BEGIN;
end;

function TNexoPluginBase.CFE: widestring;
begin
	result := CF + _END;
end;

function TNexoPluginBase.CFER: widestring;
begin
	result := CFE + _RESULT;
end;

function TNexoPluginBase.CF: widestring;
begin
	result := _FUNCTION;
end;

procedure TNexoPluginBase.AddLog(fTest: boolean; level: integer; szMessage: widestring);
begin
	if fTest
	then
		doAddLog(level, szMessage);
end;

function TNexoPluginBase.doUICallback(aeType: TMC_UICallbackType; acParamsIn: IMC_UICallbackParamsIn; out zcParamOut: IMC_UICallbackResult): TMC_CallbackResult;
begin
	_F('TNexoPluginBase.doUICallback');
	AddLog((fsSendTraceAsUICallback = CEGID_STRING_FALSE) and (doManageLog(lsVerbose) = cbrOk), lsVerbose,
		CFB + ' - aeType: ' + inttostr(aeType) + ' - acParamsIn.assigned: ' + booltostr_(assigned(acParamsIn)));

	result := cbrNoAnswer;
	if assigned(callback)
	then
		result := callback.onMC_UICallback((self as IMC_PluginBase), aeType, acParamsIn, zcParamOut);

	AddLog((fsSendTraceAsUICallback = CEGID_STRING_FALSE) and (doManageLog(lsVerbose) = cbrOk), lsVerbose, CFER + inttostr(result) + ' - zcParams.assigned: ' +
			booltostr_(assigned(zcParamOut)));
end;

function TNexoPluginBase.doMC_Callback(aeDeviceType: TMC_DeviceType; aiDeviceNum: integer; acInput: IStream; out zcAnswer: IStream; out zcErr: IMC_Error)
	: TMC_CallbackResult;
begin
	_F('TNexoPluginBase.doMC_Callback');
	AddLogVerbose(CFB + ' aeDeviceType: ' + inttostr(aeDeviceType) + ' - aiDeviceNum: ' + inttostr(aiDeviceNum) + ' - acInput.assigned: ' +
			booltostr_(assigned(acInput)));

	result := cbrNoAnswer;
	if assigned(callback)
	then
		result := callback.onMC_Callback((self as IMC_PluginBase), aeDeviceType, aiDeviceNum, acInput, zcAnswer, zcErr);

	AddLogVerbose(CFER + inttostr(result) + ' - zcanswer.assigned: ' + booltostr_(assigned(zcAnswer)));
end;

procedure TNexoPluginBase.doAddLog(aeSeverity: TMC_LogSeverity; const asMessage: widestring);
var
	lcParamOut: IMC_UICallbackResult;
begin
	if fsSendTraceAsUICallback = CEGID_STRING_TRUE
	then
		doUICallback(ctMessage, TMC_UICallbackPIMessage.create('- TRACE - severity: ' + inttostr(ord(aeSeverity)) + '- ' + DRIVER_NAME_SHORT + ' - class: ' +
					className + ' - ' + asMessage, 0), lcParamOut)
	else
		if assigned(callback)
		then
			callback.onAddLog(aeSeverity, GetLogClass, 'class: ' + className + ' - ' + asMessage);
end;

function TNexoPluginBase.doManageLog(aeSeverity: TMC_LogSeverity): TMC_CallbackResult;
var
	lcParamOut: IMC_UICallbackResult;
begin
	result := cbrNoAnswer;

	// Little tip to redirige all trace to the USER like as UICallback
	if pos(';' + fsSendTraceAsUICallback + ';', ';X;-;?;') = 0
	then
		fsSendTraceAsUICallback := '?';

	if fsSendTraceAsUICallback = '?'
	then
		fsSendTraceAsUICallback :=
			booltostr_(cbrOk = doUICallback(ctAsk, TMC_UICallbackPIMessage.create('Do you want to see ALL data sent to trace tools (log tool) as UICalback?', 0),
				lcParamOut));

	if fsSendTraceAsUICallback = CEGID_STRING_TRUE
	then
		result := cbrOk
	else
		if assigned(callback)
		then
			result := callback.manageLog(aeSeverity);
end;

function TNexoPluginBase.get_PluginInformations: IMC_PluginInformations;
begin
	_F('TNexoPluginBase.get_PluginInformations');
	AddLogVerbose(CFB);

	result := doGetPluginInformations;

	AddLogVerbose(CFER + booltostr_(assigned(result)));
end;

function TNexoPluginBase.get_State: TMC_StateDevice;
begin
	_F('TNexoPluginBase.get_State');
	AddLogVerbose(CFB);
	result := doGetState;
	AddLogVerbose(CFER + inttostr(result));
end;

procedure TNexoPluginBase.setState(aeState: TMC_StateDevice);
begin
	_F('TNexoPluginBase.setState');
	AddLogVerbose(CFB + ' - aeState: ' + inttostr(aeState));

	feState := aeState;

	AddLogVerbose(CFER);
end;

function TNexoPluginBase.notError: boolean;
begin
	result := not assigned(fcError);
end;

function TNexoPluginBase.doGetState: TMC_StateDevice;
begin
	_F('TNexoPluginBase.doGetState');
	AddLogVerbose(CFB);

	result := feState;

	AddLogVerbose(CFER + inttostr(result));
end;

function TNexoPluginBase.setError(acError: IMC_Error): widestring;
begin
	result := '';
	fcError := acError;
	if assigned(fcError)
	then
	begin
		_F('TNexoPluginBase.setError');
		result := CF + ' - Error code: ' + inttostr(fcError.code) + ' - message: ' + fcError.message + ' - extraInfo: ' + inttostr(fcError.extraInfo);
		AddLogError(result);
	end;
end;

procedure TNexoPluginBase.set_Callback(acCallback: IMC_PluginCallback);
begin
	fcCallBack := acCallback;
end;

procedure TNexoPluginBase._F(s: widestring);
begin
	_FUNCTION := s;
end;

function TNexoPluginBase.get_CallBack: IMC_PluginCallback;
begin
	result := fcCallBack;
end;

function TNexoPluginBase.getLastError: IMC_Error;
var
	lcDetailedError: IMC_DetailedError;
begin
	_F('TNexoPluginBase.getLastError');
	AddLogVerbose(CFB);

	result := nil;
	if assigned(fcError)
	then
	begin
		if fcError.QueryInterface(IMC_DetailedError, lcDetailedError) = S_OK
		then
			result := TMC_DetailedError.create(lcDetailedError.code, lcDetailedError.message, lcDetailedError.extraInfo, lcDetailedError.TechnicalMessage,
				lcDetailedError.AdviceMessage, lcDetailedError.Critical)
		else
			result := TMC_Error.create(fcError.code, fcError.message, fcError.extraInfo);
	end;

	AddLogVerbose(CFER + booltostr_(assigned(result)));
end;

function TNexoPluginBase.clearLastError: IMC_Error;
var
	lcErr: IMC_Error;
begin
	if doManageLog(lsVerbose) = cbrOk
	then
	begin
		lcErr := getLastError;
		AddLog(true, lsVerbose, CFB + ' - getLastError.assigned: ' + booltostr_(assigned(lcErr)));
	end;

	result := getLastError;
	setError(nil);

	if doManageLog(lsVerbose) = cbrOk
	then
	begin
		lcErr := getLastError;
		AddLog(true, lsVerbose, CFE + ' - result.assigned: ' + booltostr_(assigned(result)) + ' - getLastError.assigned: ' + booltostr_(assigned(lcErr)));
	end;
end;

function TNexoPluginBase.doGetCapabilities(aiCapability: TMC_Capabilities; const asOptArgs: widestring): widestring;
begin
	_F('TNexoPluginBase.doGetCapabilities');
	AddLogVerbose(CFB + ' - aiCapability: ' + inttostr(ord(aiCapability)) + ' - asOptArgs: ' + asOptArgs);

	result := '';
	case aiCapability of
		caCheckHealthBeforeOpen: result := CEGID_STRING_NO;
		caAlwaysOpen: result := CEGID_STRING_FALSE;
		caManagesStandaloneSettings: result := CEGID_STRING_FALSE;
		caMC_CallbackID: result := CEGID_STRING_FALSE;
		else AddLogError(CF + ' - Capability #' + inttostr(aiCapability) + ' out of index');
	end;

	AddLogVerbose(CFER + result);
end;

function TNexoPluginBase.getCapabilities(aiCapability: TMC_Capabilities; const asOptArgs: widestring): widestring;
begin
	_F('TNexoPluginBase.getCapabilities');
	AddLogVerbose(CFB + ' - aiCapability: ' + inttostr(aiCapability) + ' - asOptArgs: ' + asOptArgs);

	setError(nil);
	result := CEGID_STRING_FALSE;
	if aiCapability > caUnknown
	then
		result := doGetCapabilities(aiCapability, asOptArgs)
	else
		setError(TMC_Error.create(28, 'Capability out of index', 0));

	AddLogVerbose(CFER + result);
end;

function TNexoPluginBase.connect(const asConnectString: widestring): boolean;
begin
	_F('TNexoPluginBase.connect');
	AddLogVerbose(CFB + ' - asConnectString: ' + asConnectString);

	result := doConnect(asConnectString);

	AddLogVerbose(CFER + booltostr_(result));
end;

function TNexoPluginBase.open(): boolean;
begin
	_F('TNexoPluginBase.open');
	AddLogVerbose(CFB);

	result := true; // FALSE;

	AddLogVerbose(CFER + booltostr_(result));
end;

function TNexoPluginBase.close(): boolean;
begin
	_F('TNexoPluginBase.close');
	AddLogVerbose(CFB);

	result := true; // (state = dsOnLine);

	AddLogVerbose(CFER + booltostr_(result));
end;

// procedure TNexoPluginBase._C(s: widestring);
// begin
// _CLASS := s;
// end;

function TNexoPluginBase.disconnect(): boolean;
begin
	_F('TNexoPluginBase.disconnect');
	AddLogVerbose(CFB);

	result := true; // (state in [dsConnect, dsOnLine]);

	AddLogVerbose(CFER + booltostr_(result));
end;

function TNexoPluginBase.checkHealth(const asConnectString: widestring; out zsAnswer: widestring): boolean;
begin
	_F('TNexoPluginBase.checkHealth');
	AddLogVerbose(CFB);

	setError(nil);
	result := doCheckHealth(asConnectString, zsAnswer);

	AddLogVerbose(CFER + booltostr_(result) + ' - zsAnswer: ' + zsAnswer);
end;

function TNexoPluginBase.InitDevice(): boolean;
begin
	_F('TNexoPluginBase.InitDevice');
	AddLogVerbose(CFB);

	result := doInitDevice(); // FALSE;

	AddLogVerbose(CFER + booltostr_(result));
end;

function TNexoPluginBase.directCommand(const asCommand: widestring; acDataIn: IStream; out zcDataOut: IStream): boolean; stdcall;
var
	lcErr: IMC_Error;
begin
	_F('TNexoPluginBase.directCommand');
	AddLogVerbose(CFB + ' - asCommand: ' + asCommand + ' - acDataIn.assigned: ' + booltostr_(assigned(acDataIn)));

	result := False;
	if notError
	then
	begin
		setError(nil);
		if length(asCommand) > 0
		then
			result := doDirectCommand(asCommand, acDataIn, zcDataOut)
		else
			setError(TMC_Error.create(30, 'No command to execute', 0));
	end
	else
	begin
		lcErr := getLastError;
		AddLogWarning(CF + ' - A previous error exists: ' + inttostr(lcErr.code) + ' - message: ' + lcErr.message + ' - extraInfo: ' + inttostr(lcErr.extraInfo));
	end;

	AddLogVerbose(CFER + booltostr_(result) + ' - zcDataOut.assigned: ' + booltostr_(assigned(zcDataOut)));
end;

end.
