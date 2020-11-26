// const Ok
unit MC_PluginCATInterface;

interface

uses
	MC_pluginInterface;

const
	// TMC_CATCommand
	/// <summary>
	/// Unknown CAT command
	/// </summary>
	/// This is the undefined value for the commands supported by the CAT
	/// <seealso cref="TMC_CATCommand" CAT commands/>
	/// <seealso cref="IMC_PluginCAT.command" CAT management/>
	coUnknown = 0;
	/// <summary>
	/// Command to initiate communications with the CAT
	/// </summary>
	/// This value is used when sending the command to initiate communications with the CAT
	/// <seealso cref="TMC_CATCommand" CAT commands/>
	/// <seealso cref="IMC_PluginCAT.command" CAT management/>
	coInitLink = 1;
	/// <summary>
	/// CAT transaction command
	/// </summary>
	/// This valued is used to send a CAT transaction command
	/// <seealso cref="TMC_CATCommand" CAT commands/>
	/// <seealso cref="IMC_PluginCAT.command" CAT management/>
	coTransaction = 2;
	/// <summary>
	/// CAT duplicate printing command
	/// </summary>
	/// This value is used to send the command to print a duplicate receipt for the last transaction
	/// <seealso cref="TMC_CATCommand" CAT commands/>
	/// <seealso cref="IMC_PluginCAT.command" CAT management/>
	coPrintDuplicate = 3;
	/// <summary>
	/// CAT maintenance check command
	/// </summary>
	/// This value is used to query the CAT as to whether it needs maintenance
	/// <seealso cref="TMC_CATCommand" CAT commands/>
	/// <seealso cref="IMC_PluginCAT.command" CAT management/>
	coCheckForMaintenance = 4;
	/// <summary>
	/// CAT maintenance execution command
	/// </summary>
	/// This value is used to execute maintenance on the CAT
	/// <seealso cref="TMC_CATCommand" CAT commands/>
	/// <seealso cref="IMC_PluginCAT.command" CAT management/>
	coMaintenance = 5;
	/// <summary>
	/// CAT end-of-day settlement command
	/// </summary>
	/// This value is used to send the end-of-day settlement command
	/// <seealso cref="TMC_CATCommand" CAT commands/>
	/// <seealso cref="IMC_PluginCAT.command" CAT management/>
	coSettlement = 6;
	/// <summary>
	/// CAT payment card checking command
	/// </summary>
	/// This values is used to check the payment card.<p>
	/// For instance:<p>
	/// * For a gift card: retrieves the remaining balance
	/// <seealso cref="TMC_CATCommand" CAT commands/>
	/// <seealso cref="IMC_PluginCAT.command" CAT management/>
	coCheckCard = 7;
	/// <summary>
	/// CAT gift card initialization commmand
	/// </summary>
	/// This value is used to initialise gift cards
	/// <seealso cref="TMC_CATCommand" CAT commands/>
	/// <seealso cref="IMC_PluginCAT.command" CAT management/>
	coGiftCardActivate = 8;
	/// <summary>
	/// CAT gift card refilling commmand
	/// </summary>
	/// This value is used to refill gift cards
	/// <seealso cref="TMC_CATCommand" CAT commands/>
	/// <seealso cref="IMC_PluginCAT.command" CAT management/>
	coGiftCardReload = 9;
	/// <summary>
	/// CAT test command
	/// </summary>
	/// This value is used to run tests on the CAT
	/// <seealso cref="TMC_CATCommand" CAT commands/>
	/// <seealso cref="IMC_PluginCAT.command" CAT management/>
	coTest = 10;
	/// <summary>
	/// CAT start-of-day command
	/// </summary>
	/// This value is used to initiate the start-of-day process
	/// <seealso cref="TMC_CATCommand" CAT commands/>
	/// <seealso cref="IMC_PluginCAT.command" CAT management/>
	coOpenDay = 11;
	/// <summary>
	/// CAT transaction report command
	/// </summary>
	/// This values is used to launch a report of all the transactions processed by the CAT
	/// <seealso cref="TMC_CATCommand" CAT commands/>
	/// <seealso cref="IMC_PluginCAT.command" CAT management/>
	coTransactionsReport = 12;
	/// <summary>
	/// CAT firmware update command
	/// </summary>
	/// This value is used to update the CAT firmware
	/// <seealso cref="TMC_CATCommand" CAT commands/>
	/// <seealso cref="IMC_PluginCAT.command" CAT management/>
	coCATUpdate = 13;
	/// <summary>
	/// CAT gift card void initialization commmand
	/// </summary>
	/// This value is used to void initialised gift cards
	/// <seealso cref="TMC_CATCommand" CAT commands/>
	/// <seealso cref="IMC_PluginCAT.command" CAT management/>
	coGiftCardVoidActivate = 14;
	/// <summary>
	/// CAT gift card void refilling commmand
	/// </summary>
	/// This value is used to void a refill gift card command
	/// <seealso cref="TMC_CATCommand" CAT commands/>
	/// <seealso cref="IMC_PluginCAT.command" CAT management/>
	coGiftCardVoidReload = 15;
	/// <summary>
	/// CAT Sale of a gift card
	/// </summary>
	/// This value is used to sale a gift card
	/// <seealso cref="TMC_CATCommand" CAT commands/>
	/// <seealso cref="IMC_PluginCAT.command" CAT management/>
	coGiftCardIssue = 16;
	/// <summary>
	/// CAT Void sale of a gift card
	/// </summary>
	/// This value is used to vois a sale a gift card command
	/// <seealso cref="TMC_CATCommand" CAT commands/>
	/// <seealso cref="IMC_PluginCAT.command" CAT management/>
	coGiftCardVoidIssue = 17;
	/// <summary>
	/// Gift Card created as result of a refund sales transaction
	/// </summary>
	/// This value is used to created a gift card as result of a refund sales transaction (when the shop does not refund the money)
	/// <seealso cref="TMC_CATCommand" CAT commands/>
	/// <seealso cref="IMC_PluginCAT.command" CAT management/>
	coGiftCardReturn = 18;
	/// <summary>
	/// void of a Gift Card created as result of a refund sales transaction
	/// </summary>
	/// This value is used to void a gift card created as result of a refund sales transaction (when the shop does not refund the money)
	/// <seealso cref="TMC_CATCommand" CAT commands/>
	/// <seealso cref="IMC_PluginCAT.command" CAT management/>
	coGiftCardVoidReturn = 19;
	/// <summary>
	/// Get the metadata of the card without processing a payment transaction
	/// </summary>
	/// This values is used to get the metadata of the card as the BIN or the expiration date without processing a payment transaction.
	/// <seealso cref="TMC_CATCommand" CAT commands/>
	/// <seealso cref="IMC_PluginCAT.command" CAT management/>
	/// <seealso cref="caCATGetCardMetaData" Driver capabilities query/>
	coGetCardMetaData = 20;
	/// <summary>
	/// Check the validity of a card and get its metadata without processing a real payment transaction
	/// </summary>
	/// This values is used to check the validity of a card and get its metadata as the BIN or the expiration date without processing a payment transaction.
	/// <seealso cref="TMC_CATCommand" CAT commands/>
	/// <seealso cref="IMC_PluginCAT.command" CAT management/>
	/// <seealso cref="caCATCheckCardMetaData" Driver capabilities query/>
	coCheckCardMetaData = 21;

	// TMC_CATTransactionType
	/// <summary>
	/// Unknown transaction type
	/// </summary>
	/// This is the undefined value for the transaction types supported by the CAT
	/// <seealso cref="TMC_CATTransactionType" Transaction types/>
	/// <seealso cref="IMC_CATParamsIn" Transaction parameters/>
	ttUnknown = 0;
	/// <summary>
	/// Sales transaction type
	/// </summary>
	/// This value indicates a sales transaction type
	/// <seealso cref="TMC_CATTransactionType" Transaction types/>
	/// <seealso cref="IMC_CATParamsIn" Transaction parameters/>
	ttPurchase = 1;
	/// <summary>
	/// Void sales transaction type
	/// </summary>
	/// This value identifies a void sales transaction type
	/// <seealso cref="TMC_CATTransactionType" Transaction types/>
	/// <seealso cref="IMC_CATParamsIn" Transaction parameters/>
	ttVoidPurchase = 2;
	/// <summary>
	/// Refund transaction type
	/// </summary>
	/// This value identifies a refund transaction type
	/// <seealso cref="TMC_CATTransactionType" Transaction types/>
	/// <seealso cref="IMC_CATParamsIn" Transaction parameters/>
	ttRefund = 3;
	/// <summary>
	/// Void refund transaction type
	/// </summary>
	/// This value identifies a refund transaction type
	/// <seealso cref="TMC_CATTransactionType" Transaction types/>
	/// <seealso cref="IMC_CATParamsIn" Transaction parameters/>
	ttVoidRefund = 4;
	/// <summary>
	/// Checque transaction type
	/// </summary>
	/// This value identifies a cheque transaction type
	/// <seealso cref="TMC_CATTransactionType" Transaction types/>
	/// <seealso cref="IMC_CATParamsIn" Transaction parameters/>
	ttCheque = 5;
	/// <summary>
	/// Void cheque transaction type
	/// </summary>
	/// This value identifies a void cheque transaction type
	/// <seealso cref="TMC_CATTransactionType" Transaction types/>
	/// <seealso cref="IMC_CATParamsIn" Transaction parameters/>
	ttVoidCheque = 6;
	/// <summary>
	/// Forced sales transaction type
	/// </summary>
	/// This value identifies a forced sales transaction type
	/// <remarks>
	/// Transactions are said to be forced when a user intervention is required (for instance: phone confirmation from the call centre) to allow their execution.
	/// </remarks>
	/// <seealso cref="TMC_CATTransactionType" Transaction types/>
	/// <seealso cref="IMC_CATParamsIn" Transaction parameters/>
	ttForcedPurchase = 7;
	/// <summary>
	/// Forced voice sales transaction type
	/// </summary>
	/// This value identifies a forced voice sales transaction type
	/// <remarks>
	/// Transactions are said to be forced when a user intervention is required (for instance: phone confirmation from the call centre) to allow their execution.
	/// </remarks>
	/// <seealso cref="TMC_CATTransactionType" Transaction types/>
	/// <seealso cref="IMC_CATParamsIn" Transaction parameters/>
	ttForcedVoidPurchase = 8;
	/// <summary>
	/// Forced refund transaction type
	/// </summary>
	/// This value identifies a forced refund transaction type
	/// <remarks>
	/// Transactions are said to be forced when a user intervention is required (for instance: phone confirmation from the call centre) to allow their execution.
	/// </remarks>
	/// <seealso cref="TMC_CATTransactionType" Transaction types/>
	/// <seealso cref="IMC_CATParamsIn" Transaction parameters/>
	ttForcedRefund = 9;
	/// <summary>
	/// Forced void refund
	/// </summary>
	/// This value identifies a forced void refund
	/// <remarks>
	/// Transactions are said to be forced when a user intervention is required (for instance: phone confirmation from the call centre) to allow their execution.
	/// </remarks>
	/// <seealso cref="TMC_CATTransactionType" Transaction types/>
	/// <seealso cref="IMC_CATParamsIn" Transaction parameters/>
	ttForcedVoidRefund = 10;
	/// <summary>
	/// Forced cheque transaction
	/// </summary>
	/// This value identifies a forced cheque transaction
	/// <remarks>
	/// Transactions are said to be forced when a user intervention is required (for instance: phone confirmation from the call centre) to allow their execution.
	/// </remarks>
	/// <seealso cref="TMC_CATTransactionType" Transaction types/>
	/// <seealso cref="IMC_CATParamsIn" Transaction parameters/>
	ttForcedCheque = 11;

	// TMC_CATCardType
	/// <summary>
	/// Unknown payment card type
	/// </summary>
	/// This is the unknown value for payment card types
	/// <seealso cref="TMC_CATCardType" Card types/>
	/// <seealso cref="IMC_CATPITransac" Transaction input parameters/>
	ctUnknown = 0;
	/// <summary>
	/// Credit card
	/// </summary>
	/// This value identifies a credit card
	/// <seealso cref="TMC_CATCardType" Card types/>
	/// <seealso cref="IMC_CATPITransac" Transaction input parameters/>
	ctCreditCard = 1;
	/// <summary>
	/// Debit card
	/// </summary>
	/// This value identifies a debit card
	/// <seealso cref="TMC_CATCardType" Card types/>
	/// <seealso cref="IMC_CATPITransac" Transaction input parameters/>
	ctDebitCard = 2;
	/// <summary>
	/// Electronic wallet
	/// </summary>
	/// This value identifies an electronic wallet
	/// <seealso cref="TMC_CATCardType" Card types/>
	/// <seealso cref="IMC_CATPITransac" Transaction input parameters/>
	ctElectronicMoney = 3;
	/// <summary>
	/// Gift card
	/// </summary>
	/// This value identifies a gif card
	/// <seealso cref="TMC_CATCardType" Card types/>
	/// <seealso cref="IMC_CATPITransac" Transaction input parameters/>
	ctGiftCard = 4;
	/// <summary>
	/// Cheque
	/// </summary>
	/// This values identifies a cheque
	/// <seealso cref="TMC_CATCardType" Card types/>
	/// <seealso cref="IMC_CATPITransac" Transaction input parameters/>
	ctCheque = 5;
	/// <summary>
	/// Credit card not present
	/// </summary>
	/// This value identifies a credit card not present
	/// <seealso cref="TMC_CATCardType" Card types/>
	/// <seealso cref="IMC_CATPITransac" Transaction input parameters/>
	ctNotPresentCreditCard = 6;

	// TMC_CATResultTransaction
	/// <summary>
	/// Unknown transaction result
	/// </summary>
	/// This is the undefined value for transaction result types
	/// <seealso cref="TMC_CATResultTransaction" types de r?sultat de la transaction/>
	/// <seealso cref="IMC_CATParamsOut" Transaction output value/>
	rtUnknown = 0;
	/// <summary>
	/// Accepted transaction
	/// </summary>
	/// This values identifies an accepted transaction
	/// <seealso cref="TMC_CATResultTransaction" Transaction result types/>
	/// <seealso cref="IMC_CATParamsOut" Transaction output value/>
	rtAccepted = 1;
	/// <summary>
	/// Refused transaction
	/// </summary>
	/// This values identifies a refused transaction
	/// <seealso cref="TMC_CATResultTransaction" Transaction result types/>
	/// <seealso cref="IMC_CATParamsOut" Transaction output value/>
	rtRefussed = 2;
	/// <summary>
	/// Transaction requiring an authorization from the call center
	/// </summary>
	/// This values identifies a transaction that requires an authorization obtained by phone from the call center
	/// <seealso cref="TMC_CATResultTransaction" Transaction result types/>
	/// <seealso cref="IMC_CATParamsOut" Transaction output value/>
	rtCallCenter = 3;
	/// <summary>
	/// Impossible operation
	/// </summary>
	/// This value identifies an impossible operation, which caused the transaction to fail
	/// <seealso cref="TMC_CATResultTransaction" Transaction result types/>
	/// <seealso cref="IMC_CATParamsOut" Transaction output value/>
	rtImpossibleOp = 4;
	/// <summary>
	/// Error in transaction
	/// </summary>
	/// This value identifes a failed transaction
	/// <seealso cref="TMC_CATResultTransaction" Transaction result types/>
	/// <seealso cref="IMC_CATParamsOut" Transaction output value/>
	rtError = 5;

	// TMC_CATPrintType
	/// <summary>
	/// Unknown report type
	/// </summary>
	/// This is the undefined value for report types
	/// <seealso cref="TMC_CATPrintType" Report types/>
	/// <seealso cref="MC_PluginInterface.IMC_PluginCallback" coworking callback management/>
	tpCATUnknown = pptUnknown;
	/// <summary>
	/// Customer receipt report
	/// </summary>
	/// This values identifies a customer receipt report
	/// <seealso cref="TMC_CATPrintType" Report types/>
	/// <seealso cref="MC_PluginInterface.IMC_PluginCallback" coworking callback management/>
	tpCATCustomerReceipt = pptReportType1;
	/// <summary>
	/// Store receipt report
	/// </summary>
	/// This value identifies a store receipt report
	/// <seealso cref="TMC_CATPrintType" Report types/>
	/// <seealso cref="MC_PluginInterface.IMC_PluginCallback" coworking callback management/>
	tpCATStoreReceipt = pptReportType2;
	/// <summary>
	/// End-of-day settlement report
	/// </summary>
	/// This value identifies an end-of-day settlement report
	/// <seealso cref="TMC_CATPrintType" Report types/>
	/// <seealso cref="MC_PluginInterface.IMC_PluginCallback" coworking callback management/>
	tpCATZReceipt = pptReportType3;

	// TMC_CATCurrencyKindCode
	/// <summary>
	/// Unknown currency
	/// </summary>
	/// This is the unknown value for currency coding schemes
	/// <seealso cref="TMC_CATCurrencyKindCode" currency code identifier/>
	/// <seealso cref="IMC_CATPOTransac" Transaction parameters returned by the CAT/>
	ckcUnknown = 0;
	/// <summary>
	/// Numeric ISO currency code
	/// </summary>
	/// This values indicates that the currency is returned by the CAT as an ISO numeric code
	/// <seealso cref="TMC_CATCurrencyKindCode" currency code identifier/>
	/// <seealso cref="IMC_CATPOTransac" Transaction parameters returned by the CAT/>
	ckcISONun = 1;
	/// <summary>
	/// Alphanumeric ISO currency code
	/// </summary>
	/// This values indicates that the currency is returned by the CAT as an ISO alphanumeric code
	/// <seealso cref="TMC_CATCurrencyKindCode" currency code identifier/>
	/// <seealso cref="IMC_CATPOTransac" Transaction parameters returned by the CAT/>
	ckcISOAlpha = 2;
	/// <summary>
	/// Client application currency code
	/// </summary>
	/// This values indicates that the currency is returned by the CAT using a client application code
	/// <seealso cref="TMC_CATCurrencyKindCode" types d'identifiant de devise/>
	/// <seealso cref="IMC_CATPOTransac" Transaction parameters returned by the CAT/>
	ckcAppli = 3;

	// TMC_CATCountryKindCode
	/// <summary>
	/// Unknown country type
	/// </summary>
	/// This is the unknown value for country coding schemes
	/// <seealso cref="TMC_CATCountryKindCode" country code identifier/>
	/// <seealso cref="IMC_CATPOTransac" Transaction parameters returned by the CAT/>
	ctyUnknown = 0;
	/// <summary>
	/// Three digits numeric ISO country code
	/// </summary>
	/// This values indicates that the country is returned by the CAT as an three digits ISO numeric code (ISO 3166-1 numeric)
	/// <seealso cref="TMC_CATCountryKindCode" country code identifier/>
	/// <seealso cref="IMC_CATPOTransac" Transaction parameters returned by the CAT/>
	ctyISONun = 1;
	/// <summary>
	/// Two-letter ISO country code
	/// </summary>
	/// This values indicates that the country is returned by the CAT as an ISO alphanumeric code of two letters (ISO 3166-1 alpha-2)
	/// <seealso cref="TMC_CATCountryKindCode" country code identifier/>
	/// <seealso cref="IMC_CATPOTransac" Transaction parameters returned by the CAT/>
	ctyISOAlpha2 = 2;
	/// <summary>
	/// Three-ISO letter country code
	/// </summary>
	/// This values indicates that the country is returned by the CAT as an ISO alphanumeric code of three letters (ISO 3166-1 alpha-3)
	/// <seealso cref="TMC_CATCountryKindCode" country code identifier/>
	/// <seealso cref="IMC_CATPOTransac" Transaction parameters returned by the CAT/>
	ctyISOAlpha3 = 3;
	/// <summary>
	/// Client application country code
	/// </summary>
	/// This values indicates that the country is returned by the CAT using a client application code
	/// <seealso cref="TMC_CATCountryKindCode" country code identifier/>
	/// <seealso cref="IMC_CATPOTransac" Transaction parameters returned by the CAT/>
	ctyAppli = 4;

	// TMC_CATDetaxeStatus
	/// <summary>
	/// Unknown tax refund status
	/// </summary>
	/// This is the undefined value for tax refund status
	/// <seealso cref="TMC_CATDetaxeStatus" tax refund status/>
	/// <seealso cref="MC_PluginCATInterface.IMC_PluginCAT.command" CATs command execution/>
	dxUnknown = 0;
	/// <summary>
	/// Unassessed tax refund
	/// </summary>
	/// This value indicates that the tax refund is not assessed (which is the case for most CAT terminals).
	/// <seealso cref="TMC_CATDetaxeStatus" tax refund status/>
	/// <seealso cref="MC_PluginCATInterface.IMC_PluginCAT.command" CATs command execution/>
	dxNotEvaluate = 1;
	/// <summary>
	/// The transaction is eligible for tax refund
	/// </summary>
	/// This value indicates that the transaction is eligible for tax refund
	/// <seealso cref="TMC_CATDetaxeStatus" tax refund status/>
	/// <seealso cref="MC_PluginCATInterface.IMC_PluginCAT.command" CATs command execution/>
	dxYes = 2;
	/// <summary>
	/// The transaction is NOT eligible for tax refund
	/// </summary>
	/// This values indicates that the client application CANNOT process the sales associated with this transaction with a tax refund
	/// <seealso cref="TMC_CATDetaxeStatus" tax refund status/>
	/// <seealso cref="MC_PluginCATInterface.IMC_PluginCAT.command" CATs command execution/>
	dxNo = 3;

	// TMC_CATMustSign
	/// <summary>
	/// The driver cannot indicate whether the customer must sign the transaction receipt
	/// </summary>
	/// This is the unkown value for the codes indicating whether the customer must sign the transaction receipt
	/// <seealso cref="TMC_CATMustSign" Indicates some special actions to cashier about the transaction receipt />
	/// <seealso cref="IMC_CATPOTransac" Transaction parameters returned by the CAT/>
	msUnknown = 0;
	/// <summary>
	/// The driver indicates that the customer must NOT sign the transaction receipt
	/// </summary>
	/// This value indicates that the customer must not sign the transaction receipt
	/// <seealso cref="TMC_CATMustSign" Indicates some special actions to cashier about the transaction receipt/>
	/// <seealso cref="IMC_CATPOTransac" Transaction parameters returned by the CAT/>
	msNo = 1;
	/// <summary>
	/// The driver indicates that the customer must sign the transaction receipt
	/// </summary>
	/// This value indicates that the customer must sign the transaction receipt
	/// <seealso cref="TMC_CATMustSign" Indicates some special actions to cashier about the transaction receipt/>
	/// <seealso cref="IMC_CATPOTransac" Transaction parameters returned by the CAT/>
	msCustomerSign = 2;
	/// <summary>
	/// The driver indicates that the cashier (or they supervisor) must sign the transaction receipt
	/// </summary>
	/// This value indicates that the cashier (or they supervisor) must sign the transaction receipt (usually on a refund transaction)
	/// <seealso cref="TMC_CATMustSign" Indicates some special actions to cashier about the transaction receipt/>
	/// <seealso cref="IMC_CATPOTransac" Transaction parameters returned by the CAT/>
	msShopSign = 3;
	/// <summary>
	/// The driver indicates that the cashier must to request at the cardholder an identity piece
	/// </summary>
	/// This value indicates that the cashier must to verify that the customer is the card's owner
	/// <seealso cref="TMC_CATMustSign" Indicates some special actions to cashier about the transaction receipt/>
	/// <seealso cref="IMC_CATPOTransac" Transaction parameters returned by the CAT/>
	msIdentifyCustomer = 4;

	// TMC_CATReportType
	/// <summary>
	/// Unknown transaction reporting type
	/// </summary>
	/// This value is the undefined value for transaction reporting types
	/// <seealso cref="TMC_CATReportType" transaction reporting types/>
	/// <seealso cref="IMC_CATPIReport" Report parameters/>
	rptUnknown = 0;
	/// <summary>
	/// Print one report for every till
	/// </summary>
	/// This value indicates that one report should be printed for every till
	/// <seealso cref="TMC_CATReportType" transaction reporting types/>
	/// <seealso cref="IMC_CATPIReport" Report parameters/>
	rptTill = 1;
	/// <summary>
	/// Print one report for every clerk
	/// </summary>
	/// This value indicates that one report should be printed for every clerk
	/// <seealso cref="TMC_CATReportType" transaction reporting types/>
	/// <seealso cref="IMC_CATPIReport" Report parameters/>
	rptClerk = 2;
	/// <summary>
	/// Print one report for a given date
	/// </summary>
	/// This value indicates that one report should be printed for a given date
	/// <seealso cref="TMC_CATReportType" transaction reporting types/>
	/// <seealso cref="IMC_CATPIReport" Report parameters/>
	rptDate = 3;
	/// <summary>
	/// Print one report for totals
	/// </summary>
	/// This value indicates that one report should be printed for totals
	/// <seealso cref="TMC_CATReportType" transaction reporting types/>
	/// <seealso cref="IMC_CATPIReport" Report parameters/>
	rptTotals = 4;
	/// <summary>
	/// Print one report for detail
	/// </summary>
	/// This value indicates that one report should be printed for detail
	/// <seealso cref="TMC_CATReportType" transaction reporting types/>
	/// <seealso cref="IMC_CATPIReport" Report parameters/>
	rptDetail = 5;

	// TMC_CATCardNumberGettingWay
	/// <summary>
	/// Unknown way to get Card Number
	/// </summary>
	/// This value is the undefined value of which of available ways to get card number has been used
	/// <seealso cref="TMC_CATCardNumberGettingWay" Available ways to get card number/>
	/// <seealso cref="IMC_CATPOTransacV3" Interface providing information regarding the execution of a transaction (Version 3)/>
	cngUnknown = 0;
	/// <summary>
	/// Card number has been get by the CAT device (MSR or other)
	/// </summary>
	/// This value means that CAT devices could get the card number by his owns ways
	/// <seealso cref="TMC_CATCardNumberGettingWay" Available ways to get card number/>
	/// <seealso cref="IMC_CATPOTransacV3" Interface providing information regarding the execution of a transaction (Version 3)/>
	cngCAT = 1;
	/// <summary>
	/// Card number has been typed by the user
	/// </summary>
	/// This value means that user typed card number.
	/// <seealso cref="TMC_CATCardNumberGettingWay" Available ways to get card number/>
	/// <seealso cref="IMC_CATPOTransacV3" Interface providing information regarding the execution of a transaction (Version 3)/>
	cngTyped = 2;

	// TMC_CATAuthNumGettingWay
	/// <summary>
	/// Unknown way to get authorization Number
	/// </summary>
	/// This value is the undefined value of which of available ways to get authorization number has been used
	/// <seealso cref="TMC_CATAuthNumGettingWay" Available ways to get authorization number/>
	/// <seealso cref="IMC_CATPOTransacV3" Interface providing information regarding the execution of a transaction (Version 3)/>
	angUnknown = 0;
	/// <summary>
	/// Authorization number has been provided by the CAT device.
	/// </summary>
	/// This value means that CAT devices provides the authorization number by his owns ways
	/// <seealso cref="TMC_CATAuthNumGettingWay" Available ways to get authorization number/>
	/// <seealso cref="IMC_CATPOTransacV3" Interface providing information regarding the execution of a transaction (Version 3)/>
	angCAT = 1;
	/// <summary>
	/// Authorization number has been typed by the user
	/// </summary>
	/// This value means that user typed authorization number.
	/// <seealso cref="TMC_CATAuthNumGettingWay" Available ways to get authorization number/>
	/// <seealso cref="IMC_CATPOTransacV3" Interface providing information regarding the execution of a transaction (Version 3)/>
	angTyped = 2;
	// TMC_CATMICRDataGetterResult
	/// <summary>
	/// This is the undefined value for MICR cheque data callback results
	/// </summary>
	/// The data callback function called by the driver to retrieve data from the application
	/// returns a completion flag among the possible TMC_CATMICRDataGetterResult values.
	/// <seealso cref="TMC_CATMICRDataGetterResult" MICR printing cheque callback result type/>
	/// <seealso cref="IMC_CATMICRDataGetter" MICR printing cheque data getter callback/>
	ccrUnknown = 0;
	/// <summary>
	/// MICR cheque data getter callback OK
	/// </summary>
	/// This value is used to indicate that the callback successfully provided the requested data
	/// <seealso cref="TMC_CATMICRDataGetterResult" MICR printing cheque callback result type/>
	/// <seealso cref="IMC_CATMICRDataGetter" MICR printing cheque data getter callback/>
	ccrOk = 1;
	/// <summary>
	/// MICR cheque data getter callback NOT OK
	/// </summary>
	/// This value is used to indicate that the callback failed to provide the requested data
	/// <seealso cref="TMC_CATMICRDataGetterResult" MICR printing cheque callback result type/>
	/// <seealso cref="IMC_CATMICRDataGetter" MICR printing cheque data getter callback/>
	ccrKo = 2;

	// Capabilitites
	/// <summary>
	/// Capability of the CAT to print duplicates of the last transactions
	/// </summary>
	/// This value is used to query the CAT for its capability to print duplicates of the last transactions
	/// <seealso cref="MC_PluginInterface.IMC_PluginBase.getCapabilities" Driver capabilities query/>
	caCATDuplicataLastOpe = ca01;
	/// <summary>
	/// CAT requirement to undergo regular maintenance checks
	/// </summary>
	/// This value is used to query CAT as to whether it requires regular maintenance checks
	/// <seealso cref="MC_PluginInterface.IMC_PluginBase.getCapabilities" Driver capabilities query/>
	caCATCheckMaintenance = ca02;
	/// <summary>
	/// Capability of the CAT to perform end-of-day settlements
	/// </summary>
	/// This value is used to query CAT for its capability to perform end-of-day settlements
	/// <seealso cref="MC_PluginInterface.IMC_PluginBase.getCapabilities" Driver capabilities query/>
	caCATSettlement = ca03;
	/// <summary>
	/// Capability of the CAT to perform payment card verifications
	/// </summary>
	/// This value is used to query the CAT for its capability to perform payment card verifications
	/// <seealso cref="MC_PluginInterface.IMC_PluginBase.getCapabilities" Driver capabilities query/>
	caCATCheckCard = ca04;
	/// <summary>
	/// Capability of the CAT to operate with gift cards
	/// </summary>
	/// This value is used to query the CAT for its capability to operate with gift cards
	/// <seealso cref="MC_PluginInterface.IMC_PluginBase.getCapabilities" Driver capabilities query/>
	caCATManageGiftCard = ca05;
	/// <summary>
	/// Capability of the CAT to operate with bank cards
	/// </summary>
	/// This value is used to query the CAT for its capability to operate with bank cards
	/// <seealso cref="MC_PluginInterface.IMC_PluginBase.getCapabilities" Driver capabilities query/>
	caCATManageBankCard = ca06;
	/// <summary>
	/// Capability of the CAT to operate with cheques
	/// </summary>
	/// This value is used to query the CAT for its capability to operate with cheques
	/// <seealso cref="MC_PluginInterface.IMC_PluginBase.getCapabilities" Driver capabilities query/>
	caCATManageCheque = ca07;
	/// <summary>
	/// CAT requirement of an initialization process to be executed prior to any other operation
	/// </summary>
	/// This value is used to query the CAT as to whether it requires an initialization process to be executed before any other operation can be run
	/// <seealso cref="MC_PluginInterface.IMC_PluginBase.getCapabilities" Driver capabilities query/>
	caCATDoInit = ca08;
	/// <summary>
	/// Capability of the CAT to interrupt a transaction
	/// </summary>
	/// This value is used to query the CAT for its capability to interrupt a transaction
	/// <seealso cref="MC_PluginInterface.IMC_PluginBase.getCapabilities" Driver capabilities query/>
	caCATInterrupt = ca09;
	/// <summary>
	/// CAT Requirement of a start-of-day opening process
	/// </summary>
	/// This value is used to query the CAT as to whether it requires the client application to send a start-of-day opening command before any transaction can be entered
	/// <seealso cref="MC_PluginInterface.IMC_PluginBase.getCapabilities" Driver capabilities query/>
	caCATOpenDay = ca10;
	/// <summary>
	/// Capability of the CAT to print reports
	/// </summary>
	/// This value is used to query the CAT for its capability to print reports
	/// <seealso cref="MC_PluginInterface.IMC_PluginBase.getCapabilities" Driver capabilities query/>
	caCATTransactionReport = ca11;
	/// <summary>
	/// Capability of the CAT to manage gift card activation
	/// </summary>
	/// This value is used to query the CAT for its capability to manage gift card activation
	/// <seealso cref="MC_PluginInterface.IMC_PluginBase.getCapabilities" Driver capabilities query/>
	caCATManageGiftCardActivation = ca12;
	/// <summary>
	/// Capability of the CAT to manage gift card reload
	/// </summary>
	/// This value is used to query the CAT for its capability to manage gift card reload
	/// <seealso cref="MC_PluginInterface.IMC_PluginBase.getCapabilities" Driver capabilities query/>
	caCATManageGiftCardReload = ca13;
	/// <summary>
	/// Capability of the CAT to update automatically
	/// </summary>
	/// This value is used to query the CAT for its capability to update automatically (firmware, parameters, ...)
	/// <seealso cref="MC_PluginInterface.IMC_PluginBase.getCapabilities" Driver capabilities query/>
	caCATUpdate = ca14;
	/// <summary>
	/// Capability of the CAT to manage forced sales
	/// </summary>
	/// This value is used to query the CAT for its capability to manage forced purchases
	/// <seealso cref="MC_PluginInterface.IMC_PluginBase.getCapabilities" Driver capabilities query/>
	caCATManageForcedPurchase = ca15;
	/// <summary>
	/// Capability of the CAT to manage forced void sales
	/// </summary>
	/// This value is used to query the CAT for its capability to manage forced void sales
	/// <seealso cref="MC_PluginInterface.IMC_PluginBase.getCapabilities" Driver capabilities query/>
	caCATManageForcedVoidPurchase = ca16;
	/// <summary>
	/// Capability of the CAT to manage forced refunds
	/// </summary>
	/// This value is used to query the CAT for its capability to manage forced refunds
	/// <seealso cref="MC_PluginInterface.IMC_PluginBase.getCapabilities" Driver capabilities query/>
	caCATManageForcedRefund = ca17;
	/// <summary>
	/// Capability of the CAT to manage forced void refunds
	/// </summary>
	/// This value is used to query the CAT for its capability to manage forced void refunds
	/// <seealso cref="MC_PluginInterface.IMC_PluginBase.getCapabilities" Driver capabilities query/>
	caCATManageForcedVoidRefund = ca18;
	/// <summary>
	/// Cast must wait between two transactions
	/// </summary>
	/// This value is used to query the CAT as to whether the application must wait between sucessive transactions
	/// <seealso cref="MC_PluginInterface.IMC_PluginBase.getCapabilities" Driver capabilities query/>
	caCATMustWaitBetween2Transac = ca19;
	/// <summary>
	/// Capability of the CAT to manage vois gift card activation command
	/// </summary>
	/// This value is used to query the CAT for its capability to manage void gift card activation
	/// <seealso cref="MC_PluginInterface.IMC_PluginBase.getCapabilities" Driver capabilities query/>
	caCATManageGiftCardVoidActivation = ca20;
	/// <summary>
	/// Capability of the CAT to manage void gift card reload command
	/// </summary>
	/// This value is used to query the CAT for its capability to manage void gift card reload
	/// <seealso cref="MC_PluginInterface.IMC_PluginBase.getCapabilities" Driver capabilities query/>
	caCATManageGiftCardVoidReload = ca21;
	/// <summary>
	/// Capability of the CAT to manage gift card sale command
	/// </summary>
	/// This value is used to query the CAT for its capability to manage gift card sales command
	/// <seealso cref="MC_PluginInterface.IMC_PluginBase.getCapabilities" Driver capabilities query/>
	caCATManageGiftCardIssue = ca22;
	/// <summary>
	/// Capability of the CAT to manage void gift card sales command
	/// </summary>
	/// This value is used to query the CAT for its capability to manage void gift card sales command
	/// <seealso cref="MC_PluginInterface.IMC_PluginBase.getCapabilities" Driver capabilities query/>
	caCATManageGiftCardVoidIssue = ca23;
	/// <summary>
	/// Should the business application check gift card balance before launch a payment transaction?
	/// </summary>
	/// This value is used to inform the business application if it has to check the gift card balance before to launch a payment transaction.<p>
	/// Some gift card protocols include this check on their payment transaction process, but in some ones the business application must do
	/// this check explitly before to lanuch the payment transaction.
	/// <seealso cref="MC_PluginInterface.IMC_PluginBase.getCapabilities" Driver capabilities query/>
	caCATGiftCardShouldReadBalanceBeforePayment = ca24;
	/// <summary>
	/// Capability of the CAT to manage gift card return command
	/// </summary>
	/// This value is used to query the CAT for its capability to manage gift card return command
	/// <seealso cref="MC_PluginInterface.IMC_PluginBase.getCapabilities" Driver capabilities query/>
	caCATManageGiftCardReturn = ca25;
	/// <summary>
	/// Capability of the CAT to manage void gift card return command
	/// </summary>
	/// This value is used to query the CAT for its capability to manage void gift card return command
	/// <seealso cref="MC_PluginInterface.IMC_PluginBase.getCapabilities" Driver capabilities query/>
	caCATManageGiftCardVoidReturn = ca26;
	/// <summary>
	/// Capability of the CAT to manage the manual card entry when the card is not present
	/// </summary>
	/// This value is used to query the CAT for its capability to manage the manual card entry
	/// <seealso cref="MC_PluginInterface.IMC_PluginBase.getCapabilities" Driver capabilities query/>
	caCATManageManualCardEntry = ca27;
	/// <summary>
	/// Capability of the CAT to manage forced cheque transactions
	/// </summary>
	/// This value is used to query the CAT for its capability to manage forced cheque transactions
	/// <seealso cref="MC_PluginInterface.IMC_PluginBase.getCapabilities" Driver capabilities query/>
	caCATManageForcedCheque = ca28;
	/// <summary>
	/// Capability of the CAT to capture the metadata of the card without processing a payment transaction
	/// </summary>
	/// This value is used to query the CAT for its capability to capture the metadata of the card without processing a payment transaction
	/// <seealso cref="MC_PluginInterface.IMC_PluginBase.getCapabilities" Driver capabilities query/>
	/// <seealso cref="coGetCardMetaData" CAT management/>
	caCATGetCardMetaData = ca29;
	/// <summary>
	/// Capability of the CAT to check a card and capture its metadata without processing a real payment transaction
	/// </summary>
	/// This value is used to query the CAT for its capability to check a card and capture its without processing a real payment transaction
	/// <seealso cref="MC_PluginInterface.IMC_PluginBase.getCapabilities" Driver capabilities query/>
	/// <seealso cref="coCheckCardMetaData" CAT management/>
	caCATCheckCardMetaData = ca30;
	/// <summary>
	/// Code who identifies the issuer of the transaction
	/// </summary>
	/// This value gives the issuer code of the transaction that is assigned by the CAT driver when validating a transaction with the payment card.
	/// For example, it is used by the application to determine whether the sales transaction references stored in the database
	/// are known by the payment system to refund a return of goods with the card used to pay for the sale.
	/// <P>It must be the same value as the one returned in the property 'TransactionIssuer' of the return interface of the payment transaction.
	/// <remarks>
	/// Unlike most other capacities, this capacity is not a boolean (X for true, - for false) but it is a string
	/// </remarks>
	/// <seealso cref="IMC_CATPOTransacV8.TransactionIssuer" Code who identifies the issuer of the transaction/>
	/// <seealso cref="IMC_CATPOGiftCardV5.TransactionIssuer" Code who identifies the issuer of the transaction/>
	/// <seealso cref="IMC_CATPITransac.refundRef" Reference of the original transaction/>
	/// <seealso cref="IMC_CATPITransac.refundAutNum" Authorization number of the original transaction/>
	/// <seealso cref="IMC_CATPITransacV2.RefundTransacToken" Token coming from original transaction/>
	/// <seealso cref="IMC_CATPITransacV3.TerminalPrivateData" CAT Private data from original transaction/>
	/// <seealso cref="IMC_CATPIGiftCardV3.RefundRef" Reference comming from original transaction/>
	/// <seealso cref="IMC_CATPIGiftCardV3.RefundTransacToken" Token comming from original transaction/>
	/// <seealso cref="IMC_CATPIGiftCardV4.TerminalPrivateData" CAT Private data from original transaction/>
	/// <seealso cref="IMC_CATPIGiftCardV6.refundAutNum" Authorization number of the original transaction/>
	/// <seealso cref="MC_PluginInterface.IMC_PluginBase.getCapabilities" Driver capabilities query/>
	caCATGetTransactionIssuer = ca31;

type
	/// <summary>
	/// Commande types
	/// </summary>
	/// <remarks>
	/// For compatibility reasons, the enumerated types had to be replaced by numeric values.<p>
	/// Constants were introduced for better code readability.
	/// </remarks>
	/// <seealso cref="coUnknown" Unknown command identifier/>
	/// <seealso cref="coInitLink" Link initialization command/>
	/// <seealso cref="coTransaction" Transaction command/>
	/// <seealso cref="coPrintDuplicate" Print duplicate command/>
	/// <seealso cref="coCheckForMaintenance" Check for maintenance command/>
	/// <seealso cref="coMaintenance" Maintenance command/>
	/// <seealso cref="coSettlement" Settlement command/>
	/// <seealso cref="coCheckCard" Check card command/>
	/// <seealso cref="coGiftCardActivate" Gift card activate command/>
	/// <seealso cref="coGiftCardReload" Gift card reload command/>
	/// <seealso cref="coTest" Test device command/>
	/// <seealso cref="coGiftCardVoidActivate" Gift card void activate command/>
	/// <seealso cref="coGiftCardVoidReload" Gift card void reload command/>
	/// <seealso cref="coGiftCardIssue" Gift card sales command/>
	/// <seealso cref="coGiftCardVoidIssue" Gift card void sales command/>
	/// <seealso cref="coGiftCardReturn" Gift card return command/>
	/// <seealso cref="coGiftCardVoidReturn" Gift card void return command/>
	/// <seealso cref="coGetCardMetaData" Get the card metadata command/>
	/// <seealso cref="coCheckCardMetaData" Check the validity of a card and get its metadata without processing a real payment transaction/>
	TMC_CATCommand = integer;
	/// <summary>
	/// Type of transaction to execute
	/// </summary>
	/// <remarks>
	/// For compatibility reasons, the enumerated types had to be replaced by numeric values.<p>
	/// Constants were introduced for better code readability.
	/// </remarks>
	/// <seealso cref="ttUnknown" unknown transaction type/>
	/// <seealso cref="ttPurchase" sales transaction type/>
	/// <seealso cref="ttVoidPurchase" void sales transaction type/>
	/// <seealso cref="ttRefund" refund transaction type/>
	/// <seealso cref="ttVoidRefund" void refund transaction type/>
	/// <seealso cref="ttCheque" cheque transaction type/>
	/// <seealso cref="ttVoidCheque" void cheque transaction type/>
	/// <seealso cref="ttForcedPurchase" forced sales transaction type/>
	/// <seealso cref="ttForcedVoidPurchase" forced void sales transaction type/>
	/// <seealso cref="ttForcedRefund" forced refund transaction type/>
	/// <seealso cref="ttForcedVoidRefund" forced void refund transaction type/>
	/// <seealso cref="ttForcedCheque" forced cheque transaction type/>
	TMC_CATTransactionType = integer;
	/// <summary>
	/// Card types
	/// </summary>
	/// <remarks>
	/// For compatibility reasons, the enumerated types had to be replaced by numeric values.<p>
	/// Constants were introduced for better code readability.
	/// </remarks>
	/// <seealso cref="ctUnknown" Unknown card type/>
	/// <seealso cref="ctCreditCard" credit card type/>
	/// <seealso cref="ctDebitCard" debit card type/>
	/// <seealso cref="ctElectronicMoney" electronic wallet card type/>
	/// <seealso cref="ctGiftCard" gift card type/>
	/// <seealso cref="ctCheque" cheque card type/>
	/// <seealso cref="ctNotPresentCreditCard" Credit card not present type/>
	TMC_CATCardType = integer;
	/// <summary>
	/// Transaction result
	/// </summary>
	/// <remarks>
	/// For compatibility reasons, the enumerated types had to be replaced by numeric values.<p>
	/// Constants were introduced for better code readability.
	/// </remarks>
	/// <seealso cref="rtUnknown" Unknown transaction result/>
	/// <seealso cref="rtAccepted" accepted transaction result/>
	/// <seealso cref="rtRefussed" refused transaction result//>
	/// <seealso cref="rtCallCenter" call centre transaction result/>
	/// <seealso cref="rtImpossibleOp" impossible operation transaction result/>
	/// <seealso cref="rtError" error transaction result/>
	TMC_CATResultTransaction = integer;
	/// <summary>
	/// CAT receipt type
	/// </summary>
	/// <remarks>
	/// For compatibility reasons, the enumerated types had to be replaced by numeric values.<p>
	/// Constants were introduced for better code readability.
	/// </remarks>
	/// <seealso cref="tpCATUnknown" Unknown receipt type/>
	/// <seealso cref="tpCATCustomerReceipt" customer receipt type/>
	/// <seealso cref="tpCATStoreReceipt" store receipt type/>
	/// <seealso cref="tpCATZReceipt" settlement receipt type/>
	TMC_CATPrintType = integer;
	/// <summary>
	/// CAT currency code type
	/// </summary>
	/// <remarks>
	/// For compatibility reasons, the enumerated types had to be replaced by numeric values.<p>
	/// Constants were introduced for better code readability.
	/// </remarks>
	/// <seealso cref="ckcUnknown" unknown currency code type/>
	/// <seealso cref="ckcISONun" numeric currency code type/>
	/// <seealso cref="ckcISOAlpha" alphanumeric currency code type/>
	/// <seealso cref="ckcAppli" currency code type defined by the client application/>
	TMC_CATCurrencyKindCode = integer;
	/// <summary>
	/// CAT country code type
	/// </summary>
	/// <remarks>
	/// For compatibility reasons, the enumerated types had to be replaced by numeric values.<p>
	/// Constants were introduced for better code readability.
	/// </remarks>
	/// <seealso cref="ctyUnknown" unknown country code type/>
	/// <seealso cref="ctyISONun" three digits numeric country code type/>
	/// <seealso cref="ctyISOAlpha2" two-letter alphanumeric country code type/>
	/// <seealso cref="ctyISOAlpha3" three-letter alphanumeric country code type/>
	/// <seealso cref="ctyAppli" country code type defined by the client application/>
	TMC_CATCountryKindCode = integer;
	/// <summary>
	/// CAT tax refund status
	/// </summary>
	/// <remarks>
	/// For compatibility reasons, the enumerated types had to be replaced by numeric values.<p>
	/// Constants were introduced for better code readability.
	/// </remarks>
	/// <seealso cref="dxUnknown" unknown tax refund status/>
	/// <seealso cref="dxNotEvaluate" Unassessed tax refund status/>
	/// <seealso cref="dxYes" the transaction is eligible for tax refund/>
	/// <seealso cref="dxNo" the transaction is NOT eligible for tax refund/>
	TMC_CATDetaxeStatus = integer;
	/// <summary>
	/// Indicates some special actions to cashier about the transaction receipt
	/// </summary>
	/// <remarks>
	/// For compatibility reasons, the enumerated types had to be replaced by numeric values.<p>
	/// Constants were introduced for better code readability.
	/// </remarks>
	/// <seealso cref="msUnknown" signature requirement unknown/>
	/// <seealso cref="msNo" the customer must NOT sign the transaction receipt/>
	/// <seealso cref="msCustomerSign" the customer must sign the transaction receipt/>
	/// <seealso cref="msShopSign" the cashier (or they supervisor) must sign the transaction receipt/>
	/// <seealso cref="msIdentifyCustomer" the cashier must to verify that the customer is the card's owner/>
	TMC_CATMustSign = integer;
	/// <summary>
	/// CAT report type
	/// </summary>
	/// <remarks>
	/// For compatibility reasons, the enumerated types had to be replaced by numeric values.<p>
	/// Constants were introduced for better code readability.
	/// </remarks>
	/// <seealso cref="rptUnknown" unknown report type/>
	/// <seealso cref="rptTill" till report type/>
	/// <seealso cref="rptClerk" clerck report type/>
	/// <seealso cref="rptDate" date report type/>
	TMC_CATReportType = integer;
	/// <summary>
	/// Available ways to get Card Number
	/// </summary>
	/// <remarks>
	/// For compatibility reasons, the enumerated types had to be replaced by numeric values.<p>
	/// Constants were introduced for better code readability.
	/// </remarks>
	/// <seealso cref="cngUnknown" unknown way to get Card number/>
	/// <seealso cref="cngCAT" CAT device has get card number by his owns ways/>
	/// <seealso cref="cngTyped" User has typed card number/>
	TMC_CATCardNumberGettingWay = integer;
	/// <summary>
	/// Available ways to get Authorization Number
	/// </summary>
	/// <remarks>
	/// For compatibility reasons, the enumerated types had to be replaced by numeric values.<p>
	/// Constants were introduced for better code readability.
	/// </remarks>
	/// <seealso cref="angUnknown" unknown way to get Authorization number/>
	/// <seealso cref="angCAT" CAT device prodided authorization number/>
	/// <seealso cref="angTyped" User has typed authorization number/>
	TMC_CATAuthNumGettingWay = integer;

	/// <summary>
	/// MICR printing cheque getter callback result type
	/// </summary>
	/// <remarks>
	/// For compatibility reasons, the enumerated types had to be replaced by numeric values.<p>
	/// Constants were introduced for better code readability.
	/// </remarks>
	/// <seealso cref="ccrUnknown" this is the undefined value for MICR data getter callback results/>
	/// <seealso cref="ccrOk" MICR data getter callback OK/>
	/// <seealso cref="ccrKo" MICR data getter callback NOT OK/>
	TMC_CATMICRDataGetterResult = integer;

	/// <summary>
	/// Interface providing currency information
	/// </summary>
	/// This interface provides information regarding the transaction currency
	/// <seealso cref="IMC_CATParamsIn" transaction input parameters/>
	IMC_CATPICurrency = interface(IMC_VersionedInterface)
		['{EA1034BC-6CAB-4B09-9DD1-AD90AE5C5139}']
		function get_Currency: wideString; stdcall;
		function get_CurrencyISOA: wideString; stdcall;
		function get_CurrencyISON: wideString; stdcall;
		function get_CurrencyDec: integer; stdcall;

		/// <summary>
		/// Client application code of the currency used in the transaction
		/// </summary>
		property currency: wideString read get_Currency;
		/// <summary>
		/// Alphanumeric ISO code of the currency used in the transaction
		/// </summary>
		property currencyISOA: wideString read get_CurrencyISOA;
		/// <summary>
		/// Numeric ISO code of the currency used in the transaction
		/// </summary>
		property currencyISON: wideString read get_CurrencyISON;
		/// <summary>
		/// Number of decimals used to display currencies in the transaction
		/// </summary>
		property currencyDec: integer read get_CurrencyDec;
	end;

	/// <summary>
	/// Interface providing the parameters regarding the Dynamic Currency Conversion of a transaction
	/// </summary>
	/// This interface provides the information regarding the management of DCC during a transaction
	/// <seealso cref="IMC_CATParamsIn" transaction input parameters/>
	IMC_CATPIDCC = interface(IMC_VersionedInterface)
		['{9A92C29F-F3F1-4C5E-B07B-12C06B9921C9}']
		function get_DCCAllowed: boolean; stdcall;
		function get_DCCAcepted: boolean; stdcall;
		function get_DCCForeignCurrencyName: wideString; stdcall;
		function get_DCCForeignCurrencyCode: wideString; stdcall;
		function get_DCCForeignCurrencyAlphaCode: wideString; stdcall;
		function get_DCCForeignCurrencyAmount: double; stdcall;
		function get_DCCForeignCurrencyRate: double; stdcall;
		function get_DCCForeignCurrencyDecimal: integer; stdcall;
		function get_DCCForeignCurrencyDate: wideString; stdcall;

		/// <summary>
		/// Indicates whether DCC is available for the transaction
		/// <value>True if DCC is available, False otherwise</value>
		/// </summary>
		property DCCAllowed: boolean read get_DCCAllowed;
		/// <summary>
		/// Indicates whether DCC has been accepted by the customer
		/// <value>True if DCC has been accepted, False otherwise</value>
		/// </summary>
		property DCCAcepted: boolean read get_DCCAcepted;
		/// <summary>
		/// Foreign currency name to use
		/// </summary>
		property DCCForeignCurrencyName: wideString read get_DCCForeignCurrencyName;
		/// <summary>
		/// Numeric ISO code of the foreign currency to use
		/// </summary>
		property DCCForeignCurrencyCode: wideString read get_DCCForeignCurrencyCode;
		/// <summary>
		/// Alphanumeric ISO code of the foreign currency to use
		/// </summary>
		property DCCForeignCurrencyAlphaCode: wideString read get_DCCForeignCurrencyAlphaCode;
		/// <summary>
		/// Sales amount expressed in the foreign currency
		/// </summary>
		property DCCForeignCurrencyAmount: double read get_DCCForeignCurrencyAmount;
		/// <summary>
		/// Exchange rate used to compute the amounts in foreign currency
		/// </summary>
		property DCCForeignCurrencyRate: double read get_DCCForeignCurrencyRate;
		/// <summary>
		/// Number of decimals used for the foreign currency
		/// </summary>
		property DCCForeignCurrencyDecimal: integer read get_DCCForeignCurrencyDecimal;
		/// <summary>
		/// Date of the exchange rate currently used
		/// </summary>
		property DCCForeignCurrencyDate: wideString read get_DCCForeignCurrencyDate;
	end;

	/// <summary>
	/// Interface providing information regarding the payment card used for a transaction
	/// </summary>
	/// This interface provides information regarding the payment card used for a transaction
	/// <seealso cref="IMC_CATParamsIn" transaction input parameters/>
	IMC_CATPICardData = interface(IMC_VersionedInterface)
		['{4822E891-2946-4B1E-BAC6-EC2532EEEB5E}']
		function get_CardNumber: wideString; stdcall;
		function get_CardExpirationDate: wideString; stdcall;
		function get_CVV2: wideString; stdcall;

		/// <summary>
		/// Returns the card number (or bank account)
		/// </summary>
		property cardNumber: wideString read get_CardNumber;
		/// <summary>
		/// Returns the card expiration date (Formatted as YYYYMM)
		/// </summary>
		property CardExpirationDate: wideString read get_CardExpirationDate;
		/// <summary>
		/// Returns the card CVV2 code
		/// </summary>
		property CVV2: wideString read get_CVV2;
	end;

	/// <summary>
	/// Interface providing information regarding spread payments for a transaction
	/// </summary>
	/// This interface provides the information regarding spread payments for a transaction
	/// <seealso cref="IMC_CATParamsIn" transaction input parameters/>
	IMC_CATPILoanData = interface(IMC_VersionedInterface)
		['{B035C3A1-23EC-424A-9CB6-190CC0B73006}']
		function get_TermQty: integer; stdcall;
		function get_BirthDay: wideString; stdcall;

		/// <summary>
		/// Returns the quantity of terms requested
		/// </summary>
		property TermQty: integer read get_TermQty;
		/// <summary>
		/// Retuns the the cardholder birthday
		/// </summary>
		property BirthDay: wideString read get_BirthDay;
	end;

	/// <summary>
	/// Interface providing information regarding a cheque used in a transaction
	/// </summary>
	/// This interface provides information regarding a cheque used in a transaction
	/// <seealso cref="IMC_CATParamsIn" transaction input parameters/>
	IMC_CATPIChequeData = interface(IMC_VersionedInterface)
		['{B90811F0-0C68-421C-A5CE-7454B9729FBF}']
		function get_BankNumber: wideString; stdcall;
		function get_AccountNumber: wideString; stdcall;
		function get_serialNumber: wideString; stdcall;

		/// <summary>
		/// Returns the cheque's bank code
		/// </summary>
		property BankNumber: wideString read get_BankNumber;
		/// <summary>
		/// Returns the account number linked to the cheque
		/// </summary>
		property AccountNumber: wideString read get_AccountNumber;
		/// <summary>
		/// Returns the cheque serial number
		/// </summary>
		property serialNumber: wideString read get_serialNumber;
	end;

	/// <summary>
	/// Version 2 of interface providing information regarding a cheque used in a transaction
	/// </summary>
	/// This is the second version of interface that provides the specific information regarding a cheque used in a transaction
	/// <seealso cref="IMC_CATParamsIn" transaction input parameters/>
	/// <seealso cref="IMC_CATPIChequeData" Detailed cheque data input parameters/>
	IMC_CATPIChequeDataV2 = interface(IMC_CATPIChequeData)
		['{EFE537B4-0917-450D-B38A-F23E45EE5410}']
		function get_MICR: wideString; stdcall;

		/// <summary>
		/// Returns the cheque serial number
		/// </summary>
		property MICR: wideString read get_MICR;
	end;

	/// <summary>
	/// Interface providing the transaction parameters
	/// </summary>
	/// This interface profices the information required by the CAT to process a transaction
	/// <seealso cref="IMC_CATParamsIn" transaction input parameters/>
	IMC_CATPITransac = interface(IMC_VersionedInterface)
		['{83572DFF-8F43-4E01-A003-E0E88FC5A60C}']
		function get_TransacType: TMC_CATTransactionType; stdcall;
		function get_ReceiptRef: wideString; stdcall;
		function get_ReceiptNum: wideString; stdcall;
		function get_TotalAmount: double; stdcall;
		function get_Clerk: wideString; stdcall;
		function get_CardType: TMC_CATCardType; stdcall;
		function get_PaymentMode: wideString; stdcall;
		function get_Date: wideString; stdcall;
		function get_Hour: wideString; stdcall;
		function get_RefundRef: wideString; stdcall;
		function get_RefundAutNum: wideString; stdcall;
		function get_ForcedAutNum: wideString; stdcall;
		function get_DCC: IMC_CATPIDCC; stdcall;
		function get_CardData: IMC_CATPICardData; stdcall;
		function get_LoanData: IMC_CATPILoanData; stdcall;
		function get_ChequeData: IMC_CATPIChequeData; stdcall;
		function get_CashSessionID: wideString; stdcall;

		/// <summary>
		/// Transaction type
		/// </summary>
		/// <seealso cref="TMC_CATTransactionType" Transaction types/>
		property transacType: TMC_CATTransactionType read get_TransacType;
		/// <summary>
		/// Receipt reference
		/// </summary>
		property receiptRef: wideString read get_ReceiptRef;
		/// <summary>
		/// Receipt number
		/// </summary>
		property receiptNum: wideString read get_ReceiptNum;
		/// <summary>
		/// Total amount
		/// </summary>
		property totalAmount: double read get_TotalAmount;
		/// <summary>
		/// Clerk identifier
		/// </summary>
		property clerk: wideString read get_Clerk;
		/// <summary>
		/// Type of payment card
		/// </summary>
		/// <seealso cref="TMC_CATCardType" Card types/>
		property cardType: TMC_CATCardType read get_CardType;
		/// <summary>
		/// Means of payment (not codified)
		/// </summary>
		property paymentMode: wideString read get_PaymentMode;
		/// <summary>
		/// Receipt date
		/// <value>Receipt date formatted as ddmmyyyy</value>
		/// </summary>
		property date: wideString read get_Date;
		/// <summary>
		/// Receipt time
		/// <value>Receipt time formatted as hhmmss</value>
		/// </summary>
		property hour: wideString read get_Hour;
		/// <summary>
		/// For refund or void: reference of the original transaction
		/// </summary>
		/// <seealso cref="IMC_CATPOTransac.approvedTransactionNumber" Transaction number/>
		property refundRef: wideString read get_RefundRef;
		/// <summary>
		/// For refund or void: authorization number of the original transaction
		/// </summary>
		/// <seealso cref="IMC_CATPOTransac.ApprovedAuthNum" Transaction authorization number/>
		property refundAutNum: wideString read get_RefundAutNum;
		/// <summary>
		/// Forced authorization number
		/// </summary>
		/// <seealso cref="ttForcedPurchase" forced sales transaction type/>
		/// <seealso cref="ttForcedVoidPurchase" forced void sales transaction type/>
		/// <seealso cref="ttForcedRefund" forced refund transaction type/>
		/// <seealso cref="ttForcedVoidRefund" forced void refund transaction type/>
		/// <seealso cref="ttForcedCheque" forced cheque transaction type/>
		/// <seealso cref="caCATManageForcedPurchase" Capability of the CAT to manage a forced sales/>
		/// <seealso cref="caCATManageForcedVoidPurchase" Capability of the CAT to manage a forced void sales/>
		/// <seealso cref="caCATManageForcedRefund" Capability of the CAT to manage a forced refund/>
		/// <seealso cref="caCATManageForcedVoidRefund" Capability of the CAT to manage a forced void refund/>
		property ForcedAutNum: wideString read get_ForcedAutNum;
		/// <summary>
		/// Reference to the interface which provides information regarding DCC (Dynamic Currency Conversion)
		/// </summary>
		property DCC: IMC_CATPIDCC read get_DCC;
		/// <summary>
		/// Reference to the interface which provides information regarding the payment card
		/// </summary>
		property CardData: IMC_CATPICardData read get_CardData;
		/// <summary>
		/// Reference to the interface which provides information regarding payment spread
		/// </summary>
		property LoanData: IMC_CATPILoanData read get_LoanData;
		/// <summary>
		/// Reference to the interface which provides information regarding the cheque
		/// </summary>
		property chequeData: IMC_CATPIChequeData read get_ChequeData;
		/// <summary>
		/// Till session Identifier
		/// </summary>
		property CashSessionID: wideString read get_CashSessionID;
	end;

	/// <summary>
	/// Version 2 of interface providing the transaction parameters
	/// </summary>
	/// This is the second version of interface that provides the specific information required to process transactions
	/// <seealso cref="IMC_CATParamsIn" transaction input parameters/>
	/// <seealso cref="IMC_CATPITransac" Detailed transaction input parameters/>
	IMC_CATPITransacV2 = interface(IMC_CATPITransac)
		['{2090EC0F-742C-47E8-829D-14F578374AA3}']
		function get_RefundTransacToken: wideString; stdcall;
		function get_StoreId: wideString; stdcall;

		/// <summary>
		/// For refund or void: Token coming from original transaction, to be referenced when executing a refund or a void transaction.
		/// </summary>
		/// <seealso cref="IMC_CATPOTransacV3.TransactionToken" Token provided by CAT device/>
		property RefundTransacToken: wideString read get_RefundTransacToken;
		/// <summary>
		/// Code who identifies the store (or shop) on a transaction
		/// </summary>
		property StoreId: wideString read get_StoreId;
	end;

	/// <summary>
	/// Version 3 of interface providing the transaction parameters
	/// </summary>
	/// This is the third version of interface that provides the specific information required to process transactions
	/// <seealso cref="IMC_CATParamsIn" transaction input parameters/>
	/// <seealso cref="IMC_CATPITransac" Detailed transaction input parameters/>
	/// <seealso cref="IMC_CATPITransacV2" Detailed transaction input parameters (version 2)/>
	IMC_CATPITransacV3 = interface(IMC_CATPITransacV2)
		['{A52A594A-45E8-42CF-AA30-13235225A3B5}']
		function get_TerminalPrivateData: wideString; stdcall;
		function get_ForcedTransacToken: wideString; stdcall;

		/// <summary>
		/// Brings to CAT Private data provided by it-self during a previous validation transaction.
		/// </summary>
		property TerminalPrivateData: wideString read get_TerminalPrivateData;
		/// <summary>
		/// Brings to CAT Token transaction for forced transactions.
		/// </summary>
		property ForcedTransacToken: wideString read get_ForcedTransacToken;
	end;

	/// <summary>
	/// Version 4 of interface providing the transaction parameters
	/// </summary>
	/// This is the fourth version of interface that provides the specific information required to process transactions
	/// <seealso cref="IMC_CATParamsIn" transaction input parameters/>
	/// <seealso cref="IMC_CATPITransac" Detailed transaction input parameters/>
	/// <seealso cref="IMC_CATPITransacV2" Detailed transaction input parameters (version 2)/>
	/// <seealso cref="IMC_CATPITransacV3" Detailed transaction input parameters (version 3)/>
	IMC_CATPITransacV4 = interface(IMC_CATPITransacV3)
		['{7FF2DE30-98E0-4042-9C7F-DF3CDE4EFCE3}']
		function get_CustomerId: wideString; stdcall;
		function get_RegisterId: wideString; stdcall;

		/// <summary>
		/// Code who identifies the customer of the transaction in the register application
		/// if the customer of the transaction is an identified client, that is, he is not a fictitious customer.
		/// </summary>
		property CustomerId: wideString read get_CustomerId;
		/// <summary>
		/// Code who identifies the register on a transaction in the register application.
		/// </summary>
		property RegisterId: wideString read get_RegisterId;
	end;

	/// <summary>
	/// Version 5 of interface providing the transaction parameters
	/// </summary>
	/// This is the fifth version of interface that provides the specific information required to process transactions
	/// <seealso cref="IMC_CATParamsIn" transaction input parameters/>
	/// <seealso cref="IMC_CATPITransac" Detailed transaction input parameters/>
	/// <seealso cref="IMC_CATPITransacV2" Detailed transaction input parameters (version 2)/>
	/// <seealso cref="IMC_CATPITransacV3" Detailed transaction input parameters (version 3)/>
	/// <seealso cref="IMC_CATPITransacV4" Detailed transaction input parameters (version 4)/>
	IMC_CATPITransacV5 = interface(IMC_CATPITransacV4)
		['{5C636DAB-7579-4362-8EAC-ED012C8F2EFE}']
		function get_IsTaxRefundRequested: TMC_CATDetaxeStatus; stdcall;

		/// <summary>
		/// Indicates whether tax refund is requested for the transaction
		/// </summary>
		property IsTaxRefundRequested: TMC_CATDetaxeStatus read get_IsTaxRefundRequested;
	end;

	/// <summary>
	/// Interface providing CAT link initialization parameters
	/// </summary>
	/// This interface provides the information required to initialise the link with the CAT
	/// <seealso cref="IMC_CATParamsIn" transaction input parameters/>
	IMC_CATPIInit = interface(IMC_VersionedInterface)
		['{5824C5A7-C149-4464-B837-E0632BF42A54}']
		function get_ExecID: wideString; stdcall;
		function get_ExecVersion: wideString; stdcall;

		/// <summary>
		/// Executable identifier
		/// </summary>
		property ExecID: wideString read get_ExecID;
		/// <summary>
		/// Executable version number
		/// </summary>
		property ExecVersion: wideString read get_ExecVersion;
	end;

	/// <summary>
	/// Interface providing CAT reporting parameters
	/// </summary>
	/// This interface provides the information required to define the type of reports used in transactions
	/// <seealso cref="IMC_CATParamsIn" transaction input parameters/>
	IMC_CATPIReport = interface(IMC_VersionedInterface)
		['{64374E36-F19E-4EF7-9C7F-1053C87C78B1}']
		function get_ReportType: TMC_CATReportType; stdcall;
		function get_Clerk: wideString; stdcall;
		function get_Date: wideString; stdcall;

		/// <summary>
		/// Returns the type of report identifier
		/// </summary>
		/// <seealso cref="TMC_CATReportType" transaction reporting types/>
		property reportType: TMC_CATReportType read get_ReportType;
		/// <summary>
		/// Returns the name of the clerk associated with the report
		/// </summary>
		property clerk: wideString read get_Clerk;
		/// <summary>
		/// Returns the transaction printing date (using the following format: "DDMMYYYY[hhmmss]")
		/// </summary>
		property date: wideString read get_Date;
	end;

	/// <summary>
	/// Interface providing specific gift card parameters
	/// </summary>
	/// This interface provides the specific information required to process gift cards
	/// <seealso cref="IMC_CATParamsIn" transaction input parameters/>
	IMC_CATPIGiftCard = interface(IMC_VersionedInterface)
		['{CCE9B16E-8779-40E4-A61A-84D2CFDDE244}']
		function get_ReceiptRef: wideString; stdcall;
		function get_ReceiptNum: wideString; stdcall;
		function get_Amount: double; stdcall;
		function get_Clerk: wideString; stdcall;
		function get_Date: wideString; stdcall;
		function get_Hour: wideString; stdcall;
		function get_CardData: IMC_CATPICardData; stdcall;
		function get_CashSessionID: wideString; stdcall;

		/// <summary>
		/// Receipt reference
		/// </summary>
		property receiptRef: wideString read get_ReceiptRef;
		/// <summary>
		/// Receipt number
		/// </summary>
		property receiptNum: wideString read get_ReceiptNum;
		/// <summary>
		/// Total amount
		/// </summary>
		property Amount: double read get_Amount;
		/// <summary>
		/// Clerk identifier
		/// </summary>
		property clerk: wideString read get_Clerk;
		/// <summary>
		/// Receipt date
		/// <value>Receipt date formatted as ddmmyyyy</value>
		/// </summary>
		property date: wideString read get_Date;
		/// <summary>
		/// Receipt time
		/// <value>Receipt time formatted as hhmmss</value>
		/// </summary>
		property hour: wideString read get_Hour;
		/// <summary>
		/// Reference to the interface which provides information regarding the payment card
		/// </summary>
		property CardData: IMC_CATPICardData read get_CardData;
		/// <summary>
		/// Till session Identifier
		/// </summary>
		property CashSessionID: wideString read get_CashSessionID;
	end;

	/// <summary>
	/// Version 2 of interface providing the gift card parameters
	/// </summary>
	/// This is the second version of interface that provides the specific information required to process gift cards
	/// <seealso cref="IMC_CATParamsIn" transaction input parameters/>
	/// <seealso cref="IMC_CATPIGiftCard" Detailed gift card transaction input parameters/>
	IMC_CATPIGiftCardV2 = interface(IMC_CATPIGiftCard)
		['{89249519-7191-4692-B7E6-CA114504DEDE}']
		function get_StoreId: wideString; stdcall;

		/// <summary>
		/// Store identifier
		/// </summary>
		property StoreId: wideString read get_StoreId;
	end;

	/// <summary>
	/// Version 3 of interface providing the gift card parameters
	/// </summary>
	/// This is the third version of interface that provides the specific information required to process gift cards
	/// <seealso cref="IMC_CATParamsIn" transaction input parameters/>
	/// <seealso cref="IMC_CATPIGiftCard" Detailed gift card transaction input parameters/>
	/// <seealso cref="IMC_CATPIGiftCardV2" Detailed gift card transaction input parameters (version 2)/>
	IMC_CATPIGiftCardV3 = interface(IMC_CATPIGiftCardV2)
		['{18F04866-DB69-4CDC-AEA8-7E049AFCCC07}']
		function get_RefundTransacToken: wideString; stdcall;
		function get_RefundRef: wideString; stdcall;

		/// <summary>
		/// For refund or void: Token comming from original transaction to be used on a refund or a void transaction
		/// </summary>
		/// <seealso cref="IMC_CATPOGiftCardV3.TransactionToken" Transaction token provided by authorization center/>
		property RefundTransacToken: wideString read get_RefundTransacToken;
		/// <summary>
		/// For refund or void: Reference comming from original transaction to be used on a refund or a void transaction
		/// </summary>
		/// <seealso cref="IMC_CATPOGiftCard.OperationNumber" Operation number/>
		property refundRef: wideString read get_RefundRef;
	end;

	/// <summary>
	/// Version 4 of interface providing the gift card parameters
	/// </summary>
	/// This is the fourth version of interface that provides the specific information required to process gift cards
	/// <seealso cref="IMC_CATParamsIn" transaction input parameters/>
	/// <seealso cref="IMC_CATPIGiftCard" Detailed gift card transaction input parameters/>
	/// <seealso cref="IMC_CATPIGiftCardV2" Detailed gift card transaction input parameters (version 2)/>
	/// <seealso cref="IMC_CATPIGiftCardV3" Detailed gift card transaction input parameters (version 3)/>
	IMC_CATPIGiftCardV4 = interface(IMC_CATPIGiftCardV3)
		['{FCB84595-FD3D-4CCE-AC20-B20E7FCE07C8}']
		function get_TerminalPrivateData: wideString; stdcall;

		/// <summary>
		/// Brings to CAT Private data provided by it-self during a previous gift card transaction.
		/// <7summary>
		property TerminalPrivateData: wideString read get_TerminalPrivateData;
	end;

	/// <summary>
	/// Version 5 of interface providing the gift card parameters
	/// </summary>
	/// This is the fifth version of interface that provides the specific information required to process gift cards
	/// <seealso cref="IMC_CATParamsIn" transaction input parameters/>
	/// <seealso cref="IMC_CATPIGiftCard" Detailed gift card transaction input parameters/>
	/// <seealso cref="IMC_CATPIGiftCardV2" Detailed gift card transaction input parameters (version 2)/>
	/// <seealso cref="IMC_CATPIGiftCardV3" Detailed gift card transaction input parameters (version 3)/>
	/// <seealso cref="IMC_CATPIGiftCardV4" Detailed gift card transaction input parameters (version 4)/>
	IMC_CATPIGiftCardV5 = interface(IMC_CATPIGiftCardV4)
		['{DBCF4149-50D1-444D-B7F8-D0895F7B20BA}']
		function get_CustomerId: wideString; stdcall;
		function get_RegisterId: wideString; stdcall;

		/// <summary>
		/// Code who identifies the customer of the transaction in the register application
		/// if the customer of the transaction is an identified client, that is, he is not a fictitious customer.
		/// </summary>
		property CustomerId: wideString read get_CustomerId;

		/// <summary>
		/// Code who identifies the register on a transaction in the register application.
		/// </summary>
		property RegisterId: wideString read get_RegisterId;
	end;

	/// <summary>
	/// Version 6 of interface providing the gift card parameters
	/// </summary>
	/// This is the fifth version of interface that provides the specific information required to process gift cards
	/// <seealso cref="IMC_CATParamsIn" transaction input parameters/>
	/// <seealso cref="IMC_CATPIGiftCard" Detailed gift card transaction input parameters/>
	/// <seealso cref="IMC_CATPIGiftCardV2" Detailed gift card transaction input parameters (version 2)/>
	/// <seealso cref="IMC_CATPIGiftCardV3" Detailed gift card transaction input parameters (version 3)/>
	/// <seealso cref="IMC_CATPIGiftCardV4" Detailed gift card transaction input parameters (version 4)/>
	/// <seealso cref="IMC_CATPIGiftCardV5" Detailed gift card transaction input parameters (version 5)/>
	IMC_CATPIGiftCardV6 = interface(IMC_CATPIGiftCardV5)
		['{0AB15BA9-F0B6-4FA3-AC21-2BEBF82B1018}']
		function get_RefundAutNum: wideString; stdcall;

		/// <summary>
		/// For refund or void: authorization number of the original transaction
		/// </summary>
		/// <seealso cref="IMC_CATPOGiftCardV3.ApprovedAuthNum" Transaction authorization number/>
		property refundAutNum: wideString read get_RefundAutNum;
	end;

	/// <summary>
	/// Interface providing the parameters required by the Command method
	/// </summary>
	/// This interface provides the information required by the CAT to process a transaction
	/// <seealso cref="IMC_CATParamsIn" transaction input parameterss/>
	IMC_CATParamsIn = interface(IMC_VersionedInterface)
		['{52647354-4C6C-4B55-A12D-E3F541BE5DA2}']
		function get_Currency: IMC_CATPICurrency; stdcall;
		function get_Transac: IMC_CATPITransac; stdcall;
		function get_Init: IMC_CATPIInit; stdcall;
		function get_Report: IMC_CATPIReport; stdcall;
		function get_GiftCard: IMC_CATPIGiftCard; stdcall;

		/// <summary>
		/// Reference to the interface which provides information regarding the currency
		/// </summary>
		property currency: IMC_CATPICurrency read get_Currency;
		/// <summary>
		/// Reference to the interface which provides information regarding the transaction
		/// </summary>
		property Transac: IMC_CATPITransac read get_Transac;
		/// <summary>
		/// Reference to the interface which provides information regarding the link initialization
		/// </summary>
		property Init: IMC_CATPIInit read get_Init;
		/// <summary>
		/// Reference to the interface which provides information regarding the report
		/// </summary>
		property report: IMC_CATPIReport read get_Report;
		/// <summary>
		/// Reference to the interface which provides information regarding the Gift cards management
		/// </summary>
		property GiftCard: IMC_CATPIGiftCard read get_GiftCard;
	end;

	/// <summary>
	/// Interface providing the parameters regarding DCC (Dynamic Currency Conversion)
	/// </summary>
	/// This interface provides the information regarding DCC in the transaction
	/// <seealso cref="IMC_CATParamsOut" Transaction execution results/>
	IMC_CATPODCC = interface(IMC_VersionedInterface)
		['{8D23393A-89BE-4EF1-85E1-552E47F20D04}']
		function get_DCCAllowed: boolean; stdcall;
		function get_DCCAccepted: boolean; stdcall;
		function get_DCCResultCOde: integer; stdcall;
		function get_DCCMessage: wideString; stdcall;
		function get_DCCForeignCurrencyName: wideString; stdcall;
		function get_DCCForeignCurrencyCode: wideString; stdcall;
		function get_DCCForeignCurrencyAlphaCode: wideString; stdcall;
		function get_DCCForeignCurrencyAmount: double; stdcall;
		function get_DCCForeignCurrencyRate: double; stdcall;
		function get_DCCForeignCurrencyDecimal: integer; stdcall;
		function get_DCCForeignCurrencyDate: wideString; stdcall;

		/// <summary>
		/// DCC allowed
		/// </summary>
		property DCCAllowed: boolean read get_DCCAllowed;
		/// <summary>
		/// DCC accepted by the customer
		/// </summary>
		property DCCAccepted: boolean read get_DCCAccepted;
		/// <summary>
		/// DCC result code
		/// </summary>
		property DCCResultCode: integer read get_DCCResultCOde;
		/// <summary>
		/// Information message returned by the DCC authority
		/// </summary>
		property DCCMessage: wideString read get_DCCMessage;
		/// <summary>
		/// Foreign currency name
		/// </summary>
		property DCCForeignCurrencyName: wideString read get_DCCForeignCurrencyName;
		/// <summary>
		/// Foreign currency numeric ISO code
		/// </summary>
		property DCCForeignCurrencyCode: wideString read get_DCCForeignCurrencyCode;
		/// <summary>
		/// Foreign currency alphanumeric ISO code
		/// </summary>
		property DCCForeignCurrencyAlphaCode: wideString read get_DCCForeignCurrencyAlphaCode;
		/// <summary>
		/// Transaction amount expressed using the foreign currency
		/// </summary>
		property DCCForeignCurrencyAmount: double read get_DCCForeignCurrencyAmount;
		/// <summary>
		/// Exchange rate used for the foreign currency
		/// </summary>
		property DCCForeignCurrencyRate: double read get_DCCForeignCurrencyRate;
		/// <summary>
		/// Number of decimals used to display amounts expressed in the foreign currency
		/// </summary>
		property DCCForeignCurrencyDecimal: integer read get_DCCForeignCurrencyDecimal;
		/// <summary>
		/// Date of the exchange rate used for the foreign currency
		/// </summary>
		property DCCForeignCurrencyDate: wideString read get_DCCForeignCurrencyDate;
	end;

	/// <summary>
	/// Interface providing information regarding the execution of a transaction
	/// </summary>
	/// This interface provides information regarding the execution of a transaction
	/// <seealso cref="IMC_CATParamsOut" Transaction execution results/>
	IMC_CATPOTransac = interface(IMC_VersionedInterface)
		['{8FF9A526-EDB5-4D10-8477-41D5EE6F8093}']
		function get_ResultCode: wideString; stdcall;
		function get_approvedModeTxt: wideString; stdcall;
		function get_ApprovedTransactionNumber: wideString; stdcall;
		function get_ApprovedAmount: double; stdcall;
		function get_ApprovedCurrency: wideString; stdcall;
		function get_ApprovedCurKind: TMC_CATCurrencyKindCode; stdcall;
		function get_CardNumber: wideString; stdcall;
		function get_CardExpirationDate: wideString; stdcall;
		function get_CardOwnerName: wideString; stdcall;
		function get_ApprovedAuthNum: wideString; stdcall;
		function get_ApprovedPaymentMode: wideString; stdcall;
		function get_CMC7: wideString; stdcall;
		function get_DCC: IMC_CATPODCC; stdcall;
		function get_DetaxeStatus: TMC_CATDetaxeStatus; stdcall;
		function get_MustSign: TMC_CATMustSign; stdcall;
		function get_ExtraData: wideString; stdcall;
		function get_TermQty: integer; stdcall;
		function get_GiftCardCreditLeft: double; stdcall;
		function get_CreditLeftCurrency: wideString; stdcall;
		function get_CreditLeftCurKind: TMC_CATCurrencyKindCode; stdcall;

		/// <summary>
		/// Result code, issued by the authorization centre
		/// </summary>
		property resultCode: wideString read get_ResultCode;
		/// <summary>
		/// Transaction approbation mode
		/// </summary>
		property approvedModeTxt: wideString read get_approvedModeTxt;
		/// <summary>
		/// Transaction number
		/// </summary>
		property approvedTransactionNumber: wideString read get_ApprovedTransactionNumber;
		/// <summary>
		/// Transaction amount
		/// </summary>
		property approvedAmount: double read get_ApprovedAmount;
		/// <summary>
		/// Transaction currency
		/// </summary>
		property approvedCurrency: wideString read get_ApprovedCurrency;
		/// <summary>
		/// Transaction currency identifier
		/// </summary>
		/// <seealso cref="TMC_CATCurrencyKindCode" currency code identifier/>
		property approvedCurKind: TMC_CATCurrencyKindCode read get_ApprovedCurKind;
		/// <summary>
		/// Payment card number (or bank account)
		/// </summary>
		/// This property is deprecated, it is preferable to use <see cref="IMC_CATPOCardData"/> interface.
		/// <seealso cref="IMC_CATPOTransacV2.CardData" to set the metadata of the card/>
		property cardNumber: wideString read get_CardNumber;
		/// <summary>
		/// Payment card expiration date (Formatted as YYYYMM)
		/// </summary>
		/// This property is deprecated, it is preferable to use <see cref="IMC_CATPOCardDataV2"/> interface.
		property CardExpirationDate: wideString read get_CardExpirationDate;
		/// <summary>
		/// Payment card owner name
		/// </summary>
		/// This property is deprecated, it is preferable to use <see cref="IMC_CATPOCardDataV2"/> interface.
		property cardOwnerName: wideString read get_CardOwnerName;
		/// <summary>
		/// Transaction authorization number
		/// </summary>
		property ApprovedAuthNum: wideString read get_ApprovedAuthNum;
		/// <summary>
		/// Approved payment mode
		/// </summary>
		property approvedPaymentMode: wideString read get_ApprovedPaymentMode;
		/// <summary>
		/// CMC7 track number (cheque number)
		/// </summary>
		property CMC7: wideString read get_CMC7;
		/// <summary>
		/// Indicates whether the transaction is eligible for tax refund
		/// </summary>
		property DetaxeStatus: TMC_CATDetaxeStatus read get_DetaxeStatus;
		/// <summary>
		/// Returns whether the customer must sign the transaction receipt
		/// </summary>
		property MustSign: TMC_CATMustSign read get_MustSign;
		/// <summary>
		/// Return extra data, only to be used by the client application
		/// </summary>
		property ExtraData: wideString read get_ExtraData;
		/// <summary>
		/// Returns the number of terms (usually 1)
		/// </summary>
		property TermQty: integer read get_TermQty;
		/// <summary>
		/// Retuns information regarding DCC
		/// </summary>
		property DCC: IMC_CATPODCC read get_DCC;
		/// <summary>
		/// Credit left on the Gift card
		/// </summary>
		property GiftCardCreditLeft: double read get_GiftCardCreditLeft;
		/// <summary>
		/// Credit Left currency
		/// </summary>
		property CreditLeftCurrency: wideString read get_CreditLeftCurrency;
		/// <summary>
		/// Credit left currency identifier
		/// </summary>
		/// <seealso cref="TMC_CATCurrencyKindCode" currency code identifier/>
		property CreditLeftCurKind: TMC_CATCurrencyKindCode read get_CreditLeftCurKind;
	end;

	/// <summary>
	/// Interface providing information regarding the payment card used for the transaction
	/// </summary>
	/// This interface provides information regarding the payment card used for the transaction
	/// <seealso cref="IMC_CATParamsOut" transaction output parameters/>
	IMC_CATPOCardData = interface(IMC_VersionedInterface)
		['{4DE2FBFC-4FE8-4668-8BCC-6EE2E2E704A7}']
		function get_MII: wideString; stdcall;
		function get_IIN: wideString; stdcall;
		function get_IAI: wideString; stdcall;
		function get_Check: wideString; stdcall;
		function get_Masked: boolean; stdcall;

		/// <summary>
		/// If not null, it provides the Major Industry Identifier (MII) of the card
		/// </summary>
		property MII: wideString read get_MII;
		/// <summary>
		/// If not null, it provides the Issuer Identification Number (IIN) of the card.
		/// IIN includes MII also.
		/// </summary>
		property IIN: wideString read get_IIN;
		/// <summary>
		/// If not null, it provides the Individual Account Identifier (IAI) of the card
		/// </summary>
		property IAI: wideString read get_IAI;
		/// <summary>
		/// If not null, it provides the check of the card
		/// </summary>
		property Check: wideString read get_Check;
		/// <summary>
		/// is the IAI masked?
		/// </summary>
		property masked: boolean read get_Masked;
	end;

	/// <summary>
	/// Version 2 of interface providing information regarding the payment card used for the transaction
	/// </summary>
	/// This is the second version of interface that provides the specific information regarding the payment card used for the transaction
	/// <seealso cref="IMC_CATParamsOut" transaction output parameters/>
	/// <seealso cref="IMC_CATPOCardData" Detailed card data/>
	IMC_CATPOCardDataV2 = interface(IMC_CATPOCardData)
		['{1058A263-9D47-4696-9F65-38E9ABA9FDAE}']
		function get_CardExpirationDate: wideString; stdcall;
		function get_CardOwnerName: wideString; stdcall;
		function get_CardCountry: wideString; stdcall;
		function get_CountryCodeKind: TMC_CATCountryKindCode; stdcall;
		function get_CardToken: wideString; stdcall;
		function get_CardTokenIssuer: wideString; stdcall;

		/// <summary>
		/// Payment card expiration date (Formatted as YYYYMM)
		/// </summary>
		property CardExpirationDate: wideString read get_CardExpirationDate;

		/// <summary>
		/// Payment card owner name
		/// </summary>
		property cardOwnerName: wideString read get_CardOwnerName;

		/// <summary>
		/// Issuer country code of the card
		/// </summary>
		property CardCountry: wideString read get_CardCountry;

		/// <summary>
		/// Type of the code of the issuer country
		/// </summary>
		/// <seealso cref="TMC_CATCountryKindCode" country code identifier/>
		property CountryCodeKind: TMC_CATCountryKindCode read get_CountryCodeKind;

		/// <summary>
		/// Token or alias of the card
		/// </summary>
		property CardToken: wideString read get_CardToken;

		/// <summary>
		/// Issuer of the card token
		/// </summary>
		property CardTokenIssuer: wideString read get_CardTokenIssuer;
	end;

	/// <summary>
	/// Version 2 of Interface providing information regarding the execution of a transaction
	/// </summary>
	/// This interface provides information regarding the execution of a transaction
	/// It provides the same information that <see cref="MC_PluginCATInterface.IMC_CATPOTransac"/> but it
	/// add new properties.
	/// <seealso cref="IMC_CATParamsOut" Transaction execution results/>
	/// <seealso cref="MC_PluginCATInterface.IMC_CATPOTransac" Detailed transaction execution results/>
	IMC_CATPOTransacV2 = interface(IMC_CATPOTransac)
		['{AD9EB694-A911-4809-A5B4-7161EB96C4B4}']
		function get_InstallmentPayment: wideString; stdcall;
		function get_CardData: IMC_CATPOCardData; stdcall;

		/// <summary>
		/// Return the method of payment approved (I. E.: Once Payment, divided Payment, ...)
		/// No translation is made by CPOS, Drivers values must be understandables by Cegid business applications.
		/// </summary>
		property InstallmentPayment: wideString read get_InstallmentPayment;

		/// <summary>
		/// If not null, it provides a new structure which tear down availible car number data.
		/// </summary>
		/// <seealso cref="IMC_CATPOCardDataV2" version 2of the interface to set the metadata of the card/>
		property CardData: IMC_CATPOCardData read get_CardData;
	end;

	/// <summary>
	/// Version 3 of Interface providing information regarding the execution of a transaction
	/// </summary>
	/// This interface provides information regarding the execution of a transaction
	/// It provides the same information that <see cref="MC_PluginCATInterface.IMC_CATPOTransac"/> and
	/// <see cref="MC_PluginCATInterface.IMC_CATPOTransacV2"/> but it add some new properties.
	/// <seealso cref="IMC_CATParamsOut" Transaction execution results/>
	/// <seealso cref="MC_PluginCATInterface.IMC_CATPOTransac" Detailed transaction execution results/>
	/// <seealso cref="MC_PluginCATInterface.IMC_CATPOTransacV2" Detailed transaction execution results (version 2)/>
	IMC_CATPOTransacV3 = interface(IMC_CATPOTransacV2)
		['{4562A098-E27E-461A-ADD7-C16470C498F4}']
		function get_CardNumberGettingWay: TMC_CATCardNumberGettingWay; stdcall;
		function get_AuthNumGettingWay: TMC_CATAuthNumGettingWay; stdcall;
		function get_TransactionToken: wideString; stdcall;

		/// <summary>
		/// this property allows the CAT driver to show how the card numnber has been get
		/// <seealso cref="TMC_CATCardNumberGettingWay" Available ways to get Card number/>
		/// </summary>
		property CardNumberGettingWay: TMC_CATCardNumberGettingWay read get_CardNumberGettingWay;
		/// <summary>
		/// this property allows the CAT driver to show how the Authorization numnber has been get
		/// <seealso cref="TMC_CATAuthNumGettingWay" Available ways to get authorization numbers/>
		/// </summary>
		property AuthNumGettingWay: TMC_CATAuthNumGettingWay read get_AuthNumGettingWay;
		/// <summary>
		/// Token provided by CAT device (or authorization center) regarding executed transaction.
		/// </summary>
		property TransactionToken: wideString read get_TransactionToken;
	end;

	/// <summary>
	/// Version 4 of Interface providing information regarding the execution of a transaction
	/// </summary>
	/// This interface provides information regarding the execution of a transaction
	/// It provides the same information that <see cref="MC_PluginCATInterface.IMC_CATPOTransac"/>,
	/// <see cref="MC_PluginCATInterface.IMC_CATPOTransacV2"/> and <see cref="MC_PluginCATInterface.IMC_CATPOTransacV3"/> but it add some new properties.
	/// <seealso cref="IMC_CATParamsOut" Transaction execution results/>
	/// <seealso cref="MC_PluginCATInterface.IMC_CATPOTransac" Detailed transaction execution results/>
	/// <seealso cref="MC_PluginCATInterface.IMC_CATPOTransacV2" Detailed transaction execution results (version 2)/>
	/// <seealso cref="MC_PluginCATInterface.IMC_CATPOTransacV3" Detailed transaction execution results (version 3)/>
	IMC_CATPOTransacV4 = interface(IMC_CATPOTransacV3)
		['{BB3BF34D-1FC1-4545-91C6-BB0BFCD74D0C}']
		function get_GiftCardValidityEndDate: wideString; stdcall;

		/// <summary>
		/// Gift card date valiaity end date (Formatted as DDMMYYYY)
		/// </summary>
		property GiftCardValidityEndDate: wideString read get_GiftCardValidityEndDate;
	end;

	/// <summary>
	/// Version 5 of Interface providing information regarding the execution of a transaction
	/// </summary>
	/// This interface provides information regarding the execution of a transaction
	/// It provides the same information that <see cref="MC_PluginCATInterface.IMC_CATPOTransac"/>,
	/// <see cref="MC_PluginCATInterface.IMC_CATPOTransacV2"/> and <see cref="MC_PluginCATInterface.IMC_CATPOTransacV3"/> but it add some new properties.
	/// <seealso cref="IMC_CATParamsOut" Transaction execution results/>
	/// <seealso cref="MC_PluginCATInterface.IMC_CATPOTransac" Detailed transaction execution results/>
	/// <seealso cref="MC_PluginCATInterface.IMC_CATPOTransacV2" Detailed transaction execution results (version 2)/>
	/// <seealso cref="MC_PluginCATInterface.IMC_CATPOTransacV3" Detailed transaction execution results (version 3)/>
	/// <seealso cref="MC_PluginCATInterface.IMC_CATPOTransacV4" Detailed transaction execution results (version 4)/>
	IMC_CATPOTransacV5 = interface(IMC_CATPOTransacV4)
		['{6763C5D0-5ABE-4B29-91F5-D8619192FF1D}']
		function get_AuthCardType: TMC_CATCardType; stdcall;

		/// <summary>
		/// Type of payment card
		/// </summary>
		property AuthCardType: TMC_CATCardType read get_AuthCardType;
	end;

	/// <summary>
	/// Version 6 of Interface providing information regarding the execution of a transaction
	/// </summary>
	/// This interface provides information regarding the execution of a transaction
	/// It provides the same information that <see cref="MC_PluginCATInterface.IMC_CATPOTransac"/>,
	/// <see cref="MC_PluginCATInterface.IMC_CATPOTransacV2"/> and <see cref="MC_PluginCATInterface.IMC_CATPOTransacV3"/> but it add some new properties.
	/// <seealso cref="IMC_CATParamsOut" Transaction execution results/>
	/// <seealso cref="MC_PluginCATInterface.IMC_CATPOTransac" Detailed transaction execution results/>
	/// <seealso cref="MC_PluginCATInterface.IMC_CATPOTransacV2" Detailed transaction execution results (version 2)/>
	/// <seealso cref="MC_PluginCATInterface.IMC_CATPOTransacV3" Detailed transaction execution results (version 3)/>
	/// <seealso cref="MC_PluginCATInterface.IMC_CATPOTransacV4" Detailed transaction execution results (version 4)/>
	/// <seealso cref="MC_PluginCATInterface.IMC_CATPOTransacV5" Detailed transaction execution results (version 4)/>
	IMC_CATPOTransacV6 = interface(IMC_CATPOTransacV5)
		['{BA055EEF-A5D1-46E5-B051-D7AC1F8CFEA5}']
		function get_TerminalPrivateData: wideString; stdcall;

		/// <summary>
		/// Send to businees application any Private data produced during the execution of the transaction.
		/// <7summary>
		property TerminalPrivateData: wideString read get_TerminalPrivateData;
	end;

	/// <summary>
	/// Version 7 of Interface providing information regarding the execution of a transaction
	/// </summary>
	/// This interface provides information regarding the execution of a transaction
	/// It provides the same information that <see cref="MC_PluginCATInterface.IMC_CATPOTransac"/>,
	/// <see cref="MC_PluginCATInterface.IMC_CATPOTransacV2"/> and <see cref="MC_PluginCATInterface.IMC_CATPOTransacV3"/> but it add some new properties.
	/// <seealso cref="IMC_CATParamsOut" Transaction execution results/>
	/// <seealso cref="MC_PluginCATInterface.IMC_CATPOTransac" Detailed transaction execution results/>
	/// <seealso cref="MC_PluginCATInterface.IMC_CATPOTransacV2" Detailed transaction execution results (version 2)/>
	/// <seealso cref="MC_PluginCATInterface.IMC_CATPOTransacV3" Detailed transaction execution results (version 3)/>
	/// <seealso cref="MC_PluginCATInterface.IMC_CATPOTransacV4" Detailed transaction execution results (version 4)/>
	/// <seealso cref="MC_PluginCATInterface.IMC_CATPOTransacV5" Detailed transaction execution results (version 4)/>
	/// <seealso cref="MC_PluginCATInterface.IMC_CATPOTransacV6" Detailed transaction execution results (version 5)/>
	IMC_CATPOTransacV7 = interface(IMC_CATPOTransacV6)
		['{B1D8921B-6544-4D5B-B901-39D43052445E}']
		function get_CapturedSignature: wideString; stdcall;

		/// <summary>
		/// Keep the signature of the transaction, signature bitmap encoded in 64 base CBP string
		/// <7summary>
		property CapturedSignature: wideString read get_CapturedSignature;
	end;

	/// <summary>
	/// Version 8 of Interface providing information regarding the execution of a transaction
	/// </summary>
	/// This interface provides information regarding the execution of a transaction
	/// It provides the same information that <see cref="MC_PluginCATInterface.IMC_CATPOTransac"/>,
	/// <see cref="MC_PluginCATInterface.IMC_CATPOTransacV2"/> and <see cref="MC_PluginCATInterface.IMC_CATPOTransacV3"/> but it add some new properties.
	/// <seealso cref="IMC_CATParamsOut" Transaction execution results/>
	/// <seealso cref="MC_PluginCATInterface.IMC_CATPOTransac" Detailed transaction execution results/>
	/// <seealso cref="MC_PluginCATInterface.IMC_CATPOTransacV2" Detailed transaction execution results (version 2)/>
	/// <seealso cref="MC_PluginCATInterface.IMC_CATPOTransacV3" Detailed transaction execution results (version 3)/>
	/// <seealso cref="MC_PluginCATInterface.IMC_CATPOTransacV4" Detailed transaction execution results (version 4)/>
	/// <seealso cref="MC_PluginCATInterface.IMC_CATPOTransacV5" Detailed transaction execution results (version 5)/>
	/// <seealso cref="MC_PluginCATInterface.IMC_CATPOTransacV6" Detailed transaction execution results (version 6)/>
	/// <seealso cref="MC_PluginCATInterface.IMC_CATPOTransacV7" Detailed transaction execution results (version 7)/>
	IMC_CATPOTransacV8 = interface(IMC_CATPOTransacV7)
		['{3B5D1BE9-9B73-415E-8A5C-61581FBDAD05}']
		function get_TransactionIssuer: wideString; stdcall;

		/// <summary>
		/// Code who identifies the issuer of the transaction
		/// </summary>
		/// For example, it will be used by the application to determine whether the sales transaction references stored in the database
		/// are known by the payment system to refund a return of goods with the card used to pay for the sale.
		/// <seealso cref="caCATGetTransactionIssuer" Driver capabilities query/>
		/// <seealso cref="IMC_CATPITransac.refundRef" Reference of the original transaction/>
		/// <seealso cref="IMC_CATPITransac.refundAutNum" Authorization number of the original transaction/>
		/// <seealso cref="IMC_CATPITransacV2.RefundTransacToken" Token coming from original transaction/>
		/// <seealso cref="IMC_CATPITransacV3.TerminalPrivateData" CAT Private data from original transaction/>
		property TransactionIssuer: wideString read get_TransactionIssuer;
	end;

	/// <summary>
	/// This interface manages a list of interfaces <see cref="MC_PluginCATInterface.IMC_CATPOTransac"/>
	/// </summary>
	/// <seealso cref="MC_PluginCATInterface.IMC_CATPOTransac" Transaction parameters returned by the CAT/>
	IMC_CATPOTransacList = interface(IMC_ListVersionedInterface)
		['{5F291AEF-DCDF-467C-96FF-D7A888BE1376}']
		function get_TotalApprovedAmount: double; stdcall;
		procedure set_TotalApprovedAmount(afTotalApprovedAmount: double); stdcall;
		function get_Item(aiIndex: integer): IMC_CATPOTransac; stdcall;
		function get_Count: integer; stdcall;

		/// <summary>
		/// Adds transaction information.
		/// </summary>
		/// Adds a reference to a transaction information interface.
		/// <param name="acItem">A reference to the interface <see cref="MC_PluginCATInterface.IMC_CATPOTransac"/> to be added to the list</param>
		/// <returns>Index of the element in the list</returns>
		/// <seealso cref="MC_PluginCATInterface.IMC_CATPOTransac" Device information interface/>
		function add(acItem: IMC_CATPOTransac): integer; stdcall;
		/// <summary>
		/// Returns a reference to a transaction information interface
		/// </summary>
		/// Returns a reference to the transaction information interface found at index <paramref name="aiIndex"/> in the list.
		/// <param name="aiIndex">Index of the element to retrieve</param>
		/// <returns>A reference to the interface <see cref="MC_PluginCATInterface.IMC_CATPOTransac"/></returns>
		/// <remarks>
		/// An exception is raised whenever the given index is out of bounds
		/// </remarks>
		/// <seealso cref="MC_PluginCATInterface.IMC_CATPOTransac" Device information interface/>
		function get(aiIndex: integer): IMC_CATPOTransac; stdcall;
		/// <summary>
		/// Changes the reference of the element found at the given index
		/// </summary>
		/// Replaces the reference to the interface at index <paramref name="aiIndex"/> by a reference to the interface specified in <paramref name="acItem"/>
		/// <param name="aiIndex">Index of the element to change</param>
		/// zparam name="acItem">Reference to the interface <see cref="MC_PluginCATInterface.IMC_CATPOTransac"/> to put in the list </param>
		/// <remarks>
		/// An exception is raised whenever the given index is out of bounds
		/// </remarks>
		/// <seealso cref="MC_PluginCATInterface.IMC_CATPOTransac" Device information interface/>
		procedure put(aiIndex: integer; acItem: IMC_CATPOTransac); stdcall;
		/// <summary>
		/// Clears the list
		/// </summary>
		/// Removes all the reference found in the list
		procedure clear(); stdcall;
		/// <summary>
		/// Deletes an element of the list
		/// </summary>
		/// Deletes the element found at index <c aiIndex/> in the list
		/// <param name="aiIndex">Index of the element to delete from the list</param>
		/// <remarks>
		/// An exception is raised whenever the given index is out of bounds
		/// </remarks>
		/// <seealso cref="MC_PluginCATInterface.IMC_CATPOTransac" Device information interface/>
		procedure delete(aiIndex: integer); stdcall;
		/// <summary>
		/// Returns a reference to the first interface in the list
		/// </summary>
		/// Returns a reference to the first interface in the list
		/// <returns>Returns a reference to the first interface in the list; if the list is empty, returns nil</returns>
		/// <seealso cref="MC_PluginCATInterface.IMC_CATPOTransac" Device information interface/>
		function first(): IMC_CATPOTransac; stdcall;
		/// <summary>
		/// Returns the index of the element provided as a parameter
		/// </summary>
		/// Returns the index of the element provided in parameter <paramref name="acItem"/>
		/// <param name="acItem">Reference to the interface whose index is sought</param>
		/// <returns>The index of the reference, if found in the list: otherwise -1</returns>
		/// <seealso cref="MC_PluginCATInterface.IMC_CATPOTransac" Device information interface/>
		function indexOf(acItem: IMC_CATPOTransac): integer; stdcall;
		/// <summary>
		/// Inserts an element at the given index
		/// </summary>
		/// Inserts a reference to the interface <paramref name="acItem"/> at the index <paramref name="aiIndex"/>.
		/// <param name="aiIndex">Index where the element is to be inserted.</param>
		/// <param name="acItem">Reference to the interface to be inserted</param>
		/// <seealso cref="MC_PluginCATInterface.IMC_CATPOTransac" Device information interface/>
		procedure insert(aiIndex: integer; acItem: IMC_CATPOTransac); stdcall;
		/// <summary>
		/// Returns a reference to the last interface in the list
		/// </summary>
		/// Returns a reference to the last interface in the list.
		/// <returns>Returns a reference to the last interface in the list; if the list is empty, returns nil</returns>
		/// <seealso cref="MC_PluginCATInterface.IMC_CATPOTransac" Device information interface/>
		function last(): IMC_CATPOTransac; stdcall;
		/// <summary>
		/// Removes an element from the list
		/// </summary>
		/// Removes the element with the reference <paramref name="acItem"/> from the list.
		/// <param name="acItem">Reference to the interface <see cref="MC_PluginCATInterface.IMC_CATPOTransac"/> to remove from the list</param>
		/// <seealso cref="MC_PluginCATInterface.IMC_CATPOTransac" Device information interface/>
		procedure remove(acItem: IMC_CATPOTransac); stdcall;

		/// <summary>
		/// Provides acces to the elements
		/// </summary>
		/// This property provides a reference to the interface found at index <paramref name="aiIndex"/>.<p>
		/// The value of <paramref name="aiIndex"/> must be between 0 and <see cref="count"/>-1.
		/// <param name="aiIndex">Index of the element to get</param>
		/// <remarks>
		/// An exception is raised whenever the given index is out of bounds
		/// </remarks>
		/// <seealso cref="MC_PluginCATInterface.IMC_CATPOTransac" Device information interface/>
		property items[aiIndex: integer]: IMC_CATPOTransac read get_Item; default;
		/// <summary>
		/// Returns the total number of elements in the list
		/// </summary>
		/// Returns the total number of elements in the list
		property count: integer read get_Count;
		/// <summary>
		/// Retuns the total approved amount
		/// </summary>
		/// Retuns the total approved amount
		property TotalApprovedAmount: double read get_TotalApprovedAmount write set_TotalApprovedAmount;
	end;

	/// <summary>
	/// Interface providing information regarding a gift card operation
	/// </summary>
	/// This interface provides information regarding the gift card management
	/// <seealso cref="IMC_CATParamsOut" Transaction execution results/>
	IMC_CATPOGiftCard = interface(IMC_VersionedInterface)
		['{B31098B4-03D4-44B3-9441-4D451222B660}']
		function get_GiftCardActivated: boolean; stdcall;
		function get_OperationNumber: wideString; stdcall;
		function get_OperationAmount: double; stdcall;
		function get_Currency: wideString; stdcall;
		function get_CurKind: TMC_CATCurrencyKindCode; stdcall;
		function get_CardNumber: wideString; stdcall;
		function get_CardExpirationDate: wideString; stdcall;
		function get_CreditLeft: double; stdcall;
		function get_CreditLeftCurrency: wideString; stdcall;
		function get_CreditLeftCurKind: TMC_CATCurrencyKindCode; stdcall;

		/// <summary>
		/// Returns the gift card activation status
		/// <value>True if the gift card is activated, False otherwise</value>
		/// </summary>
		property giftCardActivated: boolean read get_GiftCardActivated;
		/// <summary>
		/// Operation number
		/// </summary>
		property OperationNumber: wideString read get_OperationNumber;
		/// <summary>
		/// Operation Amount
		/// </summary>
		property OperationAmount: double read get_OperationAmount;
		/// <summary>
		/// currency
		/// </summary>
		property currency: wideString read get_Currency;
		/// <summary>
		/// currency identifier
		/// </summary>
		/// <seealso cref="TMC_CATCurrencyKindCode" currency code identifier/>
		property CurKind: TMC_CATCurrencyKindCode read get_CurKind;
		/// <summary>
		/// Gift card number
		/// </summary>
		property cardNumber: wideString read get_CardNumber;
		/// <summary>
		/// Gift card expiration date (Formatted as YYYYMM)
		/// </summary>
		property CardExpirationDate: wideString read get_CardExpirationDate;
		/// <summary>
		/// Credit left on the Gift card
		/// </summary>
		property CreditLeft: double read get_CreditLeft;
		/// <summary>
		/// Credit Left currency
		/// </summary>
		property CreditLeftCurrency: wideString read get_CreditLeftCurrency;
		/// <summary>
		/// Credit left currency identifier
		/// </summary>
		/// <seealso cref="TMC_CATCurrencyKindCode" currency code identifier/>
		property CreditLeftCurKind: TMC_CATCurrencyKindCode read get_CreditLeftCurKind;
	end;

	/// <summary>
	/// Version 2 of interface providing the gift card output parameters
	/// </summary>
	/// This is the second version of interface that provides the generated information after a gift cards transaction has been run
	/// <seealso cref="IMC_CATParamsOut" Transaction execution results/>
	/// <seealso cref="IMC_CATPOGiftCard" Detailed gift card transaction results/>
	IMC_CATPOGiftCardV2 = interface(IMC_CATPOGiftCard)
		['{85FB0DC8-8FB6-4ABC-81A9-451AE3ABEB28}']

		function get_CardValidityEndDate: wideString; stdcall;

		/// <summary>
		/// Gift card date end valiaity date (Formatted as DDMMYYYY)
		/// </summary>
		property CardValidityEndDate: wideString read get_CardValidityEndDate;
	end;

	/// <summary>
	/// Version 3 of interface providing the gift card output parameters
	/// </summary>
	/// This is the third version of interface that provides the generated information after a gift cards transaction has been run
	/// <seealso cref="IMC_CATParamsOut" Transaction execution results/>
	/// <seealso cref="IMC_CATPOGiftCard" Detailed gift card transaction results/>
	/// <seealso cref="IMC_CATPOGiftCardV2" Detailed gift card transaction results (version 2)/>
	IMC_CATPOGiftCardV3 = interface(IMC_CATPOGiftCardV2)
		['{C808CD32-CB54-4C65-9EF6-D9A5E9EC85E8}']
		function get_TransactionToken: wideString; stdcall;
		function get_ApprovedAuthNum: wideString; stdcall;

		/// <summary>
		/// Transaction token provided by authorization center
		/// </summary>
		property TransactionToken: wideString read get_TransactionToken;
		/// <summary>
		/// transaction authorization nummber
		/// </summary>
		property ApprovedAuthNum: wideString read get_ApprovedAuthNum;
	end;

	/// <summary>
	/// Version 4 of interface providing the gift card output parameters
	/// </summary>
	/// This is the third version of interface that provides the generated information after a gift cards transaction has been run
	/// <seealso cref="IMC_CATParamsOut" Transaction execution results/>
	/// <seealso cref="IMC_CATPOGiftCard" Detailed gift card transaction results/>
	/// <seealso cref="IMC_CATPOGiftCardV2" Detailed gift card transaction results (version 2)/>
	/// <seealso cref="IMC_CATPOGiftCardV3" Detailed gift card transaction results (version 3)/>
	IMC_CATPOGiftCardV4 = interface(IMC_CATPOGiftCardV3)
		['{89169F11-4853-4FAF-B721-1AA5B8DAAE40}']
		function get_TerminalPrivateData: wideString; stdcall;

		/// <summary>
		/// Send to businees application any Private data produced during the execution of the gift card transaction.
		/// <7summary>
		property TerminalPrivateData: wideString read get_TerminalPrivateData;
	end;

	/// <summary>
	/// Version 5 of interface providing the gift card output parameters
	/// </summary>
	/// This is the third version of interface that provides the generated information after a gift cards transaction has been run
	/// <seealso cref="IMC_CATParamsOut" Transaction execution results/>
	/// <seealso cref="IMC_CATPOGiftCard" Detailed gift card transaction results/>
	/// <seealso cref="IMC_CATPOGiftCardV2" Detailed gift card transaction results (version 2)/>
	/// <seealso cref="IMC_CATPOGiftCardV3" Detailed gift card transaction results (version 3)/>
	/// <seealso cref="IMC_CATPOGiftCardV4" Detailed gift card transaction results (version 4)/>
	IMC_CATPOGiftCardV5 = interface(IMC_CATPOGiftCardV4)
		['{5D50E668-0D10-4ED9-ACFC-1B5D82DCD63A}']
		function get_TransactionIssuer: wideString; stdcall;

		/// <summary>
		/// Code who identifies the issuer of the transaction
		/// </summary>
		/// For example, it will be used by the application to determine whether the sales transaction references stored in the database
		/// are known by the payment system to refund a return of goods with the card used to pay for the sale.
		/// <seealso cref="caCATGetTransactionIssuer" Driver capabilities query/>
		/// <seealso cref="IMC_CATPIGiftCardV3.RefundRef" Reference comming from original transaction/>
		/// <seealso cref="IMC_CATPIGiftCardV3.RefundTransacToken" Token comming from original transaction/>
		/// <seealso cref="IMC_CATPIGiftCardV4.TerminalPrivateData" CAT Private data from original transaction/>
		/// <seealso cref="IMC_CATPIGiftCardV6.refundAutNum" Authorization number of the original transaction/>
		property TransactionIssuer: wideString read get_TransactionIssuer;
	end;

	/// <summary>
	/// Interface providing card metadata
	/// </summary>
	/// This interface provides metadata of the card
	/// <seealso cref="IMC_CATParamsOut" Transaction execution results/>
	/// <seealso cref="coGetCardMetaData" Command to get the card metadata/>
	/// <seealso cref="coCheckCardMetaData" Command to check the validity of a card and get its metadata without processing a real payment transaction/>
	IMC_CATPOCardMetadata = interface(IMC_VersionedInterface)
		['{1D50CF30-9C49-42ED-B2F6-983675E61847}']
		function get_CardData: IMC_CATPOCardData; stdcall;

		/// <summary>
		/// If not null, it provides a new structure which tear down availible car number data.
		/// </summary>
		property CardData: IMC_CATPOCardData read get_CardData;
	end;

	/// <summary>
	/// Interface providing the information returned by the Command method
	/// </summary>
	/// This interface provides the information returned after calling the CAT driver Command method
	/// <seealso cref="IMC_CATPOTransac" Transaction parameters returned by the CAT/>
	/// <seealso cref="IMC_CATPOGiftCard" Gift card information/>
	IMC_CATParamsOut = interface(IMC_VersionedInterface)
		['{E3DDD9DF-AB44-4811-83DE-EF4289015A17}']
		function get_ShopCode: wideString; stdcall;
		function get_TillCode: wideString; stdcall;
		function get_TransactionResult: TMC_CATResultTransaction; stdcall;
		function get_MessageTransaction: wideString; stdcall;
		function get_TransacList: IMC_CATPOTransacList; stdcall;
		function get_GiftCard: IMC_CATPOGiftCard; stdcall;

		/// <summary>
		/// Shop code used for the transaction
		/// </summary>
		property shopCode: wideString read get_ShopCode;
		/// <summary>
		/// Till code used for the transaction
		/// </summary>
		property tillCode: wideString read get_TillCode;
		/// <summary>
		/// Returns the transaction result
		/// <value>A value among <see cref="TMC_CATResultTransaction"/>, which returns the transaction result</value>
		/// </summary>
		property transactionResult: TMC_CATResultTransaction read get_TransactionResult;
		/// <summary>
		/// Transaction result as a text message to be shown to the customer
		/// </summary>
		property MessageTransaction: wideString read get_MessageTransaction;
		/// <summary>
		/// Returns a list of transaction information
		/// <value>Reference to a <see cref="IMC_CATPOTransacList"/> interface</value>
		/// <remarks>
		/// Certain types of transactions (such as payment spreads) may lead to the generation of several transactions
		/// </remarks>
		/// </summary>
		/// <seealso cref="IMC_CATPOTransacList" Information resulting for the execution of a transaction/>
		property transacList: IMC_CATPOTransacList read get_TransacList;
		/// <summary>
		/// Returns the information relative to a gift card operation
		/// <value>Reference to an instance of the <see cref="IMC_CATPOGiftCard"/> interface</value>
		/// </summary>
		/// <seealso cref="IMC_CATPOGiftCard" Gift card operation/>
		property GiftCard: IMC_CATPOGiftCard read get_GiftCard;
	end;

	/// <summary>
	/// Version 2 of interface providing the information returned by the Command method
	/// </summary>
	/// This is the second version of interface that provides the information returned by the Command method
	/// <seealso cref="IMC_CATParamsOut" transaction output parameters/>
	IMC_CATParamsOutV2 = interface(IMC_CATParamsOut)
		['{CD8C59B7-CAEF-47B3-8549-F7397C873281}']
		function get_CardMetadata: IMC_CATPOCardMetadata; stdcall;

		/// <summary>
		/// Returns the card metadata gathered by the 'coGetCardMetaData' or 'coCheckCardMetaData' commands
		/// <value>Reference to an instance of the <see cref="IMC_CATPOCardMetadata"/> interface</value>
		/// </summary>
		/// <seealso cref="coGetCardMetaData" Command to get the card metadata/>
		/// <seealso cref="coCheckCardMetaData" Command to check the validity of a card and get its metadata without processing a real payment transaction/>
		property CardMetadata: IMC_CATPOCardMetadata read get_CardMetadata;
	end;

	/// <summary>
	/// Interface to implement when writing a Card Authorization Terminal (CAT) driver
	/// </summary>
	/// This interface derives from <see cref="MC_PluginInterface.IMC_PluginBase"/> and adds the specific features required for the implementation of a CAT driver
	/// <seealso cref="MC_PluginInterface.IMC_PluginBase" Driver base interface/>
	IMC_PluginCAT = interface(IMC_PluginBase)
		['{B55D20C5-95EB-4B52-9298-B3524DDE143A}']
		/// <summary>
		/// M?thode which executes commands on a CAT.
		/// </summary>
		/// This methode is used by the driver to dispatch the different commands that can be executed by the CAT
		/// <param name="aeCopmmand"> Command type</param>
		/// <param name="acParamsIn"> Input parameters</param>
		/// <param name="zcParamsOut"> Output parameters, which are returned to the client application</param>
		/// <returns>True if the command execution was successful, otherwise False (<see cref="MC_PluginInterface.IMC_PluginBase.getLastError"/>)</returns>
		/// <seealso cref="MC_PluginInterface.IMC_PluginBase.getLastError" How to retrieve error messages/>
		/// <seealso cref="MC_PluginInterface.IMC_Error" Error management interface/>
		function command(aeCommand: TMC_CATCommand; acParamsIn: IMC_CATParamsIn; out zcParamsOut: IMC_CATParamsOut): boolean; stdcall;
	end;

	/// <summary>
	/// Interface to implement when writing a MICR data getter callback
	/// </summary>
	/// A class must implement this interface in order to provide the driver with the data required for printing cheques.<p>
	/// On printing cheques process, CAT driver could need some data not available in its context but which must be provided by the client application through this callback.
	/// <seealso cref="IMC_PluginCATV2" Interface for CAT devices V2/>
	IMC_CATMICRDataGetter = interface
		['{622272C6-D43F-4E4C-BB74-AC28336CF6E5}']
		/// <summary>
		/// MICR data getter callback
		/// </summary>
		/// This callback is used by the CAT device driver during the cheque printing process to retrieve necessary data
		/// <param name="sender">Reference to the driver which is calling the callback</param>
		/// <param name="asFieldId">Field identifier of data to be provided by the callback</param>
		/// <param name="zsDataValue">Actual data provided by the client application</param>
		/// <returns>A value among <see cref="TMC_CATMICRDataGetterResult"/>,
		/// which indicates whether the requested data could be provided </returns>
		/// <seealso cref="IMC_PluginCATV2" Interface for CAT devices V2/>
		/// <seealso cref="TMC_CATMICRDataGetterResult" MICR data getter callback result type/>
		function onMICRDataRequest(sender: IMC_PluginBase; const asFieldId: wideString; out zsDataValue: wideString): TMC_CATMICRDataGetterResult; stdcall;
	end;

	/// <summary>
	/// Version 2 of interface to be implemented by drivers managing cheque's validation process
	/// </summary>
	/// This is the second version of interface for Card Authorization Terminal (CAT) that provides the specific methods to manage cheque's validation process
	/// <seealso cref="IMC_PluginCAT" Interface pour CAT devices/>
	/// <seealso cref="IMC_CATMICRDataGetter" MICR cheque Data getter/>
	IMC_PluginCATV2 = interface(IMC_PluginCAT)
		['{FE557E2C-5F6C-4829-834F-0E58292400D5}']
		procedure SetMICRDataGetter(acGetter: IMC_CATMICRDataGetter); stdcall;
		function GetMICRDataGetter: IMC_CATMICRDataGetter; stdcall;

		/// <summary>
		/// Returns a pointer to a class managing requests issues from driver to gert mandatory data to print a cheque
		/// <value>Reference to an instance of the <see cref="IMC_CATMICRDataGetter"/> interface</value>
		/// </summary>
		/// <seealso cref="IMC_CATMICRDataGetter" MICR cheque data getter/>
		property MICRDataGetter: IMC_CATMICRDataGetter read GetMICRDataGetter write SetMICRDataGetter;
	end;

implementation

end.
