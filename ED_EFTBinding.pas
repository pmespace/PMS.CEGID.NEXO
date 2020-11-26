// USELESS
unit ED_EFTBinding;

interface

uses
	MC_Binding, MC_PluginInterface, Classes;

type
	IMC_BindingHandlerUICallBack = interface(IMC_BindingHandler)
		procedure manageUICallback(aeType: TMC_UICallbackType; const asMessage: wideString);
		function ManageMC_Callback(const asCommand: wideString; out zsAnswer: wideString; out zcError: IMC_Error): TMC_CallbackResult;
	end;

	TED_EFTBindingHandler = class(TMC_BindingHandler, IMC_BindingHandlerUICallBack)
	private
		fcReceiptNature: IMC_BindingComboBoxControl;
		fcCustomerReceipt: IMC_BindingComboBoxControl;
		fcStoreReceipt: IMC_BindingComboBoxControl;

		procedure LoadTemplateType();
	protected
		procedure doOnLoad(const asConnectString: wideString); override;
		function doOnValidating(out zcErr: IMC_Error): boolean; override;
		function doOnValidated: wideString; override;
	end;

	{ TNatureModelesHandler }
type
	TNatureModelesHandler = class(TInterfacedObject, IMC_BindingControlEvents)
	private
		fcHandler: IMC_BindingHandlerUICallBack;
		fcCustomerReceipt: IMC_BindingComboBoxControl;
		fcStoreReceipt: IMC_BindingComboBoxControl;
		procedure DisabledCombo(acCombo: IMC_BindingComboBoxControl);
	public
		constructor create(acHandler: IMC_BindingHandlerUICallBack; acCustomerReceipt, acStoreReceipt: IMC_BindingComboBoxControl);
		procedure dispose; stdcall;

		procedure onEntered(acCtrl: IMC_BindingControl); stdcall;
		procedure onChanged(acCtrl: IMC_BindingControl); stdcall;
		procedure onExited(acCtrl: IMC_BindingControl); stdcall;
		procedure onVisualChanged(acCtrl: IMC_BindingControl; aeProperty: TMC_BindingVisualPropertyChanged); stdcall;

		class procedure LoadCombo(acTT: TStrings; acCombo: IMC_BindingComboBoxControl);
	end;

implementation

uses
	sysutils, NEXOTypes, StrUtils, NEXOLib;

procedure TED_EFTBindingHandler.doOnLoad(const asConnectString: wideString);
begin
	SetControlValue('IDCodePageANSI', asConnectString);
	SetControlValue('Extra', asConnectString);
	SetControlValue('Port', asConnectString);
	SetControlValue('WaitAnswer', asConnectString);

	// To print receipt
	fcCustomerReceipt := Controls.Search('PrinterCustomerReceiptModele') as IMC_BindingComboBoxControl;;
	fcStoreReceipt := Controls.Search('PrinterStoreReceiptModele') as IMC_BindingComboBoxControl;;
	fcReceiptNature := Controls.Search('PrinterReceiptNature') as IMC_BindingComboBoxControl;
	fcReceiptNature.onControlEvents := TNatureModelesHandler.create(self, fcCustomerReceipt, fcStoreReceipt);
	LoadTemplateType();
	SetControlValue('PrinterDeviceNum', asConnectString, '-1');
	SetControlValue('PrinterReceiptNature', asConnectString);
	SetControlValue('PrinterCustomerReceiptModele', asConnectString);
	SetControlValue('PrinterStoreReceiptModele', asConnectString);
end;

function TED_EFTBindingHandler.doOnValidating(out zcErr: IMC_Error): boolean;
var
	lcCtrl: IMC_BindingControl;
begin
	result := FALSE;
	lcCtrl := Controls.Search('Extra');
	if assigned(lcCtrl)
	then begin
		if assigned(lcCtrl.VisualChangesHandler)
		then begin
			if lcCtrl.VisualChangesHandler.value <> 'POS'
			then zcErr := TMC_Error.create(-1, 'Extra value is wrong.', 0)
			else begin
				result := TRUE;
			end;
		end;
	end;

	// To print a receipt
	if fcReceiptNature.VisualChangesHandler.value <> ''
	then begin
		if fcCustomerReceipt.VisualChangesHandler.value = ''
		then begin
			zcErr := TMC_Error.create(-1, 'Receipt template - customer is mandatory', 0)
		end;
	end;
end;

function TED_EFTBindingHandler.doOnValidated: wideString;
begin
	result := GetControlValue('IDCodePageANSI') + GetControlValue('Extra') + GetControlValue('Port') + GetControlValue('WaitAnswer') +
		GetControlValue('PrinterDeviceNum') + GetControlValue('PrinterReceiptNature') + GetControlValue('PrinterCustomerReceiptModele') +
		GetControlValue('PrinterStoreReceiptModele');
end;

procedure TED_EFTBindingHandler.LoadTemplateType();
var
	lsCommand, lsAnswer: wideString;
	lcErr: IMC_Error;
	lcTT: TStringList;
	leResp: TMC_CallbackResult;
begin
	fcReceiptNature.Values.clear;

	lsCommand := mc_Command + '=' + MC_LoadCombo + ';' + MC_LCComboID + '=' + MC_LCReceiptNatureModels + ';';
	leResp := ManageMC_Callback(lsCommand, lsAnswer, lcErr);
	if (leResp = cbrOk)
	then begin
		lcTT := TStringList.create;
		try
			lcTT.Text := StringReplace(lsAnswer, ';', #13 + #10, [rfReplaceAll]);
			TNatureModelesHandler.LoadCombo(lcTT, fcReceiptNature);
		finally
			lcTT.free;
		end;
	end
	else
		if (leResp <= cbrNoAnswer) or (leResp = cbrNo)
		then begin
			fcReceiptNature.VisualChangesHandler.Enabled := FALSE;
			fcCustomerReceipt.VisualChangesHandler.Enabled := FALSE;
			fcStoreReceipt.VisualChangesHandler.Enabled := FALSE;
		end
		else
			if (leResp = cbrError)
			then manageUICallback(ctError, lcErr.message);
end;

{ TNatureModelesHandler }

constructor TNatureModelesHandler.create(acHandler: IMC_BindingHandlerUICallBack; acCustomerReceipt, acStoreReceipt: IMC_BindingComboBoxControl);
begin
	inherited create;

	fcHandler := acHandler;
	fcCustomerReceipt := acCustomerReceipt;
	fcStoreReceipt := acStoreReceipt;
end;

procedure TNatureModelesHandler.DisabledCombo(acCombo: IMC_BindingComboBoxControl);
begin
	if assigned(acCombo) and assigned(acCombo.VisualChangesHandler)
	then begin
		acCombo.VisualChangesHandler.value := '';
		acCombo.VisualChangesHandler.Enabled := FALSE;
	end;
end;

procedure TNatureModelesHandler.dispose;
begin
	fcHandler := nil;
	fcCustomerReceipt := nil;
	fcStoreReceipt := nil;

	inherited;
end;

class procedure TNatureModelesHandler.LoadCombo(acTT: TStrings; acCombo: IMC_BindingComboBoxControl);
var
	liIdx: integer;
	lsSt, lsValue, lsId, lsLabel: wideString;
begin
	if assigned(acCombo)
	then begin
		lsValue := '';
		if assigned(acCombo.VisualChangesHandler)
		then lsValue := acCombo.VisualChangesHandler.value;

		acCombo.Values.beginUpdate;
		try
			acCombo.Values.clear;
			for liIdx := 0 to acTT.count - 1 do begin
				lsSt := acTT[liIdx];
				lsLabel := WideReadToken(lsSt, '=');
				lsId := WideReadToken(lsSt, '=');
				acCombo.Values.add(TMC_BindingListValue.create(lsId, lsLabel));
			end;
		finally
			acCombo.Values.endUpdate;
		end;

		if assigned(acCombo.VisualChangesHandler)
		then begin
			if (Length(lsValue) > 0)
			then acCombo.VisualChangesHandler.value := lsValue;

			if (Length(lsValue) = 0) and (acCombo.Values.count > 0)
			then acCombo.VisualChangesHandler.value := acCombo.Values[0].value;

			acCombo.VisualChangesHandler.Enabled := TRUE;
		end;
	end;
end;

procedure TNatureModelesHandler.onChanged(acCtrl: IMC_BindingControl);
var
	lsCommand, lsAnswer: wideString;
	lcErr: IMC_Error;
	lcTT: TStringList;
	leResp: TMC_CallbackResult;
begin
	if (Length(acCtrl.VisualChangesHandler.value) > 0)
	then begin
		lsCommand := mc_Command + '=' + MC_LoadCombo + ';' + MC_LCComboID + '=' + MC_LCReceiptModels + ';' + MC_LCNature + '=' +
			acCtrl.VisualChangesHandler.value + ';';
		leResp := fcHandler.ManageMC_Callback(lsCommand, lsAnswer, lcErr);
		if (leResp = cbrOk)
		then begin
			lcTT := TStringList.create;
			try
				lcTT.Text := StringReplace(lsAnswer, ';', #13 + #10, [rfReplaceAll]);
				LoadCombo(lcTT, fcCustomerReceipt);
				LoadCombo(lcTT, fcStoreReceipt);
			finally
				lcTT.free;
			end;
		end
		else
			if (leResp = ctError)
			then fcHandler.manageUICallback(ctError, lcErr.message);
	end
	else begin
		DisabledCombo(fcCustomerReceipt);
		DisabledCombo(fcStoreReceipt);
	end;
end;

procedure TNatureModelesHandler.onEntered(acCtrl: IMC_BindingControl);
begin
end;

procedure TNatureModelesHandler.onExited(acCtrl: IMC_BindingControl);
begin
end;

procedure TNatureModelesHandler.onVisualChanged(acCtrl: IMC_BindingControl; aeProperty: TMC_BindingVisualPropertyChanged);
begin
end;

end.
