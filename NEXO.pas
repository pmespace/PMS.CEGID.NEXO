UNIT NEXO;

INTERFACE

USES
	MC_PluginInterface, MC_PluginCatInterface, NEXOPluginBase, NEXOTypes, activeX, XMLIntf, PMS_NEXOSale_TLB, PMS_NEXO_TLB;

TYPE
	TNexo = CLASS(TNexoPluginBase, IMC_PluginCAT)
		PRIVATE
			myNexo: NEXOSALE;
			fCanPrintDuplicate: boolean;
			// function GetDlgResult(out fPrintReceipt: boolean): TMC_CATResultTransaction;

		PROTECTED
			fePrinterDevice: Integer;
			fcReceiptNature: widestring;
			fcCustomerReceipt: widestring;
			fcStoreReceipt: widestring;

		PROTECTED
			FUNCTION doInitLink: boolean;
			FUNCTION doPrintDuplicate: boolean;
			FUNCTION doInitDeviceCheckHealth: boolean;
			FUNCTION TranslateCommand(aeCommand: TMC_CATCommand): widestring;
			FUNCTION GetLogClass: widestring; OVERRIDE;
			FUNCTION doGetPluginInformations: IMC_PluginInformations; OVERRIDE;
			FUNCTION doGetCapabilities(aiCapability: TMC_Capabilities; CONST asOptArgs: widestring): widestring; OVERRIDE;
			FUNCTION doConnect(CONST asConnectString: widestring): boolean; OVERRIDE;
			FUNCTION doOpen(): boolean; OVERRIDE;
			FUNCTION doClose(): boolean; OVERRIDE;
			FUNCTION doDisconnect(): boolean; OVERRIDE;
			FUNCTION doCheckHealth(CONST asConnectString: widestring; OUT zsAnswer: widestring): boolean; OVERRIDE;
			FUNCTION doInitDevice(): boolean; OVERRIDE;
			FUNCTION doDirectCommand(CONST asCommand: widestring; acDataIn: IStream; OUT zcDataOut: IStream): boolean; OVERRIDE;
			FUNCTION doTransactionReport(): boolean;

			// PROCEDURE PrintTransactionReceipt(request: Action; receipt: PSafeArray; fCustomerReceipt: boolean; fDuplicate: boolean);
			FUNCTION PrintReceipt(acXmlReceipt: IXMLDocument; aeCommand: TMC_CATCommand; aeReportType: TMC_ReportType): TMC_CallbackResult;
			FUNCTION doTransaction(acParamsIn: IMC_CATParamsIn; OUT zcParamsOut: IMC_CATParamsOut): boolean;
			FUNCTION doOpenDay(acParamsIn: IMC_CATParamsIn): boolean;
			FUNCTION doSettlement(acParamsIn: IMC_CATParamsIn): boolean;
		PUBLIC
			// constructor create(const asLangID: widestring); reintroduce; virtual;
			CONSTRUCTOR create(CONST asLangID: widestring; theNexoSaleObject: NEXOSALE); REINTRODUCE; VIRTUAL;
			// Comes from IMC_PluginCAT interface
			FUNCTION command(aeCommand: TMC_CATCommand; acParamsIn: IMC_CATParamsIn; OUT zcParamsOut: IMC_CATParamsOut): boolean; STDCALL;
	END;

IMPLEMENTATION

USES
	sysutils, NEXOLib, MC_UICallbackParamsIn, NEXOCATParamsOut, XMLDoc, Classes, Math;

// TNexo

FUNCTION TNexo.GetLogClass: widestring;
BEGIN
	result := DRIVER_NAME_SHORT;
END;

FUNCTION TNexo.doGetPluginInformations: IMC_PluginInformations;
VAR
	lcVersion: IMC_PLuginVersion;
BEGIN
	lcVersion := TMC_PluginVersion.create(DRIVER_VERSION_MAJOR, DRIVER_VERSION_MINOR, DRIVER_VERSION_RELEASE, DRIVER_VERSION_BUILD);
	result := TMC_PluginInformations.create(dtCAT, DRIVER_NAME_SHORT, DRIVER_COPYRIGHT, lcVersion, DRIVER_NAME_EXTENDED);
END;

FUNCTION TNexo.doInitDevice: boolean;
BEGIN
	_F('TNexo.doInitDevice');
	AddLogVerbose(CFB);

	result := TRUE;

	AddLogVerbose(CFER + booltostr_(result));
END;

FUNCTION TNexo.doInitLink(): boolean;
BEGIN
	_F('TNexo.doInitLink');
	AddLogVerbose(CFB);

	// Do something to initialize the communication
	result := TRUE;

	AddLogVerbose(CFER + booltostr_(result));
END;

FUNCTION TNexo.doInitDeviceCheckHealth: boolean;
BEGIN
	_F('TNexo.doInitDeviceCheckHealth');
	AddLogVerbose(CFB);

	result := myNexo.Connected; // SetSettingsOrValidateMerchant(myNexo, myRegistry, false, false);

	AddLogVerbose(CFER + booltostr_(result));
END;

FUNCTION TNexo.doGetCapabilities(aiCapability: TMC_Capabilities; CONST asOptArgs: widestring): widestring;
BEGIN
	_F('TNexo.doGetCapabilities');
	AddLogVerbose(CFB + ' - aiCapability: ' + inttostr(ord(aiCapability)) + ' - asOptArgs: ' + asOptArgs);

	result := '';
	CASE aiCapability OF
		caCATDuplicataLastOpe: result := CEGID_STRING_TRUE;
		caCATCheckMaintenance: result := CEGID_STRING_FALSE;
		caCATSettlement: result := CEGID_STRING_FALSE;
		caCATCheckCard: result := CEGID_STRING_FALSE;
		caCATManageGiftCard: result := CEGID_STRING_FALSE;
		caCATManageBankCard: result := CEGID_STRING_TRUE; // DO NOT MODIFY OR THE DRIVER WON'T BE USABLE FOR PAYMENTS
		caCATManageCheque: result := CEGID_STRING_FALSE;
		caCATDoInit: result := CEGID_STRING_FALSE;
		caCATInterrupt: result := CEGID_STRING_FALSE;
		caCATOpenDay: result := CEGID_STRING_FALSE;
		caCATTransactionReport: result := '1'; // <<<>>>
		caCATManageGiftCardActivation: result := CEGID_STRING_FALSE;
		caCATManageGiftCardReload: result := CEGID_STRING_FALSE;
		caCATUpdate: result := CEGID_STRING_FALSE;
		caCATManageForcedPurchase: result := CEGID_STRING_FALSE;
		caCATManageForcedVoidPurchase: result := CEGID_STRING_FALSE;
		caCATManageForcedRefund: result := CEGID_STRING_FALSE;
		caCATManageForcedVoidRefund: result := CEGID_STRING_FALSE;
		caCATMustWaitBetween2Transac: result := CEGID_STRING_TRUE;
		caCATManageGiftCardVoidActivation: result := CEGID_STRING_FALSE;
		caCATManageGiftCardVoidReload: result := CEGID_STRING_FALSE;
		caCATManageGiftCardIssue: result := CEGID_STRING_FALSE;
		caCATManageGiftCardVoidIssue: result := CEGID_STRING_FALSE;
		caCATGiftCardShouldReadBalanceBeforePayment: result := CEGID_STRING_FALSE;
		caCATManageGiftCardReturn: result := CEGID_STRING_FALSE;
		caCATManageGiftCardVoidReturn: result := CEGID_STRING_FALSE;
		caCATManageManualCardEntry: result := CEGID_STRING_FALSE;
		caCATManageForcedCheque: result := CEGID_STRING_FALSE;
		caCATGetCardMetaData: result := CEGID_STRING_FALSE;
		caCATCheckCardMetaData: result := CEGID_STRING_FALSE;
		caCATGetTransactionIssuer: result := '';
		ELSE result := INHERITED doGetCapabilities(aiCapability, asOptArgs);
	END;

	AddLogVerbose(CFER + result);
END;

FUNCTION TNexo.doConnect(CONST asConnectString: widestring): boolean;
BEGIN
	_F('TNexo.doConnect');
	AddLogVerbose(CFB + ' - asConnectString: ' + asConnectString);

	fePrinterDevice := StrToIntDef(WideExtractValue(asConnectString, 'PrinterDeviceNum'), -1);
	fcReceiptNature := WideExtractValue(asConnectString, 'PrinterReceiptNature');
	fcCustomerReceipt := WideExtractValue(asConnectString, 'PrintTransactionReceiptModele');
	fcStoreReceipt := WideExtractValue(asConnectString, 'PrinterStoreReceiptModele');

	result := TRUE; // myNexo.Connect(false);

	AddLogVerbose(CFER + booltostr_(result));
END;

FUNCTION TNexo.doDisconnect(): boolean;
BEGIN
	_F('TNexo.doDisconnect');
	AddLogVerbose(CFB);

	// disconnecting from device
	// myNexo.Disconnect();
	result := TRUE;

	AddLogVerbose(CFER + booltostr_(result));
END;

FUNCTION TNexo.doOpen(): boolean;
BEGIN
	_F('TNexo.doOpen');
	AddLogVerbose(CFB);

	// Connecting to device
	result := TRUE;

	AddLogVerbose(CFER + booltostr_(result));
END;

FUNCTION TNexo.doClose(): boolean;
BEGIN
	_F('TNexo.doClose');
	AddLogVerbose(CFB);

	// Closing device
	result := TRUE;

	AddLogVerbose(CFER + booltostr_(result));
END;

FUNCTION TNexo.doOpenDay(acParamsIn: IMC_CATParamsIn): boolean;
BEGIN
	_F('TNexo.doOpenDay');
	AddLogVerbose(CFB + ' - acParamsIn assigned: ' + booltostr_(assigned(acParamsIn)));

	result := TRUE;

	AddLogVerbose(CFER + booltostr_(result));
END;

CONSTRUCTOR TNexo.create(CONST asLangID: widestring; theNexoSaleObject: NEXOSALE);
BEGIN
	INHERITED create(asLangID);
	// _C('TNexo');
	// _C := 'TNexo';
	myNexo := theNexoSaleObject;
END;

FUNCTION TNexo.doCheckHealth(CONST asConnectString: widestring; OUT zsAnswer: widestring): boolean;
BEGIN
	_F('TNexo.doCheckHealth');
	AddLogVerbose(CFB + ' - asConnectString: ' + asConnectString);

	// Do something to check the health of the device
	result := doInitDeviceCheckHealth;

	AddLogVerbose(CFER + booltostr_(result) + ' - zsAnswer: ' + zsAnswer);
END;

FUNCTION TNexo.doDirectCommand(CONST asCommand: widestring; acDataIn: IStream; OUT zcDataOut: IStream): boolean;
BEGIN
	_F('TNexo.doDirectCommand');
	AddLogVerbose(CFB + ' - asCommand: ' + asCommand + ' - acData.assigned: ' + booltostr_(assigned(acDataIn)));

	result := false;
	setError(TMC_Error.create(DRIVER_ERROR_INVALID_COMMAND));

	AddLogVerbose(CFER + booltostr_(result) + ' - zcDataOuta.assigned: ' + booltostr_(assigned(zcDataOut)));
END;

FUNCTION TNexo.TranslateCommand(aeCommand: TMC_CATCommand): widestring;
BEGIN
	result := '*Unknown command*';
	CASE aeCommand OF
		coInitLink: result := 'Initialise Merchant (coInitLinkc)';
		coTransaction: result := 'Perform transaction (coTransaction)';
		coPrintDuplicate: result := 'Print duplicate (coPrintDuplicate)';
		// coCheckForMaintenance: result := 'coCheckForMaintenance';
		// coMaintenance: result := 'coMaintenance';
		// coSettlement: result := 'coSettlement';
		// coCheckCard: result := 'coCheckCard';
		// coGiftCardActivate: result := 'coGiftCardActivate';
		// coGiftCardReload: result := 'coGiftCardReload';
		coTest: result := 'Test connection (coTest)';
		// coOpenDay: result := 'coOpenDay';
		coTransactionsReport: result := 'Transactions report (coTransactionsReport)';
		// coCATUpdate: result := 'coCATUpdate';
		// coGiftCardVoidActivate: result := 'coGiftCardVoidActivate';
		// coGiftCardVoidReload: result := 'coGiftCardVoidReload';
		// coGiftCardIssue: result := 'coGiftCardIssue';
		// coGiftCardVoidIssue: result := 'coGiftCardVoidIssue';
		// coGiftCardReturn: result := 'coGiftCardReturn';
		// coGiftCardVoidReturn: result := 'coGiftCardVoidReturn';
		// coGetCardMetaData: result := 'coGetCardMetaData';
		// coCheckCardMetaData: result := 'coCheckCardMetaData';
	END;
END;

FUNCTION TNexo.command(aeCommand: TMC_CATCommand; acParamsIn: IMC_CATParamsIn; OUT zcParamsOut: IMC_CATParamsOut): boolean;
BEGIN
	_F('TNexo.command');
	AddLogVerbose(CFB + ' - aeCommand: ' + TranslateCommand(aeCommand) + ' - acParamsIn assigned: ' + booltostr_(assigned(acParamsIn)));

	CASE aeCommand OF
		coInitLink: result := doInitLink();
		coTransaction: result := doTransaction(acParamsIn, zcParamsOut);
		coPrintDuplicate: result := doPrintDuplicate();
		coCheckForMaintenance: result := false;
		coMaintenance: result := false;
		coSettlement: result := doSettlement(acParamsIn);
		coCheckCard: result := false;
		coGiftCardActivate: result := false;
		coGiftCardReload: result := false;
		coTest: result := false;
		coOpenDay: result := doOpenDay(acParamsIn);
		coTransactionsReport: result := doTransactionReport();
		coCATUpdate: result := false;
		coGiftCardVoidActivate: result := false;
		coGiftCardVoidReload: result := false;
		coGiftCardIssue: result := false;
		coGiftCardVoidIssue: result := false;
		coGiftCardReturn: result := false;
		coGiftCardVoidReturn: result := false;
		coGetCardMetaData: result := false;
		coCheckCardMetaData: result := false;
		ELSE
			BEGIN
				setError(TMC_Error.create(DRIVER_ERROR_COMMAND_NOT_SUPPORTED));
				result := false;
			END;
	END;

	AddLogVerbose(CFER + booltostr_(result));
END;

FUNCTION TNexo.doTransaction(acParamsIn: IMC_CATParamsIn; OUT zcParamsOut: IMC_CATParamsOut): boolean;
VAR
	leTransactionResult: TMC_CATResultTransaction;
	lsTrace, lsMessage: widestring;
	lcTransac: IMC_CATPOTransac;
	dlgp: Action;
	dlgpres: ActionResult;
	fPrintReceipt: boolean;
	err: TMC_Error;
	verr: Integer;
	modetxt: widestring;
	online, authorised: boolean;
	reslt: STRING;
	processedAmount: double;
	poi: POISettings;
	canProceed: boolean;
	receipt: PSafeArray;
BEGIN
	_F('TNexo.doTransaction');
	AddLogVerbose(CFB + ' - acParamsIn assigned: ' + booltostr_(assigned(acParamsIn)));

	result := TRUE;
	lsTrace := '';
	lsMessage := '';
	lcTransac := NIL;
	leTransactionResult := rtUnknown;

	// process a transaction
	IF assigned(acParamsIn) THEN
	BEGIN
		lsTrace := 'RecordVersion: ' + inttostr(acParamsIn.recordVersion);

		// verify currency, whether it matches the one declared in Nexo retailer
		IF result AND assigned(acParamsIn.currency) THEN
		BEGIN
			lsTrace := lsTrace + #13 + ' currency currency: ' + acParamsIn.currency.currency + ' currencyISOA: ' + acParamsIn.currency.currencyISOA +
			  ' currencyISON: ' + acParamsIn.currency.currencyISON + ' currencyDec: ' + inttostr(acParamsIn.currency.currencyDec);
			AddLogVerbose(cf + ' - ' + lsTrace);

			// check currency against NEXO settings
			IF NOT(myNexo.Settings.currency = acParamsIn.currency.currencyISOA) OR NOT(myNexo.Settings.Decimals = acParamsIn.currency.currencyDec) THEN
			BEGIN
				AddLogWarning(cf + ' - ' + GetErrorDescription(DRIVER_ERROR_CURRENCY_DOES_NOT_MATCH) + ' - Received: ' + acParamsIn.currency.currencyISOA + ' (' +
					  inttostr(acParamsIn.currency.currencyDec) + ')' + ' - Expected (and will be used): ' + myNexo.Settings.currency + ' (' +
					  inttostr(myNexo.Settings.Decimals) + ')');
			END;
		END ELSE BEGIN
			AddLogWarning(cf + ' - ' + GetErrorDescription(DRIVER_ERROR_CURRENCY_IS_MISSING) + ' yet using expected currency: ' + myNexo.Settings.currency + ' (' +
				  inttostr(myNexo.Settings.Decimals) + ')');
		END;

		// start processing transaction
		IF result AND assigned(acParamsIn.Transac) THEN
		BEGIN
			lsTrace := lsTrace + #13 + ' Transac transacType: ' + inttostr(ord(acParamsIn.Transac.transacType)) + ' receiptRef: ' + acParamsIn.Transac.receiptRef +
			  ' receiptNum: ' + acParamsIn.Transac.receiptNum + ' totalAmount: ' + formatFloat('#,##0.00', acParamsIn.Transac.totalAmount) + ' clerk: ' +
			  acParamsIn.Transac.clerk + ' cardType: ' + inttostr(acParamsIn.Transac.cardType) + ' paymentMode: ' + acParamsIn.Transac.paymentMode + ' date: ' +
			  acParamsIn.Transac.date + ' hour: ' + acParamsIn.Transac.hour + ' refundRef: ' + acParamsIn.Transac.refundRef + ' refundAutNum: ' +
			  acParamsIn.Transac.refundAutNum;
			AddLogVerbose(cf + ' - ' + lsTrace);

			dlgp := Action__none;

			// determine which POI to use
			IF (myNexo.UseBackup) THEN
				poi := myNexo.Settings.Backup
			ELSE
				poi := myNexo.Settings.Primary;

			// verify whether transaction is authorised or not
			canProceed := ((acParamsIn.Transac.transacType = ttRefund) AND poi.SupportsRefund)
			{ or  (acParamsIn.Transac.transacType = ttCheque and poi.SupportsCheck)
			 or (acParamsIn.Transac.transacType = ttVoidCheque and poi.SupportsCheck) } OR
			  ((acParamsIn.Transac.transacType = ttVoidPurchase) AND poi.SupportsCancel) OR (acParamsIn.Transac.transacType = ttpurchase);
			IF (canProceed) THEN
			BEGIN
				// start transaction itself
				// set amount as expected
				myNexo.amount := Floor(acParamsIn.Transac.totalAmount * Power(10, myNexo.Settings.Decimals));
				myNexo.TransactionID := acParamsIn.Transac.receiptRef;
				myNexo.TransactionTimestamp := CreateNexoDateTime(acParamsIn);
				myNexo.Login.RequestOperatorID := acParamsIn.Transac.clerk;
				// Positionnement de la référence de transaction par le terminal
				CASE acParamsIn.Transac.transacType OF
					ttpurchase:
						BEGIN
							// Préparation de la requête
							dlgp := Action_payment;
						END;
					ttVoidPurchase:
						BEGIN
							dlgp := Action_reversal;
						END;
					ttRefund:
						BEGIN
							dlgp := Action_refund;
						END
					ELSE
						BEGIN
							dlgp := Action__none;
						END;
				END;
				// Traitement de la requête et du résultat
				IF (Action__none <> dlgp) THEN
				BEGIN
					result := TRUE;
					dlgpres := myNexo.DisplayProcessing(dlgp);
					leTransactionResult := rtRefussed;

					// prepare how to report the transaction
					IF myNexo.Payment.ReplyData.PaymentResult.OnlineFlag THEN
					BEGIN
						modetxt := 'Authorized';
					END ELSE BEGIN
						modetxt := 'Offline';
					END;

					// test transaction result
					CASE dlgpres OF
						ActionResult_success:
							BEGIN
								reslt := 'ACCEPTED';
								processedAmount := myNexo.Payment.ReplyAuthorizedAmount;
								verr := DRIVER_NO_ERROR;
								leTransactionResult := rtAccepted;
							END;
						ELSE
							BEGIN
								leTransactionResult := rtError;
								processedAmount := myNexo.Payment.RequestRequestedAmount;
								CASE dlgpres OF
									ActionResult_decline:
										BEGIN
											reslt := 'DECLINED';
											leTransactionResult := rtRefussed;
											verr := DRIVER_ERROR_TRANSACTION_DECLINED;
										END;
									ActionResult_cancel:
										BEGIN
											reslt := 'CANCELLED BY USER';
											verr := DRIVER_ERROR_TRANSACTION_CANCELLED_BY_USER;
										END;
									ActionResult_timeout:
										BEGIN
											reslt := 'TIMEOUT';
											verr := DRIVER_ERROR_TRANSACTION_TIMEOUT;
										END;
									ActionResult_exception:
										BEGIN
											reslt := 'EXCEPTION';
											verr := DRIVER_ERROR_EXCEPTION;
											result := false;
											setError(TMC_Error.create(verr, inttostr(acParamsIn.Transac.transacType)));
										END
									ELSE
										BEGIN
											reslt := 'UNKNOWN ERROR';
											verr := DRIVER_ERROR_TRANSACTION_UNKNOWN_ERROR;
											leTransactionResult := rtUnknown;
											result := false;
											setError(TMC_Error.create(verr, inttostr(acParamsIn.Transac.transacType)));
										END;
								END;

							END;
					END;

					lcTransac := TNexoCATPOTransac.create(reslt, modetxt, IsString(myNexo.Payment.RequestSaleTransactionID, ''), processedAmount,
						{ acParamsIn.Transac.totalAmount }
						IsString(myNexo.Payment.RequestData.PaymentTransaction.AmountsReq.currency, ''), ckcAppli,
						IsString(myNexo.Payment.ReplyData.PaymentResult.PaymentInstrumentData.CardData.SensitiveCardData.PAN, ''),
						IsString(myNexo.Payment.ReplyData.PaymentResult.PaymentInstrumentData.CardData.SensitiveCardData.ExpiryDate, ''), '',
						IsString(myNexo.Payment.ReplyData.PaymentResult.PaymentAcquirerData.ApprovalCode, ''),
						IsString(myNexo.Payment.ReplyData.PaymentResult.PaymentInstrumentData.CardData.PaymentBrand, ''), '', { asCmc7 }
						dxNotEvaluate, msNo, IsString(myNexo.Payment.ReplyPOITransactionID, ''), 1, NIL, { lcDCC }
						0, '', ckcUnknown);
				END;

				// préparation de l'enregistrement de la transaction
				IF (rtAccepted = leTransactionResult) THEN
				BEGIN
					// Préparation de l'enregistrement en sortie
					zcParamsOut := TNexoCATParamsOut.create(myNexo.SaleID, myNexo.POIID, leTransactionResult, lsMessage, NIL);
					zcParamsOut.transacList.TotalApprovedAmount := lcTransac.approvedAmount;
					zcParamsOut.transacList.add(lcTransac);
				END;

				CASE (dlgp) OF
					Action_payment, Action_refund{ , Action_reversal }:
						BEGIN
							IF (Action_payment = dlgp) THEN
								receipt := myNexo.Payment.ReplyData.PaymentReceipt
							ELSE IF (Action_refund = dlgp) THEN
								receipt := myNexo.Refund.ReplyData.PaymentReceipt
							ELSE
								receipt := myNexo.reversal.ReplyData.PaymentReceipt;
							// print transaction receipt
							// PrintTransactionReceipt(dlgp, receipt, TRUE, false);
							// PrintTransactionReceipt(dlgp, receipt, false, false);
						END;
				END;
			END;
		END ELSE BEGIN
			setError(TMC_Error.create(DRIVER_ERROR_REQUIRED_PARAMSIN_MISSING, ' acParamsIn.Transac'));
			result := false;
		END
	END ELSE BEGIN
		setError(TMC_Error.create(DRIVER_ERROR_REQUIRED_PARAMSIN_MISSING, ' acParamsIn'));
		result := false;
	END;
END;

FUNCTION TNexo.doTransactionReport: boolean;
// var
// opt: sDialogSelect;
BEGIN
	_F('TNexo.doTransactionReport');
	AddLogVerbose(CFB);

	result := false;

	// lsTrace := lsTrace + #13 + ' Init ExecID: ' + acParamsIn.Init.ExecID + ' ExecVersion: ' + acParamsIn.Init.ExecVersion;
	AddLogVerbose(CFER + booltostr_(result));
END;

FUNCTION TNexo.doPrintDuplicate: boolean;
BEGIN
	_F('TNexo.doPrintDuplicate');
	AddLogVerbose(CFB);

	// PrintTransactionReceipt(lastRequest, TRUE, TRUE);
	result := TRUE;

	// lsTrace := lsTrace + #13 + ' Init ExecID: ' + acParamsIn.Init.ExecID + ' ExecVersion: ' + acParamsIn.Init.ExecVersion;
	AddLogVerbose(CFER + booltostr_(result));
END;

FUNCTION TNexo.doSettlement(acParamsIn: IMC_CATParamsIn): boolean;
BEGIN
	_F('TNexo.doSettlement');
	AddLogVerbose(CFB + ' - acParamsIn assigned: ' + booltostr_(assigned(acParamsIn)));

	result := TRUE;

	AddLogVerbose(CFER + booltostr_(result));
END;

FUNCTION TNexo.PrintReceipt(acXmlReceipt: IXMLDocument; aeCommand: TMC_CATCommand; aeReportType: TMC_ReportType): TMC_CallbackResult;
VAR
	lcContext: IMC_CPOSCommandPrintXMLStreamContext;
	lsPrintingLayout: widestring;
	leDeviceNum: Integer;
	lcParamIn: IMC_UICallbackPIMessage;
	lcParamOut: IMC_UICallbackResult;
	leDeviceType: TMC_DeviceType;
	lcError: IMC_Error;
BEGIN
	_F('TNexo.PrintReceipt');
	AddLogVerbose(CFB + ' - aeCommand: ' + inttostr(aeCommand) + ' aePrintMode: ' + inttostr(aeReportType));

	// Display message : Printing in progress
	lcParamIn := TMC_UICallbackPIMessage.create('Printing in progress', -1);
	doUICallback(ctMessage, lcParamIn, lcParamOut);

	// Select the template according on the report type
	CASE aeReportType OF
		pptReportType1:
			BEGIN
				// Customer receipt
				lsPrintingLayout := fcReceiptNature + '|' + fcCustomerReceipt + '|';
				leDeviceNum := fePrinterDevice;
			END;
		pptReportType2:
			BEGIN
				// Merchant receipt
				lsPrintingLayout := fcReceiptNature + '|' + fcStoreReceipt + '|';
				leDeviceNum := fePrinterDevice;
			END;
		ELSE
			BEGIN
				lsPrintingLayout := '';
				leDeviceNum := -1;
			END;
	END;

	aeReportType := pptReportType1;
	lsPrintingLayout := '';
	leDeviceNum := -1;
	leDeviceType := dtCPOS; // dtprinter;

	// Prepare the request
	lcContext := TMC_CPOSCommandPrintXMLStreamContext.create(ccPrintXmlStream{ aeCommandId }, leDeviceType{ aeDeviceType }, leDeviceNum{ aeDeviceNum },
		inttostr(aeCommand){ asOriginalCommand }, aeReportType{ aeReportType }, lsPrintingLayout{ asPrintingLayout }, acXmlReceipt.XML.Text{ asXML });

	// Print the receipt
	result := (get_CallBack AS IMC_PluginCallbackV2).onMC_CPOSCommand((Self AS IMC_PluginBase), // sender
		lcContext, // acContext
		lcError // acErr
	  );

	AddLogVerbose(CFER + inttostr(result));
END;

// PROCEDURE TNexo.PrintTransactionReceipt(request: Action; receipt: PSafeArray; fCustomerReceipt: boolean; fDuplicate: boolean);
// TYPE
// enumAlign = (left, center, right, none);
// VAR
// lcReceiptData: IXMLDocument;
// al: enumAlign;
// Action: widestring;
// buffer: widestring;
// vpMySafeArray: PSafeArray;
// viLow, viHigh, i, j: Integer;
// vsElement: PaymentReceiptType;
// vsElements: ARRAY OF PaymentReceiptType;
//
// PROCEDURE AddLine(S: widestring; al: enumAlign; fBold: boolean; fUnderline: boolean; fDoubleWidth: boolean; fDoubleHeight: boolean);
// VAR
// attr: widestring;
// i: Integer;
// BEGIN
// CASE al OF
// left: attr := '2';
// right: attr := '3';
// center: attr := '4';
// none: attr := '5';
// END;
// IF fBold THEN
// attr := attr + '1'
// ELSE
// attr := attr + '0';
// IF fUnderline THEN
// attr := attr + '1'
// ELSE
// attr := attr + '0';
// IF fDoubleWidth THEN
// i := 1
// ELSE
// i := 0;
// IF fDoubleHeight THEN
// i := i + 2;
// attr := attr + chr(i + ord('0'));
// WITH lcReceiptData.DocumentElement.AddChild('line') DO
// BEGIN
// AddChild('LIBELLE').NodeValue := S;
// AddChild('ATTRIBUT').NodeValue := attr;
// END;
// END;
// PROCEDURE AddEmptyLine;
// BEGIN
// AddLine('', none, false, false, false, false);
// END;
//
// BEGIN
// _F('TNexo.PrintTransactionReceipt');
// AddLogVerbose(CFB + ' - fCustomerReceipt: ' + booltostr_(fCustomerReceipt) + ' - fDuplicate: ' + booltostr_(fDuplicate));
//
// // To print a receipt
// lcReceiptData := TXMLDocument.create(NIL) AS IXMLDocument;
// lcReceiptData.Active := TRUE;
// lcReceiptData.Version := '1.0';
// lcReceiptData.Encoding := 'UTF-8'; // Only UTF-8 encoding accepted
// lcReceiptData.DocumentElement := lcReceiptData.CreateElement('Receipt', ''); // Element name should be Receipt
//
// al := center;
//
// IF fDuplicate THEN
// BEGIN
// AddLine('***** DUPLICATE *****', al, TRUE, TRUE, TRUE, TRUE);
// AddEmptyLine();
// END;
//
// // IF (enumRequest_payByBarcode = request) THEN
// // buffer := uppercase(myNexo.TransactionScheme)
// // ELSE
// // buffer := uppercase(myNexo.SelectedTransaction.transaction_scheme);
// AddLine('>>>>> CARD TRANSACTION <<<<<', al, TRUE, false, false, false);
// AddEmptyLine;
//
// IF fCustomerReceipt THEN
// buffer := 'CUSTOMER'
// ELSE
// buffer := 'MERCHANT';
// buffer := '*** ' + buffer + ' RECEIPT ***';
// AddLine(buffer, al, TRUE, TRUE, TRUE, TRUE);
// AddEmptyLine;
//
// { My Variable is populated, somehow, see how many items are in it }
// SafeArrayGetLBound(vpMySafeArray, 1, viLow);
// SafeArrayGetUBound(vpMySafeArray, 1, viHigh);
// SetLength(vsElements, viHigh - viLow + 1);
// SafeArrayLock(vpMySafeArray);
// TRY
// j := 1;
// { Now that it's locked, I can extract the elements from the array. }
// FOR i := viLow TO viHigh DO
// BEGIN
// SafeArrayGetElement(vpMySafeArray, i, vsElement);
// vsElements[j] := vsElement;
// j := j + 1;
// END;
// FINALLY
// SafeArrayUnlock(vpMySafeArray);
// END;
//
// CASE request OF
// Action_payment: Action := myNexo.TypeToString(enumType_purchase);
// enumRequest_cancel: Action := myNexo.TypeToString(enumType_cancel);
// enumRequest_refund: Action := myNexo.TypeToString(enumType_refund);
// ELSE Action := 'unknown request';
// END;
//
// IF (enumRC_success = myNexo.LastError) OR (enumRC_cancelled = myNexo.LastError) OR (enumRC_Refunded = myNexo.LastError) THEN
// BEGIN
// AddLine('*** ACCEPTED ' + uppercase(Action) + ' ***', al, TRUE, TRUE, TRUE, TRUE);
// END ELSE BEGIN
// AddLine('*** DECLINED ' + uppercase(Action) + ' ***', al, TRUE, TRUE, TRUE, TRUE);
// IF NOT fCustomerReceipt THEN
// AddLine('(' + myNexo.LastErrorDescription + ')', al, false, false, false, false);
// END;
// AddEmptyLine;
//
// al := left;
//
// IF (0 <> myNexo.amount) THEN
// BEGIN
// AddLine('AMOUNT => ' + myNexo.AmountToDisplay(myNexo.amount, myNexo.currencydecimal, myNexo.currency), al, TRUE, false, TRUE, TRUE);
// AddEmptyLine;
// END;
//
// AddLine('DATE => ' + myNexo.convertdatetolocale(myNexo.ReaderDatetime), al, false, false, false, false);
// AddEmptyLine;
//
// // if (enumRequest_payByBarcode = request)
// // then buffer := uppercase(myNexo.TransactionScheme)
// // else buffer := uppercase(myNexo.SelectedTransaction.transaction_scheme);
// // AddLine('WALLET => ' + buffer, al, TRUE, false, false, false);
// // AddEmptyLine;
//
// IF ('' = myNexo.ServerTransactionID) THEN
// buffer := 'NONE'
// ELSE
// buffer := myNexo.ServerTransactionID;
// AddLine('TXN ID => ' + buffer, al, false, false, false, false);
// AddEmptyLine;
//
// AddLine('MERCHANT => ' + myNexo.MerchantNumberAsString, al, false, false, false, false);
// AddEmptyLine;
//
// AddLine('READER ID => ' + myNexo.ReaderIDAsString, al, false, false, false, false);
// AddEmptyLine;
//
// AddLine('READER NUMBER => ' + myNexo.ReaderIDSrv, al, false, false, false, false);
// AddEmptyLine;
//
// AddLine('READER TXN ID', al, false, false, false, false);
// AddLine(myNexo.readertransactionid, al, false, false, false, false);
// AddEmptyLine;
//
// IF '' <> myNexo.MerchantReference THEN
// BEGIN
// AddLine('CEGID Y2 TXN ID', al, false, false, false, false);
// AddLine(myNexo.MerchantReference, al, false, false, false, false);
// END;
//
// PrintReceipt(lcReceiptData, coTransaction, pptReportType1);
//
// AddLogVerbose(CFE);
// END;

END.
