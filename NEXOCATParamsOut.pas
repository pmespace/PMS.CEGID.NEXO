unit NEXOCATParamsOut;

interface

uses
	MC_PluginInterface, MC_PluginCATInterface, NEXOTypes;

type
	TNexoCATParamsOut = class(TNexoVersionedObjectBase, IMC_CATParamsOut)
		private
			fsShopCode: widestring;
			fsTillCode: widestring;
			feTransactionResult: TMC_CATResultTransaction;
			fsMessageTransaction: widestring;
			fcTransacList: IMC_CATPOTransacList;
			fcGiftCard: IMC_CATPOGiftCard;
		protected
			function get_ShopCode: widestring; stdcall;
			function get_TillCode: widestring; stdcall;
			function get_TransactionResult: TMC_CATResultTransaction; stdcall;
			function get_MessageTransaction: widestring; stdcall;
			function get_TransacList: IMC_CATPOTransacList; stdcall;
			function get_GiftCard: IMC_CATPOGiftCard; stdcall;

			procedure AssignFrom(acSource: IMC_Assignable); override;
		public
			constructor create(
				const asShopCode, asTillCode: widestring;
				aeTransactionResult: TMC_CATResultTransaction;
				const asMessageTransaction: widestring;
				acGiftCard: IMC_CATPOGiftCard); reintroduce; overload;

			property shopCode: widestring read get_ShopCode;
			property tillCode: widestring read get_TillCode;
			property transactionResult: TMC_CATResultTransaction read get_TransactionResult;
			property MessageTransaction: widestring read get_MessageTransaction;
			property transacList: IMC_CATPOTransacList read get_TransacList;
			property GiftCard: IMC_CATPOGiftCard read get_GiftCard;
		protected
			function get_RecordVersion: integer; override; stdcall;
			function get_CardMetadata: IMC_CATPOCardMetadata; stdcall;
	end;

	TNexoCATPOTransac = class(TNexoVersionedObjectBase, IMC_CATPOTransac)
		// , IMC_CATPOTransacV2, IMC_CATPOTransacV3, IMC_CATPOTransacV4, IMC_CATPOTransacV5, IMC_CATPOTransacV6)
		private
			fsResultCode: widestring;
			fsapprovedModeTxt: widestring;
			fsApprovedTransactionNumber: widestring;
			ffApprovedAmount: double;
			fsApprovedCurrency: widestring;
			feApprovedCurKind: TMC_CATCurrencyKindCode;
			// fsCardNumber: widestring;
			// fsCardExpirationDate: widestring;
			fsCardOwnerName: widestring;
			fsApprovedAuthNum: widestring;
			fsApprovedPaymentMode: widestring;
			fsCmc7: widestring;
			// feDetaxeStatus: TMC_CATDetaxeStatus;
			// feMustSign: TMC_CATMustSign;
			fsExtraData: widestring;
			fiTermQty: integer;
			// fcDCC: IMC_CATPODCC;
			// ffGiftCardCreditLeft: double;
			// fsCreditLeftCurrency: widestring;
			// feCreditLeftCurKind: TMC_CATCurrencyKindCode;
		protected
			function get_ResultCode: widestring; stdcall;
			function get_approvedModeTxt: widestring; stdcall;
			function get_ApprovedTransactionNumber: widestring; stdcall;
			function get_ApprovedAmount: double; stdcall;
			function get_ApprovedCurrency: widestring; stdcall;
			function get_ApprovedCurKind: TMC_CATCurrencyKindCode; stdcall;
			function get_CardNumber: widestring; stdcall;
			function get_CardExpirationDate: widestring; stdcall;
			function get_CardOwnerName: widestring; stdcall;
			function get_ApprovedAuthNum: widestring; stdcall;
			function get_ApprovedPaymentMode: widestring; stdcall;
			function get_CMC7: widestring; stdcall;
			function get_DetaxeStatus: TMC_CATDetaxeStatus; stdcall;
			function get_DCC: IMC_CATPODCC; stdcall;
			function get_MustSign: TMC_CATMustSign; stdcall;
			function get_ExtraData: widestring; stdcall;
			function get_TermQty: integer; stdcall;
			function get_GiftCardCreditLeft: double; stdcall;
			function get_CreditLeftCurrency: widestring; stdcall;
			function get_CreditLeftCurKind: TMC_CATCurrencyKindCode; stdcall;

			procedure AssignFrom(acSource: IMC_Assignable); override;
		public
			constructor create(
				const asResultCode, asapprovedModeTxt, asApprovedTransactionNumber: widestring;
				afApprovedAmount: double;
				const asApprovedCurrency: widestring;
				aeApprovedCurKind: TMC_CATCurrencyKindCode;
				const asCardNumber, asCardExpirationDate, asCardOwnerName, asApprovedAuthNum, asApprovedPaymentMode, asCmc7: widestring;
				aeDetaxeStatus: TMC_CATDetaxeStatus;
				aeMustSign: TMC_CATMustSign;
				const asExtraData: widestring;
				aiTermQty: integer;
				acDCC: IMC_CATPODCC;
				afGiftCardCreditLeft: double;
				const asCreditLeftCurrency: widestring;
				aeCreditLeftCurKind: TMC_CATCurrencyKindCode); reintroduce; overload;

			property resultCode: widestring read get_ResultCode;
			property approvedModeTxt: widestring read get_approvedModeTxt;
			property approvedTransactionNumber: widestring read get_ApprovedTransactionNumber;
			property approvedAmount: double read get_ApprovedAmount;
			property approvedCurrency: widestring read get_ApprovedCurrency;
			property approvedCurKind: TMC_CATCurrencyKindCode read get_ApprovedCurKind;
			property cardNumber: widestring read get_CardNumber;
			property CardExpirationDate: widestring read get_CardExpirationDate;
			property cardOwnerName: widestring read get_CardOwnerName;
			property ApprovedAuthNum: widestring read get_ApprovedAuthNum;
			property approvedPaymentMode: widestring read get_ApprovedPaymentMode;
			property CMC7: widestring read get_CMC7;
			property DetaxeStatus: TMC_CATDetaxeStatus read get_DetaxeStatus;
			property MustSign: TMC_CATMustSign read get_MustSign;
			property ExtraData: widestring read get_ExtraData;
			property termQty: integer read get_TermQty;
			property DCC: IMC_CATPODCC read get_DCC;
			property GiftCardCreditLeft: double read get_GiftCardCreditLeft;
			property CreditLeftCurrency: widestring read get_CreditLeftCurrency;
			property CreditLeftCurKind: TMC_CATCurrencyKindCode read get_CreditLeftCurKind;

			// protected
			// function get_InstallmentPayment: widestring; stdcall;
			// function get_CardData: IMC_CATPOCardData; stdcall;
			// public
			// property InstallmentPayment: widestring read get_InstallmentPayment;
			// property CardData: IMC_CATPOCardData read get_CardData;
			//
			// protected
			// function get_CardNumberGettingWay: TMC_CATCardNumberGettingWay; stdcall;
			// function get_AuthNumGettingWay: TMC_CATAuthNumGettingWay; stdcall;
			// function get_TransactionToken: widestring; stdcall;
			// public
			// property CardNumberGettingWay: TMC_CATCardNumberGettingWay read get_CardNumberGettingWay;
			// property AuthNumGettingWay: TMC_CATAuthNumGettingWay read get_AuthNumGettingWay;
			// property TransactionToken: widestring read get_TransactionToken;
			//
			// protected
			// function get_GiftCardValidityEndDate: widestring; stdcall;
			// public
			// property GiftCardValidityEndDate: widestring read get_GiftCardValidityEndDate;
			//
			// protected
			// function get_AuthCardType: TMC_CATCardType; stdcall;
			// public
			// property AuthCardType: TMC_CATCardType read get_AuthCardType;
			//
			// protected
			// function get_TerminalPrivateData: widestring; stdcall;
			// public
			// property TerminalPrivateData: widestring read get_TerminalPrivateData;

	end;

	TNexoCATPOTransacList = class(TMC_VersionedListBase, IMC_CATPOTransacList)
		private
			ffTotalApprovedAmount: double;
		protected
			function get_TotalApprovedAmount: double; stdcall;
			procedure set_TotalApprovedAmount(afTotalApprovedAmount: double); stdcall;
			function Get_Item(aiIndex: integer): IMC_CATPOTransac; stdcall;
			procedure Set_Item(
				aiIndex: integer;
				acItem: IMC_CATPOTransac); stdcall;
			function get_Count: integer; reintroduce; stdcall;

			procedure AssignFrom(acSource: IMC_Assignable); override;

		public
			function add(acItem: IMC_CATPOTransac): integer; stdcall;
			function get(aiIndex: integer): IMC_CATPOTransac; stdcall;
			procedure put(
				aiIndex: integer;
				acItem: IMC_CATPOTransac); stdcall;
			procedure clear(); stdcall;
			procedure delete(aiIndex: integer); stdcall;
			function first(): IMC_CATPOTransac; stdcall;
			function indexOf(acItem: IMC_CATPOTransac): integer; stdcall;
			procedure insert(
				aiIndex: integer;
				acItem: IMC_CATPOTransac); stdcall;
			function last(): IMC_CATPOTransac; stdcall;
			procedure remove(acItem: IMC_CATPOTransac); stdcall;

			property Items[index: integer]: IMC_CATPOTransac read Get_Item write Set_Item; default;
			property TotalApprovedAmount: double read get_TotalApprovedAmount write set_TotalApprovedAmount;
	end;

implementation

uses
	sysUtils;

// TNexoCATParamsOut
constructor TNexoCATParamsOut.create(
	const asShopCode, asTillCode: widestring;
	aeTransactionResult: TMC_CATResultTransaction;
	const asMessageTransaction: widestring;
	acGiftCard: IMC_CATPOGiftCard);
begin
	inherited create('');

	fsShopCode := asShopCode;
	fsTillCode := asTillCode;
	feTransactionResult := aeTransactionResult;
	fsMessageTransaction := asMessageTransaction;
	fcTransacList := nil;
	fcGiftCard := nil;
end;

function TNexoCATParamsOut.get_RecordVersion: integer;
begin
	result := 1;
end;

procedure TNexoCATParamsOut.AssignFrom(acSource: IMC_Assignable);
var
	lcSource: IMC_CATParamsOut;
begin
	if acSource.queryInterface(IMC_CATParamsOut, lcSource) = S_OK
	then
	begin
		inherited;
		fsShopCode := lcSource.shopCode;
		fsTillCode := lcSource.tillCode;
		feTransactionResult := lcSource.transactionResult;
		fsMessageTransaction := lcSource.MessageTransaction;
		fcTransacList := nil;
		if assigned(lcSource.transacList)
		then
			transacList.assign(lcSource.transacList);
		fcGiftCard := nil;
	end
	else
		assignError;
end;

function TNexoCATParamsOut.get_ShopCode: widestring;
begin
	result := fsShopCode;
end;

function TNexoCATParamsOut.get_TillCode: widestring;
begin
	result := fsTillCode;
end;

function TNexoCATParamsOut.get_TransactionResult: TMC_CATResultTransaction;
begin
	result := feTransactionResult;
end;

function TNexoCATParamsOut.get_MessageTransaction: widestring;
begin
	result := fsMessageTransaction;
end;

function TNexoCATParamsOut.get_TransacList: IMC_CATPOTransacList;
begin
	if not assigned(fcTransacList)
	then
		fcTransacList := TNexoCATPOTransacList.create;
	result := fcTransacList;
end;

function TNexoCATParamsOut.get_GiftCard: IMC_CATPOGiftCard;
begin
	result := fcGiftCard;
end;

function TNexoCATParamsOut.get_CardMetadata: IMC_CATPOCardMetadata;
begin
	result := nil; // fcCardMetadata;
end;

// TNexoCATPOTransac
constructor TNexoCATPOTransac.create(
	const asResultCode, asapprovedModeTxt, asApprovedTransactionNumber: widestring;
	afApprovedAmount: double;
	const asApprovedCurrency: widestring;
	aeApprovedCurKind: TMC_CATCurrencyKindCode;
	const asCardNumber, asCardExpirationDate, asCardOwnerName, asApprovedAuthNum, asApprovedPaymentMode, asCmc7: widestring;
	aeDetaxeStatus: TMC_CATDetaxeStatus;
	aeMustSign: TMC_CATMustSign;
	const asExtraData: widestring;
	aiTermQty: integer;
	acDCC: IMC_CATPODCC;
	afGiftCardCreditLeft: double;
	const asCreditLeftCurrency: widestring;
	aeCreditLeftCurKind: TMC_CATCurrencyKindCode);
begin
	inherited create('');

	fsResultCode := asResultCode;
	fsapprovedModeTxt := asapprovedModeTxt;
	fsApprovedTransactionNumber := asApprovedTransactionNumber;
	ffApprovedAmount := afApprovedAmount;
	fsApprovedCurrency := asApprovedCurrency;
	feApprovedCurKind := aeApprovedCurKind;
	// fsCardNumber := asCardNumber;
	// fsCardExpirationDate := asCardExpirationDate;
	fsCardOwnerName := asCardOwnerName;
	fsApprovedAuthNum := asApprovedAuthNum;
	fsApprovedPaymentMode := asApprovedPaymentMode;
	fsCmc7 := asCmc7;
	// feDetaxeStatus := aeDetaxeStatus;
	// feMustSign := aeMustSign;
	fsExtraData := asExtraData;
	fiTermQty := aiTermQty;
	// fcDCC := nil;
	// ffGiftCardCreditLeft := afGiftCardCreditLeft;
	// fsCreditLeftCurrency := asCreditLeftCurrency;
	// feCreditLeftCurKind := aeCreditLeftCurKind;
end;

procedure TNexoCATPOTransac.AssignFrom(acSource: IMC_Assignable);
var
	lcSource: IMC_CATPOTransac;
begin
	if acSource.queryInterface(IMC_CATPOTransac, lcSource) = S_OK
	then
	begin
		inherited;
		fsResultCode := lcSource.resultCode;
		fsapprovedModeTxt := lcSource.approvedModeTxt;
		fsApprovedTransactionNumber := lcSource.approvedTransactionNumber;
		ffApprovedAmount := lcSource.approvedAmount;
		fsApprovedCurrency := lcSource.approvedCurrency;
		feApprovedCurKind := lcSource.approvedCurKind;
		// fsCardNumber := lcSource.cardNumber;
		// fsCardExpirationDate := lcSource.CardExpirationDate;
		fsCardOwnerName := lcSource.cardOwnerName;
		fsApprovedAuthNum := lcSource.ApprovedAuthNum;
		fsApprovedPaymentMode := lcSource.approvedPaymentMode;
		fsCmc7 := lcSource.CMC7;
		// feDetaxeStatus := lcSource.DetaxeStatus;
		// feMustSign := lcSource.MustSign;
		fsExtraData := lcSource.ExtraData;
		fiTermQty := lcSource.termQty;
		// fcDCC := nil;
		// ffGiftCardCreditLeft := lcSource.GiftCardCreditLeft;
		// fsCreditLeftCurrency := lcSource.CreditLeftCurrency;
		// feCreditLeftCurKind := lcSource.CreditLeftCurKind;
	end
	else
		assignError;
end;

function TNexoCATPOTransac.get_ResultCode: widestring;
begin
	result := fsResultCode;
end;

function TNexoCATPOTransac.get_approvedModeTxt: widestring;
begin
	result := fsapprovedModeTxt;
end;

function TNexoCATPOTransac.get_ApprovedTransactionNumber: widestring;
begin
	result := fsApprovedTransactionNumber
end;

function TNexoCATPOTransac.get_ApprovedAmount: double;
begin
	result := ffApprovedAmount
end;

function TNexoCATPOTransac.get_ApprovedCurrency: widestring;
begin
	result := fsApprovedCurrency
end;

function TNexoCATPOTransac.get_ApprovedCurKind: TMC_CATCurrencyKindCode;
begin
	result := feApprovedCurKind;
end;

function TNexoCATPOTransac.get_CardNumber: widestring;
begin
	result := ''; // fsCardNumber;
end;

function TNexoCATPOTransac.get_CardExpirationDate: widestring;
begin
	result := ''; // fsCardExpirationDate;
end;

function TNexoCATPOTransac.get_CardOwnerName: widestring;
begin
	result := fsCardOwnerName;
end;

function TNexoCATPOTransac.get_ApprovedAuthNum: widestring;
begin
	result := fsApprovedAuthNum;
end;

function TNexoCATPOTransac.get_ApprovedPaymentMode: widestring;
begin
	result := fsApprovedPaymentMode;
end;

function TNexoCATPOTransac.get_CMC7: widestring;
begin
	result := fsCmc7;
end;

function TNexoCATPOTransac.get_DetaxeStatus: TMC_CATDetaxeStatus;
begin
	result := dxNo; // feDetaxeStatus;
end;

function TNexoCATPOTransac.get_DCC: IMC_CATPODCC;
begin
	result := nil; // fcDCC;
end;

function TNexoCATPOTransac.get_MustSign: TMC_CATMustSign;
begin
	result := msNo; // feMustSign;
end;

function TNexoCATPOTransac.get_ExtraData: widestring;
begin
	result := fsExtraData;
end;

function TNexoCATPOTransac.get_TermQty: integer;
begin
	result := fiTermQty;
end;

function TNexoCATPOTransac.get_GiftCardCreditLeft: double;
begin
	result := 0; // ffGiftCardCreditLeft;
end;

function TNexoCATPOTransac.get_CreditLeftCurrency: widestring;
begin
	result := ''; // fsCreditLeftCurrency;
end;

function TNexoCATPOTransac.get_CreditLeftCurKind: TMC_CATCurrencyKindCode;
begin
	result := ckcISOAlpha; // feCreditLeftCurKind;
end;

// TNexoCATPOTransacList
procedure TNexoCATPOTransacList.AssignFrom(acSource: IMC_Assignable);
var
	lcInfo: IMC_CATPOTransac;
	liIdx: integer;
	lcSource: IMC_CATPOTransacList;
	lcItem: IMC_CATPOTransac;
begin
	clear;
	if acSource.queryInterface(IMC_CATPOTransacList, lcSource) = S_OK
	then
	begin
		TotalApprovedAmount := lcSource.TotalApprovedAmount;
		for liIdx := 0 to lcSource.count - 1 do
		begin
			lcItem := lcSource.Items[liIdx];
			lcInfo := TNexoCATPOTransac.create(
				lcItem.resultCode,
				lcItem.approvedModeTxt,
				lcItem.approvedTransactionNumber,
				lcItem.approvedAmount,
				lcItem.approvedCurrency,
				lcItem.approvedCurKind,
				lcItem.cardNumber,
				lcItem.CardExpirationDate,
				lcItem.cardOwnerName,
				lcItem.ApprovedAuthNum,
				lcItem.approvedPaymentMode,
				lcItem.CMC7,
				lcItem.DetaxeStatus,
				lcItem.MustSign,
				lcItem.ExtraData,
				lcItem.termQty,
				lcItem.DCC,
				lcItem.GiftCardCreditLeft,
				lcItem.CreditLeftCurrency,
				lcItem.CreditLeftCurKind);
			lcInfo.assign(lcSource.Items[liIdx]);
			add(lcInfo);
		end;
	end
	else
		assignError;
end;

function TNexoCATPOTransacList.get_TotalApprovedAmount: double;
begin
	result := ffTotalApprovedAmount;
end;

procedure TNexoCATPOTransacList.set_TotalApprovedAmount(afTotalApprovedAmount: double);
begin
	ffTotalApprovedAmount := afTotalApprovedAmount;
end;

function TNexoCATPOTransacList.Get_Item(aiIndex: integer): IMC_CATPOTransac;
begin
	result := (inherited Items[aiIndex] as IMC_CATPOTransac);
end;

function TNexoCATPOTransacList.get_Count: integer;
begin
	result := inherited getCount;
end;

procedure TNexoCATPOTransacList.Set_Item(
	aiIndex: integer;
	acItem: IMC_CATPOTransac);
begin
	inherited Items[aiIndex] := acItem;
end;

function TNexoCATPOTransacList.add(acItem: IMC_CATPOTransac): integer;
begin
	result := inherited add(acItem);
end;

procedure TNexoCATPOTransacList.remove(acItem: IMC_CATPOTransac);
begin
	inherited remove(acItem);
end;

function TNexoCATPOTransacList.get(aiIndex: integer): IMC_CATPOTransac;
begin
	result := (inherited get(aiIndex) as IMC_CATPOTransac);
end;

procedure TNexoCATPOTransacList.put(
	aiIndex: integer;
	acItem: IMC_CATPOTransac);
begin
	inherited put(aiIndex, acItem);
end;

procedure TNexoCATPOTransacList.clear();
begin
	inherited clear;
end;

procedure TNexoCATPOTransacList.delete(aiIndex: integer);
begin
	inherited delete(aiIndex);
end;

function TNexoCATPOTransacList.first(): IMC_CATPOTransac;
begin
	result := (inherited first() as IMC_CATPOTransac);
end;

function TNexoCATPOTransacList.last(): IMC_CATPOTransac;
begin
	result := (inherited last as IMC_CATPOTransac);
end;

function TNexoCATPOTransacList.indexOf(acItem: IMC_CATPOTransac): integer;
begin
	result := inherited indexOf(acItem);
end;

procedure TNexoCATPOTransacList.insert(
	aiIndex: integer;
	acItem: IMC_CATPOTransac);
begin
	inherited insert(aiIndex, acItem);
end;

end.
