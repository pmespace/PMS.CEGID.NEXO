// const Ok
// Unité publique
unit MC_PluginInterface;

interface

uses
	ActiveX;

const
	// TMC_DeviceType
	/// <summary>
	/// Unknown device
	/// </summary>
	/// This is the undefined value in the device types.
	/// <remarks>
	/// This value can be returned by <see cref="IMC_PluginLoader.enumPlugins"/> to indicate that no device is selected
	/// and ALL the drivers must be enumerated
	/// </remarks>
	/// <seealso cref="TMC_DeviceType"Device types/>
	dtUnknown = 0;
	/// <summary>
	/// Périphérique "Application"
	/// </summary>
	/// This device must be used when the driver must be able to execute a callback function of the client application to perform some specific actions.<P>
	/// For instance:<P>
	/// During binding, the driver needs to know all the receipt templates that are available. The client application must implement an <see cref="MC_Callback"/> function,
	/// which returns the available report templates, and register this callback in the driver so that it may call it.
	/// <seealso cref="TMC_DeviceType"Device types/>
	/// <seealso cref="MC_PluginInterface.IMC_PluginCallback.OnMC_Callback" Callback interface/>
	dtApplication = 1;
	/// <summary>
	/// Receipt printer
	/// </summary>
	/// <remarks>
	/// This value encompasses both fiscal and non fiscal printers.<P>
	/// To determine the exact type, the application may query the driver with this function <see cref="MC_PluginInterface.IMC_PluginBase.getCapabilities"/>
	/// </remarks>
	/// <seealso cref="TMC_DeviceType"Device types/>
	/// <seealso cref="MC_PluginInterface.IMC_PluginBase.getCapabilities" Device feature query interface/>
	dtPrinter = 2;
	/// <summary>
	/// Customer line display
	/// </summary>
	/// <seealso cref="TMC_DeviceType"Device types/>
	dtLineDisplay = 3;
	/// <summary>
	/// Cash drawer
	/// </summary>
	/// <seealso cref="TMC_DeviceType"Device types/>
	dtCashDrawer = 4;
	/// <summary>
	/// Card Magnetic Stripe Reader
	/// </summary>
	/// <seealso cref="TMC_DeviceType"Device types/>
	dtMSR = 5;
	/// <summary>
	/// Pin Pad
	/// </summary>
	/// This type of device is used to read customer data, such as payment card ownership and validity
	/// <seealso cref="TMC_DeviceType"Device types/>
	dtPPad = 6;
	/// <summary>
	/// Signature pad
	/// </summary>
	/// This type of device is used to collect and store customer signatures. It is often used along with a CAT
	/// <seealso cref="TMC_DeviceType"Device types/>
	dtSig = 7;
	/// <summary>
	/// Cardholder Activated Terminal
	/// </summary>
	/// <seealso cref="TMC_DeviceType"Device types/>
	dtCAT = 8;
	/// <summary>
	/// Biometrics Terminal
	/// </summary>
	/// This type of device is used to reconize the user by his/her boimetrics parameters
	/// <seealso cref="TMC_DeviceType"Device types/>
	dtBiometrics = 9;
	/// <summary>
	/// Card point Terminal
	/// </summary>
	/// <seealso cref="TMC_DeviceType"Device types/>
	dtPointCard = 10;
	/// <summary>
	/// Tax box device
	/// </summary>
	/// <seealso cref="TMC_DeviceType"Device types/>
	dtFiscalTaxBox = 11;
	/// <summary>
	/// ICAO reader device
	/// </summary>
	/// <seealso cref="TMC_DeviceType"Device types/>
	dtICAOReader = 12;
	/// <summary>
	/// CPOS device
	/// </summary>
	/// This value is used whenever a driver requires CPOS packages.
	/// <seealso cref="TMC_DeviceType"Device types/>
	dtCPOS = 99;

	// TMC_StateDevice
	/// <summary>
	/// Unknown device state
	/// </summary>
	/// This is the undefined state of the device before any operation was executed or after the Disconnect command.
	/// <seealso cref="TMC_StateDevice" Device state/>
	dsUnknown = 0;
	/// <summary>
	/// The device is connected
	/// </summary>
	/// The driver has successfully executed the Connect command, or the Close command
	/// <seealso cref="TMC_StateDevice" Device state/>
	dsConnect = 1;
	/// <summary>
	/// The driver is connected and online
	/// </summary>
	/// The driver successfully established a connection with the device, which is ready to use
	/// <seealso cref="TMC_StateDevice" Device state/>
	dsOnLine = 2;

	// TMC_Capabilities
	/// <summary>
	/// Unknown driver capability
	/// </summary>
	/// This is the undefined driver capability value
	/// <seealso cref="MC_PluginInterface.IMC_PluginBase.getCapabilities" Device feature query interface/>
	caUnknown = 0;
	/// <summary>
	/// Identifier of the driver's preferred callback
	/// </summary>
	/// Capability of the driver to retrieve the identifier of its preferred callback.<p>
	/// Some drivers needs to call some callback functions implemented by the client application, provided they have the capability to know the callback identifier.
	/// <seealso cref="MC_PluginInterface.IMC_PluginBase.getCapabilities" Device feature query interface/>
	caMC_CallbackID = 1;
	/// <summary>
	/// CheckHealth method availability before the device is open
	/// </summary>
	/// Capability of the driver to call the checkHealth method before the device is open
	/// <seealso cref="MC_PluginInterface.IMC_PluginBase.getCapabilities" Device feature query interface/>
	caCheckHealthBeforeOpen = 2;
	/// <summary>
	/// Maintain the device open
	/// </summary>
	/// Requirement to maintain the device open
	/// <seealso cref="MC_PluginInterface.IMC_PluginBase.getCapabilities" Device feature query interface/>
	caAlwaysOpen = 3;
	/// <summary>
	/// Manages stansalone settings
	/// </summary>
	/// Does the device manage any setting for standalone mode
	/// <seealso cref="MC_PluginInterface.IMC_PluginBase.getCapabilities" Device feature query interface/>
	caManagesStandaloneSettings = 4;
	/// <summary>
	/// Value number 1 retrieved through a device driver query
	/// </summary>
	/// General value retrieved when querying a device driver's capabilities
	/// <remarks>
	/// Derived device driver implementations rename this value for better code readability
	/// </remarks>
	/// <seealso cref="MC_PluginInterface.IMC_PluginBase.getCapabilities" Device feature query interface/>
	ca01 = 101;
	/// <summary>
	/// Value number 2 retrieved through a device driver query
	/// </summary>
	/// General value retrieved when querying a device driver's capabilities
	/// <remarks>
	/// Derived device driver implementations rename this value for better code readability
	/// </remarks>
	/// <seealso cref="MC_PluginInterface.IMC_PluginBase.getCapabilities" Device feature query interface/>
	ca02 = 102;
	/// <summary>
	/// Value number 3 retrieved through a device driver query
	/// </summary>
	/// General value retrieved when querying a device driver's capabilities
	/// <remarks>
	/// Derived device driver implementations rename this value for better code readability
	/// </remarks>
	/// <seealso cref="MC_PluginInterface.IMC_PluginBase.getCapabilities" Device feature query interface/>
	ca03 = 103;
	/// <summary>
	/// Value number 4 retrieved through a device driver query
	/// </summary>
	/// General value retrieved when querying a device driver's capabilities
	/// <remarks>
	/// Derived device driver implementations rename this value for better code readability
	/// </remarks>
	/// <seealso cref="MC_PluginInterface.IMC_PluginBase.getCapabilities" Device feature query interface/>
	ca04 = 104;
	/// <summary>
	/// Value number 5 retrieved through a device driver query
	/// </summary>
	/// General value retrieved when querying a device driver's capabilities
	/// <remarks>
	/// Derived device driver implementations rename this value for better code readability
	/// </remarks>
	/// <seealso cref="MC_PluginInterface.IMC_PluginBase.getCapabilities" Device feature query interface/>
	ca05 = 105;
	/// <summary>
	/// Value number 6 retrieved through a device driver query
	/// </summary>
	/// General value retrieved when querying a device driver's capabilities
	/// <remarks>
	/// Derived device driver implementations rename this value for better code readability
	/// </remarks>
	/// <seealso cref="MC_PluginInterface.IMC_PluginBase.getCapabilities" Device feature query interface/>
	ca06 = 106;
	/// <summary>
	/// Value number 7 retrieved through a device driver query
	/// </summary>
	/// General value retrieved when querying a device driver's capabilities
	/// <remarks>
	/// Derived device driver implementations rename this value for better code readability
	/// </remarks>
	/// <seealso cref="MC_PluginInterface.IMC_PluginBase.getCapabilities" Device feature query interface/>
	ca07 = 107;
	/// <summary>
	/// Value number 8 retrieved through a device driver query
	/// </summary>
	/// General value retrieved when querying a device driver's capabilities
	/// <remarks>
	/// Derived device driver implementations rename this value for better code readability
	/// </remarks>
	/// <seealso cref="MC_PluginInterface.IMC_PluginBase.getCapabilities" Device feature query interface/>
	ca08 = 108;
	/// <summary>
	/// Value number 9 retrieved through a device driver query
	/// </summary>
	/// General value retrieved when querying a device driver's capabilities
	/// <remarks>
	/// Derived device driver implementations rename this value for better code readability
	/// </remarks>
	/// <seealso cref="MC_PluginInterface.IMC_PluginBase.getCapabilities" Device feature query interface/>
	ca09 = 109;
	/// <summary>
	/// Value number 10 retrieved through a device driver query
	/// </summary>
	/// General value retrieved when querying a device driver's capabilities
	/// <remarks>
	/// Derived device driver implementations rename this value for better code readability
	/// </remarks>
	/// <seealso cref="MC_PluginInterface.IMC_PluginBase.getCapabilities" Device feature query interface/>
	ca10 = 110;
	/// <summary>
	/// Value number 11 retrieved through a device driver query
	/// </summary>
	/// General value retrieved when querying a device driver's capabilities
	/// <remarks>
	/// Derived device driver implementations rename this value for better code readability
	/// </remarks>
	/// <seealso cref="MC_PluginInterface.IMC_PluginBase.getCapabilities" Device feature query interface/>
	ca11 = 111;
	/// <summary>
	/// Value number 12 retrieved through a device driver query
	/// </summary>
	/// General value retrieved when querying a device driver's capabilities
	/// <remarks>
	/// Derived device driver implementations rename this value for better code readability
	/// </remarks>
	/// <seealso cref= "MC_PluginInterface.IMC_PluginBase.getCapabilities" Device feature query interface/>
	ca12 = 112;
	/// <summary>
	/// Value number 13 retrieved through a device driver query
	/// </summary>
	/// General value retrieved when querying a device driver's capabilities
	/// <remarks>
	/// Derived device driver implementations rename this value for better code readability
	/// </remarks>
	/// <seealso cref= "MC_PluginInterface.IMC_PluginBase.getCapabilities" Device feature query interface/>
	ca13 = 113;
	/// <summary>
	/// Value number 14 retrieved through a device driver query
	/// </summary>
	/// General value retrieved when querying a device driver's capabilities
	/// <remarks>
	/// Derived device driver implementations rename this value for better code readability
	/// </remarks>
	/// <seealso cref= "MC_PluginInterface.IMC_PluginBase.getCapabilities" Device feature query interface/>
	ca14 = 114;
	/// <summary>
	/// Value number 15 retrieved through a device driver query
	/// </summary>
	/// General value retrieved when querying a device driver's capabilities
	/// <remarks>
	/// Derived device driver implementations rename this value for better code readability
	/// </remarks>
	/// <seealso cref= "MC_PluginInterface.IMC_PluginBase.getCapabilities" Device feature query interface/>
	ca15 = 115;
	/// <summary>
	/// Value number 16 retrieved through a device driver query
	/// </summary>
	/// General value retrieved when querying a device driver's capabilities
	/// <remarks>
	/// Derived device driver implementations rename this value for better code readability
	/// </remarks>
	/// <seealso cref= "MC_PluginInterface.IMC_PluginBase.getCapabilities" Device feature query interface/>
	ca16 = 116;
	/// <summary>
	/// Value number 17 retrieved through a device driver query
	/// </summary>
	/// General value retrieved when querying a device driver's capabilities
	/// <remarks>
	/// Derived device driver implementations rename this value for better code readability
	/// </remarks>
	/// <seealso cref= "MC_PluginInterface.IMC_PluginBase.getCapabilities" Device feature query interface/>
	ca17 = 117;
	/// <summary>
	/// Value number 18 retrieved through a device driver query
	/// </summary>
	/// General value retrieved when querying a device driver's capabilities
	/// <remarks>
	/// Derived device driver implementations rename this value for better code readability
	/// </remarks>
	/// <seealso cref= "MC_PluginInterface.IMC_PluginBase.getCapabilities" Device feature query interface/>
	ca18 = 118;
	/// <summary>
	/// Value number 19 retrieved through a device driver query
	/// </summary>
	/// General value retrieved when querying a device driver's capabilities
	/// <remarks>
	/// Derived device driver implementations rename this value for better code readability
	/// </remarks>
	/// <seealso cref= "MC_PluginInterface.IMC_PluginBase.getCapabilities" Device feature query interface/>
	ca19 = 119;
	/// <summary>
	/// Value number 20 retrieved through a device driver query
	/// </summary>
	/// General value retrieved when querying a device driver's capabilities
	/// <remarks>
	/// Derived device driver implementations rename this value for better code readability
	/// </remarks>
	/// <seealso cref= "MC_PluginInterface.IMC_PluginBase.getCapabilities" Device feature query interface/>
	ca20 = 120;
	/// <summary>
	/// Value number 21 retrieved through a device driver query
	/// </summary>
	/// General value retrieved when querying a device driver's capabilities
	/// <remarks>
	/// Derived device driver implementations rename this value for better code readability
	/// </remarks>
	/// <seealso cref= "MC_PluginInterface.IMC_PluginBase.getCapabilities" Device feature query interface/>
	ca21 = 121;
	/// <summary>
	/// Value number 22 retrieved through a device driver query
	/// </summary>
	/// General value retrieved when querying a device driver's capabilities
	/// <remarks>
	/// Derived device driver implementations rename this value for better code readability
	/// </remarks>
	/// <seealso cref= "MC_PluginInterface.IMC_PluginBase.getCapabilities" Device feature query interface/>
	ca22 = 122;
	/// <summary>
	/// Value number 23 retrieved through a device driver query
	/// </summary>
	/// General value retrieved when querying a device driver's capabilities
	/// <remarks>
	/// Derived device driver implementations rename this value for better code readability
	/// </remarks>
	/// <seealso cref= "MC_PluginInterface.IMC_PluginBase.getCapabilities" Device feature query interface/>
	ca23 = 123;
	/// <summary>
	/// Value number 24 retrieved through a device driver query
	/// </summary>
	/// General value retrieved when querying a device driver's capabilities
	/// <remarks>
	/// Derived device driver implementations rename this value for better code readability
	/// </remarks>
	/// <seealso cref= "MC_PluginInterface.IMC_PluginBase.getCapabilities" Device feature query interface/>
	ca24 = 124;
	/// <summary>
	/// Value number 25 retrieved through a device driver query
	/// </summary>
	/// General value retrieved when querying a device driver's capabilities
	/// <remarks>
	/// Derived device driver implementations rename this value for better code readability
	/// </remarks>
	/// <seealso cref= "MC_PluginInterface.IMC_PluginBase.getCapabilities" Device feature query interface/>
	ca25 = 125;
	/// <summary>
	/// Value number 26 retrieved through a device driver query
	/// </summary>
	/// General value retrieved when querying a device driver's capabilities
	/// <remarks>
	/// Derived device driver implementations rename this value for better code readability
	/// </remarks>
	/// <seealso cref= "MC_PluginInterface.IMC_PluginBase.getCapabilities" Device feature query interface/>
	ca26 = 126;
	/// <summary>
	/// Value number 27 retrieved through a device driver query
	/// </summary>
	/// General value retrieved when querying a device driver's capabilities
	/// <remarks>
	/// Derived device driver implementations rename this value for better code readability
	/// </remarks>
	/// <seealso cref= "MC_PluginInterface.IMC_PluginBase.getCapabilities" Device feature query interface/>
	ca27 = 127;
	/// <summary>
	/// Value number 28 retrieved through a device driver query
	/// </summary>
	/// General value retrieved when querying a device driver's capabilities
	/// <remarks>
	/// Derived device driver implementations rename this value for better code readability
	/// </remarks>
	/// <seealso cref= "MC_PluginInterface.IMC_PluginBase.getCapabilities" Device feature query interface/>
	ca28 = 128;
	/// <summary>
	/// Value number 29 retrieved through a device driver query
	/// </summary>
	/// General value retrieved when querying a device driver's capabilities
	/// <remarks>
	/// Derived device driver implementations rename this value for better code readability
	/// </remarks>
	/// <seealso cref= "MC_PluginInterface.IMC_PluginBase.getCapabilities" Device feature query interface/>
	ca29 = 129;
	/// <summary>
	/// Value number 30 retrieved through a device driver query
	/// </summary>
	/// General value retrieved when querying a device driver's capabilities
	/// <remarks>
	/// Derived device driver implementations rename this value for better code readability
	/// </remarks>
	/// <seealso cref= "MC_PluginInterface.IMC_PluginBase.getCapabilities" Device feature query interface/>
	ca30 = 130;
	/// <summary>
	/// Value number 31 retrieved through a device driver query
	/// </summary>
	/// General value retrieved when querying a device driver's capabilities
	/// <remarks>
	/// Derived device driver implementations rename this value for better code readability
	/// </remarks>
	/// <seealso cref= "MC_PluginInterface.IMC_PluginBase.getCapabilities" Device feature query interface/>
	ca31 = 131;
	/// <summary>
	/// Value number 32 retrieved through a device driver query
	/// </summary>
	/// General value retrieved when querying a device driver's capabilities
	/// <remarks>
	/// Derived device driver implementations rename this value for better code readability
	/// </remarks>
	/// <seealso cref= "MC_PluginInterface.IMC_PluginBase.getCapabilities" Device feature query interface/>
	ca32 = 132;
	/// <summary>
	/// Value number 33 retrieved through a device driver query
	/// </summary>
	/// General value retrieved when querying a device driver's capabilities
	/// <remarks>
	/// Derived device driver implementations rename this value for better code readability
	/// </remarks>
	/// <seealso cref= "MC_PluginInterface.IMC_PluginBase.getCapabilities" Device feature query interface/>
	ca33 = 133;
	/// <summary>
	/// Value number 34 retrieved through a device driver query
	/// </summary>
	/// General value retrieved when querying a device driver's capabilities
	/// <remarks>
	/// Derived device driver implementations rename this value for better code readability
	/// </remarks>
	/// <seealso cref= "MC_PluginInterface.IMC_PluginBase.getCapabilities" Device feature query interface/>
	ca34 = 134;
	/// <summary>
	/// Value number 35 retrieved through a device driver query
	/// </summary>
	/// General value retrieved when querying a device driver's capabilities
	/// <remarks>
	/// Derived device driver implementations rename this value for better code readability
	/// </remarks>
	/// <seealso cref= "MC_PluginInterface.IMC_PluginBase.getCapabilities" Device feature query interface/>
	ca35 = 135;
	/// <summary>
	/// Value number 36 retrieved through a device driver query
	/// </summary>
	/// General value retrieved when querying a device driver's capabilities
	/// <remarks>
	/// Derived device driver implementations rename this value for better code readability
	/// </remarks>
	/// <seealso cref= "MC_PluginInterface.IMC_PluginBase.getCapabilities" Device feature query interface/>
	ca36 = 136;
	/// <summary>
	/// Value number 37 retrieved through a device driver query
	/// </summary>
	/// General value retrieved when querying a device driver's capabilities
	/// <remarks>
	/// Derived device driver implementations rename this value for better code readability
	/// </remarks>
	/// <seealso cref= "MC_PluginInterface.IMC_PluginBase.getCapabilities" Device feature query interface/>
	ca37 = 137;
	/// <summary>
	/// Value number 38 retrieved through a device driver query
	/// </summary>
	/// General value retrieved when querying a device driver's capabilities
	/// <remarks>
	/// Derived device driver implementations rename this value for better code readability
	/// </remarks>
	/// <seealso cref= "MC_PluginInterface.IMC_PluginBase.getCapabilities" Device feature query interface/>
	ca38 = 138;
	/// <summary>
	/// Value number 39 retrieved through a device driver query
	/// </summary>
	/// General value retrieved when querying a device driver's capabilities
	/// <remarks>
	/// Derived device driver implementations rename this value for better code readability
	/// </remarks>
	/// <seealso cref= "MC_PluginInterface.IMC_PluginBase.getCapabilities" Device feature query interface/>
	ca39 = 139;

	// TMC_LogSeverity
	/// <summary>
	/// Unknown log severity
	/// </summary>
	/// This is the undefined value for log severity types.
	/// <seealso cref="TMC_LogSeverity" Log severity/>
	/// <seealso cref="MC_PluginInterface.IMC_PluginCallback.onAddLog" Add logging traces/>
	/// <seealso cref="MC_PluginInterface.IMC_PluginCallback.manageLog" Managed log severity/>
	lsUnknown = 0;
	/// <summary>
	/// Verbose severity
	/// </summary>
	/// Encompasses all the available types of messages.
	/// <seealso cref="TMC_LogSeverity" Log severity/>
	/// <seealso cref="MC_PluginInterface.IMC_PluginCallback.onAddLog" Add logging traces/>
	/// <seealso cref="MC_PluginInterface.IMC_PluginCallback.manageLog" Managed log severity/>
	lsVerbose = 1;
	/// <summary>
	/// Information severity
	/// </summary>
	/// Includes simple information messages.
	/// <seealso cref="TMC_LogSeverity" Log severity/>
	/// <seealso cref="MC_PluginInterface.IMC_PluginCallback.onAddLog" Add logging traces/>
	/// <seealso cref="MC_PluginInterface.IMC_PluginCallback.manageLog" Managed log severity/>
	lsInformation = 2;
	/// <summary>
	/// Warning severity
	/// </summary>
	/// Includes warning messages.
	/// <seealso cref="TMC_LogSeverity" Log severity/>
	/// <seealso cref="MC_PluginInterface.IMC_PluginCallback.onAddLog" Add logging traces/>
	/// <seealso cref="MC_PluginInterface.IMC_PluginCallback.manageLog" Managed log severity/>
	lsWarning = 3;
	/// <summary>
	/// Error severity
	/// </summary>
	/// Includes error messages.
	/// <seealso cref="TMC_LogSeverity" Log severity/>
	/// <seealso cref="MC_PluginInterface.IMC_PluginCallback.onAddLog" Add logging traces/>
	/// <seealso cref="MC_PluginInterface.IMC_PluginCallback.manageLog" Managed log severity/>
	lsError = 4;

	// TMC_UICallbackType
	/// <summary>
	/// Unknown callback type
	/// </summary>
	/// This is the undefined value for callback types
	/// <seealso cref="TMC_UICallbackType" User interface callback types/>
	ctUnknown = 0;
	/// <summary>
	/// Message callback
	/// </summary>
	/// This kind of callback is used to display a message in the client application
	/// <seealso cref="TMC_UICallbackType" User interface callback types/>
	/// <seealso cref="IMC_UICallbackPIMessage" User interface callback message interface/>
	ctMessage = 1;
	/// <summary>
	/// Question callback
	/// </summary>
	/// This kind of callback is used to display a message in the client application with [Yes] and [No] reply buttons
	/// <seealso cref="TMC_UICallbackType" User interface callback types/>
	/// <seealso cref="IMC_UICallbackPIMessage" User interface callback message interface/>
	ctAsk = 2;
	/// <summary>
	/// Question callback with cancel
	/// </summary>
	/// This kind of callback is used to display a message in the client application with [Yes], [No] and [Cancel] buttons
	/// <seealso cref="TMC_UICallbackType" User interface callback types/>
	/// <seealso cref="IMC_UICallbackPIMessage" User interface callback message interface/>
	ctAskCancel = 3;
	/// <summary>
	/// Warning message callback
	/// </summary>
	/// This kind of callback is used to display a warning message in the client application
	/// <seealso cref="TMC_UICallbackType" User interface callback types/>
	/// <seealso cref="IMC_UICallbackPIMessage" User interface callback message interface/>
	ctWarning = 4;
	/// <summary>
	/// Error message callback
	/// </summary>
	/// This kind of callback is used to display an error message in the client application
	/// <seealso cref="TMC_UICallbackType" User interface callback types/>
	/// <seealso cref="IMC_UICallbackPIMessage" User interface callback message interface/>
	ctError = 5;
	/// <summary>
	/// Progress bar initialization callback
	/// </summary>
	/// This kind of callback is used to initialize a progress bar in the client application
	/// <seealso cref="TMC_UICallbackType" User interface callback types/>
	/// <seealso cref="ctMove" Progress bar update callback/>
	/// <seealso cref="ctMoveEnd" Progress bar terminate callback/>
	/// <seealso cref="IMC_UICallbackPIMove" Interface callback jauge/>
	ctMoveInit = 6;
	/// <summary>
	/// Progress bar update callback
	/// </summary>
	/// This kind of callback is used to update a progress bar
	/// <seealso cref="TMC_UICallbackType" User interface callback types/>
	/// <seealso cref="ctMoveInit" Progress bar initialization callback/>
	/// <seealso cref="ctMoveEnd" Progress bar terminate callback/>
	/// <seealso cref="IMC_UICallbackPIMove" Interface callback jauge/>
	ctMove = 7;
	/// <summary>
	/// Progress bar terminate callback
	/// </summary>
	/// This kind of callback is used to terminate a progress bar
	/// <seealso cref="TMC_UICallbackType" User interface callback types/>
	/// <seealso cref="ctMoveInit" Progress bar initialization callback/>
	/// <seealso cref="ctMove" Progress bar update callback/>
	/// <seealso cref="IMC_UICallbackPIMove" Interface callback jauge/>
	ctMoveEnd = 8;
	/// <summary>
	/// Keyboard entry callback
	/// </summary>
	/// This kind of callback is used by drivers to receive user keystrokes
	/// <remarks>
	/// This kind of callback is not implemented by default in the CPOS packages
	/// </remarks>
	/// <seealso cref="TMC_UICallbackType" User interface callback types/>
	/// <seealso cref="IMC_UICallbackRKey" User keystrokes callback/>
	ctGetKey = 9;
	/// <summary>
	/// Access rights assessment callback
	/// </summary>
	/// This kind of callback is used by drivers to check the user's right to access certain functions
	/// <remarks>
	/// This kind of callback is not implemented by default in the CPOS packages
	/// </remarks>
	/// <seealso cref="TMC_UICallbackType" User interface callback types/>
	/// <seealso cref="IMC_UICallbackPISecurity" User interface security verification callback/>
	ctSecurity = 10;
	/// <summary>
	/// Text entry callback
	/// </summary>
	/// This kind of callback is used by the drivers to display a message in the client application and to retrieve the user text entry
	/// <seealso cref="TMC_UICallbackType" User interface callback types/>
	/// <seealso cref="IMC_UICallbackPIGetString" User text entry callback/>
	/// <seealso cref="IMC_UICallbackPIGetStringV2" User text entry callback (V2)/>
	/// <seealso cref="IMC_UICallbackRGetString" User text entry result callback/>
	ctGetString = 11;
	/// <summary>
	/// Operation in progress callback
	/// </summary>
	/// This kind of callback is used by the drivers to display an "Operation in progress" type dialog box in the client application,
	/// while offering the user the possibility to cancel the current operation
	/// <remarks>
	/// The aim of this callback is to warn the user of an ongoing operation
	/// </remarks>
	/// <seealso cref="TMC_UICallbackType" User interface callback types/>
	/// <seealso cref="IMC_UICallbackPIMessage" User interface callback message interface/>
	ctContinueProc = 12;
	/// <summary>
	/// Open cash drawer callback
	/// </summary>
	/// This kind of callback is used by the driver to indicate that the cash drawer is open
	/// <remarks>
	/// By default, this kind of callback usually rings an alarm every x milliseconds while the cash drawer remains open.
	/// </remarks>
	/// <seealso cref="TMC_UICallbackType" User interface callback types/>
	/// <seealso cref="IMC_UICallbackPIMessage" User interface callback message interface/>
	ctOpenedCashDrawer = 13;
	/// <summary>
	/// Closed cash drawer callback
	/// </summary>
	/// This kind of callback is used by the driver to indicate that the cash drawer has been closed
	/// <remarks>
	/// By default, this kind of callback does nothing.
	/// </remarks>
	/// <seealso cref="TMC_UICallbackType" User interface callback types/>
	/// <seealso cref="IMC_UICallbackPIMessage" User interface callback message interface/>
	ctClosedCashDrawer = 14;
	/// <summary>
	/// Multiple choice user prompt callback
	/// </summary>
	/// This kind of callback is used to prompt the user with a multiple choice selection dialog box (usually featuring radio buttons)
	/// <seealso cref="TMC_UICallbackType" User interface callback types/>
	/// <seealso cref="IMC_UICallbackPIChoose" Multiple choice callback interface/>
	/// <seealso cref="IMC_UICallbackRChoose" Multiple choice result callback interface/>
	ctChoose = 15;

	// TMC_CallbackResult
	/// <summary>
	/// Unknown callback result
	/// </summary>
	/// This is the undefined value for callback result types
	/// <seealso cref="TMC_CallbackResult" Callback result types/>
	/// <seealso cref="IMC_UICallbackResult" User interface callback result/>
	/// <seealso cref="MC_PluginInterface.IMC_PluginCallback"/>
	cbrUnknown = 0;
	/// <summary>
	/// No answer callback result
	/// </summary>
	/// The driver gets this kind of result when the client application does not implement the callback
	/// <seealso cref="TMC_CallbackResult" Callback result types/>
	/// <seealso cref="IMC_UICallbackResult" User interface callback result/>
	/// <seealso cref="MC_PluginInterface.IMC_PluginCallback"/>
	cbrNoAnswer = 1;
	/// <summary>
	/// Callback processed ok
	/// </summary>
	/// The client application returns <c>cbrOk</c> when it has successfully processed the callback function call
	/// <remarks>
	/// The device driver must integrate the successful callback result in its execution logic
	/// </remarks>
	/// <seealso cref="TMC_CallbackResult" Callback result types/>
	/// <seealso cref="IMC_UICallbackResult" Callback result interface/>
	/// <seealso cref="MC_PluginInterface.IMC_PluginCallback"/>
	cbrOk = 2;
	/// <summary>
	/// Callback refused
	/// </summary>
	/// The client application refused to process the callback function call
	/// <remarks>
	/// The device driver must integrate the refused callback result in its execution logic
	/// </remarks>
	/// <seealso cref="TMC_CallbackResult" Callback result types/>
	/// <seealso cref="IMC_UICallbackResult" Callback result interface/>
	/// <seealso cref="MC_PluginInterface.IMC_PluginCallback"/>
	cbrNo = 3;
	/// <summary>
	/// Callback canceled
	/// </summary>
	/// The client application processed the callback function call but it returned a cancelation result
	/// <remarks>
	/// The device driver must integrate the canceled callback result in its execution logic
	/// </remarks>
	/// <seealso cref="TMC_CallbackResult" Callback result types/>
	/// <seealso cref="IMC_UICallbackResult" Callback result interface/>
	/// <seealso cref="MC_PluginInterface.IMC_PluginCallback"/>
	cbrCancel = 4;
	/// <summary>
	/// Callback correction request
	/// </summary>
	/// The client application processed the callback function call but it requested a correction from the driver
	/// <remarks>
	/// The device driver must integrate the correction callback result in its execution logic
	/// </remarks>
	/// <seealso cref="TMC_CallbackResult" Callback result types/>
	/// <seealso cref="IMC_UICallbackResult" Callback result interface/>
	/// <seealso cref="MC_PluginInterface.IMC_PluginCallback"/>
	cbrCorrection = 5;
	/// <summary>
	/// Callback retry request
	/// </summary>
	/// The client application processed the callback function call but it requested that the driver retry the operation
	/// <remarks>
	/// The device driver must integrate the retry callback result in its execution logic
	/// </remarks>
	/// <seealso cref="TMC_CallbackResult" Callback result types/>
	/// <seealso cref="IMC_UICallbackResult" Callback result interface/>
	/// <seealso cref="MC_PluginInterface.IMC_PluginCallback"/>
	cbrRetry = 6;
	/// <summary>
	/// Callback error
	/// </summary>
	/// The client application processed the callback function call but it indicates an error to the driver
	/// <remarks>
	/// The device driver must integrate the error callback result in its execution logic
	/// </remarks>
	/// <seealso cref="TMC_CallbackResult" Callback result types/>
	/// <seealso cref="IMC_UICallbackResult" Callback result interface/>
	/// <seealso cref="MC_PluginInterface.IMC_PluginCallback"/>
	cbrError = 7;

	// TMC_UICBPISecurity
	/// <summary>
	/// Unknown type of security validation
	/// </summary>
	/// A undefined security validation is transmitted to the client application
	/// <seealso cref="TMC_CallbackResult" Callback result types/>
	secUnknown = 0;

	// TMC_BindingEditType's values
	/// <summary>
	/// Date input format
	/// </summary>
	/// <example>
	/// <code>
	/// Edit.DisplayFormat = 'm/d/yyyy'
	/// </code>
	/// </example>
	betDate = 1;

	/// <summary>
	/// Time input format
	/// </summary>
	/// <example>
	/// <code>
	/// Edit.DisplayFormat = 'hh:mm'
	/// </code>
	/// </example>
	betHeure = 2;

	/// <summary>
	/// Character string input
	/// </summary>
	betString = 3;

	/// <summary>
	/// Floating numbers and integers input format
	/// </summary>
	/// <example>
	/// <code>
	/// Edit.DisplayFormat = '#,##0.00'
	/// </code>
	/// </example>
	betReel = 4;

	/// <summary>
	/// Monetary numbers input format
	///
	/// DisplayFormat is defined using a partial list
	///
	/// CurrencyFormat		(Monetary symbol)
	/// CurrToStrF			(Number of decimals)
	/// CurrencyDecimals	(Decimal separator)
	/// ThousandSeparator
	/// NegCurrFormat		(Negative amount format)
	/// NegColor			(Negative amount colour)
	/// </summary>
	/// <example>
	/// <code>
	/// Edit.DisplayFormat = '"$";"2";".";",";"3","clRed"'
	/// Edit.DisplayFormat = '"$";"2"
	/// Edit.DisplayFormat = '$;2'
	/// </code>
	/// </example>
	betCurrency = 5;

	// TMC_BindingVisualPropertyChanged's values
	/// <summary>
	/// This value informs the binding manager that a control's visibility has changed
	/// </summary>
	/// Whenever a control visibility changes as a result of a user interaction,
	/// the binding manager is warned through the OnVisualChanged event, which holds
	/// the new visibility value in its aeProperty parameter
	/// <remarks>
	/// The manager may implement some process logic as a reaction to a control visibility change
	/// </remarks>
	/// <seealso cref="IMC_BindingVisualHandler" Device setup manager/>
	/// <seealso cref="MC_PluginInterface.IMC_BindingControl" Device setup control binding/>
	/// <seealso cref="IMC_BindingControlEvents" Device setup control binding events/>
	bvpcVisible = 1;
	/// <summary>
	/// This value informs the binding manager that a control's accessibility has changed
	/// </summary>
	/// Whenever a control accessibility changes as a result of a user interaction,
	/// the binding manager is warned through the OnVisualChanged event, which holds
	/// the new accessibility value in its aeProperty parameter
	/// <remarks>
	/// The manager may implement some process logic as a reaction to a control accessibility change
	/// </remarks>
	/// <seealso cref="IMC_BindingVisualHandler" Device setup manager/>
	/// <seealso cref="MC_PluginInterface.IMC_BindingControl" Device setup control binding/>
	/// <seealso cref="IMC_BindingControlEvents" Device setup control binding events/>
	bvpcEnabled = 2;

	// TMC_BindingTickStyle's values
	/// <summary>
	/// Automatic trackbar ticks
	/// </summary>
	/// Value of the TickStyle property for Trackbar controls
	/// <remarks>
	/// In automatic mode, the TrackBar control sets the progress ticks itself
	/// </remarks>
	/// <seealso cref="IMC_BindingVisualHandler" Device setup manager/>
	/// <seealso cref="MC_PluginInterface.IMC_BindingTrackBarControl" Trackbar control/>
	btsAuto = 0;
	/// <summary>
	/// Automatic trackbar ticks
	/// </summary>
	/// Value of the TickStyle property for Trackbar controls
	/// <remarks>
	/// In manual mode, the ticks are positioned using the interval (MaxValue div MinValue)-1
	/// </remarks>
	/// <seealso cref="IMC_BindingVisualHandler" Device setup manager/>
	/// <seealso cref="MC_PluginInterface.IMC_BindingTrackBarControl" Trackbar control/>
	btsManual = 1;
	/// <summary>
	/// No trackbar ticks
	/// </summary>
	/// Value of the TickStyle property for Trackbar controls
	/// <remarks>
	/// No ticks will be displayed
	/// </remarks>
	/// <seealso cref="IMC_BindingVisualHandler" Device setup manager/>
	/// <seealso cref="MC_PluginInterface.IMC_BindingTrackBarControl" Trackbar control/>
	btsNone = 2;

	// TMC_BindingAlignControl
	/// <summary>
	/// No alignment
	/// </summary>
	/// The control will retain the width and length defined during setup
	/// <remarks>
	/// </remarks>
	/// <seealso cref="IMC_BindingVisualHandler" Device setup manager/>
	/// <seealso cref="MC_PluginInterface.IMC_BindingControl" Device setup control definition/>
	balNone = 0;
	/// <summary>
	/// Top alignment
	/// </summary>
	/// The control will always remain as near as possible to the top of its parent control, spreading over the available width
	/// <remarks>
	/// </remarks>
	/// <seealso cref="IMC_BindingVisualHandler" Device setup manager/>
	/// <seealso cref="MC_PluginInterface.IMC_BindingControl" Device setup control definition/>
	balTop = 1;
	/// <summary>
	/// Bottom alignment
	/// </summary>
	/// The control will always remain as near as possible to the bottom of its parent control, spreading over the available width
	/// <remarks>
	/// </remarks>
	/// <seealso cref="IMC_BindingVisualHandler" Device setup manager/>
	/// <seealso cref="MC_PluginInterface.IMC_BindingControl" Device setup control definition/>
	balBottom = 2;
	/// <summary>
	/// Left alignment
	/// </summary>
	/// The control will always remain as near as possible to the left of its parent control, spreading over the available height
	/// <remarks>
	/// </remarks>
	/// <seealso cref="IMC_BindingVisualHandler" Device setup manager/>
	/// <seealso cref="MC_PluginInterface.IMC_BindingControl" Device setup control definition/>
	balLeft = 3;
	/// <summary>
	/// Right alignment
	/// </summary>
	/// The control will always remain as near as possible to the right of its parent control, spreading over the available height
	/// <remarks>
	/// </remarks>
	/// <seealso cref="IMC_BindingVisualHandler" Device setup manager/>
	/// <seealso cref="MC_PluginInterface.IMC_BindingControl" Device setup control definition/>
	balRight = 4;
	/// <summary>
	/// Client alignment
	/// </summary>
	/// The control will use all the available client area of its parent control
	/// <remarks>
	/// </remarks>
	/// <seealso cref="IMC_BindingVisualHandler" Device setup manager/>
	/// <seealso cref="MC_PluginInterface.IMC_BindingControl" Device setup control definition/>
	balClient = 5;

	// TMC_UICBSecurityRequestLevel
	/// <summary>
	/// Unknown security level
	/// </summary>
	/// No security level was specifed by the driver when calling <see cref="MC_PluginInterface.IMC_PluginCallback.onMC_UICallback"/>
	/// <remarks>
	/// When a driver makes a call to a callback function, it can specify the required security level
	/// </remarks>
	/// <seealso cref="MC_PluginInterface.IMC_PluginCallback"/>
	/// <seealso cref="IMC_UICallbackPISecurity"/>
	/// <seealso cref="IMC_UICallbackPIGetKey"/>
	/// <seealso cref="IMC_UICallbackPIGetString"/>
	/// <seealso cref="IMC_UICallbackPIChoose"/>
	srlUnknown = 0;
	/// <summary>
	/// User level security
	/// </summary>
	/// The driver requires that an identified user process the call to <see cref="MC_PluginInterface.IMC_PluginCallback.onMC_UICallback"/>
	/// <remarks>
	/// When a driver makes a call to a callback function, it can specify the required security level
	/// </remarks>
	/// <seealso cref="MC_PluginInterface.IMC_PluginCallback"/>
	/// <seealso cref="IMC_UICallbackPISecurity"/>
	/// <seealso cref="IMC_UICallbackPIGetKey"/>
	/// <seealso cref="IMC_UICallbackPIGetString"/>
	/// <seealso cref="IMC_UICallbackPIChoose"/>
	srlUser = 1;
	/// <summary>
	/// Supervisor level security
	/// </summary>
	/// The driver requires that an identified supervisor process the call to <see cref="MC_PluginInterface.IMC_PluginCallback.onMC_UICallback"/>
	/// <remarks>
	/// When a driver makes a call to a callback function, it can specify the required security level
	/// </remarks>
	/// <seealso cref="MC_PluginInterface.IMC_PluginCallback"/>
	/// <seealso cref="IMC_UICallbackPISecurity"/>
	/// <seealso cref="IMC_UICallbackPIGetKey"/>
	/// <seealso cref="IMC_UICallbackPIGetString"/>
	/// <seealso cref="IMC_UICallbackPIChoose"/>
	srlSupervisor = 2;
	/// <summary>
	/// Administrator level security
	/// </summary>
	/// The driver requires that an identified administrator process the call to <see cref="MC_PluginInterface.IMC_PluginCallback.onMC_UICallback"/>
	/// <remarks>
	/// When a driver makes a call to a callback function, it can specify the required security level
	/// </remarks>
	/// <seealso cref="MC_PluginInterface.IMC_PluginCallback"/>
	/// <seealso cref="IMC_UICallbackPISecurity"/>
	/// <seealso cref="IMC_UICallbackPIGetKey"/>
	/// <seealso cref="IMC_UICallbackPIGetString"/>
	/// <seealso cref="IMC_UICallbackPIChoose"/>
	srlAdministrator = 3;

	// TMC_UICallbackCarAllowedSet
	/// <summary>
	/// No restriction on the type of accepted characters
	/// </summary>
	/// The driver does not specify a restriction regarding the acceptable characters entered by the user within a <see cref="MC_PluginInterface.ctGetKey"/> type of call to <see cref="MC_PluginInterface.IMC_PluginCallback.onMC_UICallback"/>
	/// <remarks>
	/// When a driver makes a call to a <see cref="MC_PluginInterface.ctGetKey"/> type of onMC_UICallbacks, it can impose restrictions on the types of acceptable characters
	/// </remarks>
	/// <seealso cref="MC_PluginInterface.IMC_PluginCallback"/>
	/// <seealso cref="IMC_UICallbackPIGetKey"/>
	casUnknown = 0;
	/// <summary>
	/// Only upper case alphabetic characters are accepted
	/// </summary>
	/// The driver imposes that the user enter upper case alphabetic characters within a <see cref="MC_PluginInterface.ctGetKey"/> type of call to <see cref="MC_PluginInterface.IMC_PluginCallback.onMC_UICallback"/>
	/// <remarks>
	/// When a driver makes a call to a <see cref="MC_PluginInterface.ctGetKey"/> type of onMC_UICallbacks, it can impose restrictions on the types of acceptable characters
	/// </remarks>
	/// <seealso cref="MC_PluginInterface.IMC_PluginCallback"/>
	/// <seealso cref="IMC_UICallbackPIGetKey"/>
	casAlphaUpper = 1;
	/// <summary>
	/// Only lower case alphabetic characters are accepted
	/// </summary>
	/// The driver imposes that the user enter lower case alphabetic characters within a <see cref="MC_PluginInterface.ctGetKey"/> type of call to <see cref="MC_PluginInterface.IMC_PluginCallback.onMC_UICallback"/>
	/// <remarks>
	/// When a driver makes a call to a <see cref="MC_PluginInterface.ctGetKey"/> type of onMC_UICallbacks, it can impose restrictions on the types of acceptable characters
	/// </remarks>
	/// <seealso cref="MC_PluginInterface.IMC_PluginCallback"/>
	/// <seealso cref="IMC_UICallbackPIGetKey"/>
	casAlphaLower = 2;
	/// <summary>
	/// Only alphabetic characters are accepted
	/// </summary>
	/// The driver imposes that the user enter alphabetic characters within a <see cref="MC_PluginInterface.ctGetKey"/> type of call to <see cref="MC_PluginInterface.IMC_PluginCallback.onMC_UICallback"/>
	/// <remarks>
	/// When a driver makes a call to a <see cref="MC_PluginInterface.ctGetKey"/> type of onMC_UICallbacks, it can impose restrictions on the types of acceptable characters
	/// </remarks>
	/// <seealso cref="MC_PluginInterface.IMC_PluginCallback"/>
	/// <seealso cref="IMC_UICallbackPIGetKey"/>
	casAlpha = 3;
	/// <summary>
	/// Only numeric characters are accepted
	/// </summary>
	/// The driver imposes that the user enter numeric characters within a <see cref="MC_PluginInterface.ctGetKey"/> type of call to <see cref="MC_PluginInterface.IMC_PluginCallback.onMC_UICallback"/>
	/// <remarks>
	/// When a driver makes a call to a <see cref="MC_PluginInterface.ctGetKey"/> type of onMC_UICallbacks, it can impose restrictions on the types of acceptable characters
	/// </remarks>
	/// <seealso cref="MC_PluginInterface.IMC_PluginCallback"/>
	/// <seealso cref="IMC_UICallbackPIGetKey"/>
	casNumeric = 4;
	/// <summary>
	/// Only upper case alphanumeric characters are accepted
	/// </summary>
	/// The driver imposes that the user enter upper case alphanumeric characters within a <see cref="MC_PluginInterface.ctGetKey"/> type of call to <see cref="MC_PluginInterface.IMC_PluginCallback.onMC_UICallback"/>
	/// <remarks>
	/// When a driver makes a call to a <see cref="MC_PluginInterface.ctGetKey"/> type of onMC_UICallbacks, it can impose restrictions on the types of acceptable characters
	/// </remarks>
	/// <seealso cref="MC_PluginInterface.IMC_PluginCallback"/>
	/// <seealso cref="IMC_UICallbackPIGetKey"/>
	casAlphaUpNum = 5;
	/// <summary>
	/// Only lower case alphanumeric characters are accepted
	/// </summary>
	/// The driver imposes that the user enter lower case alphanumeric characters within a <see cref="MC_PluginInterface.ctGetKey"/> type of call to <see cref="MC_PluginInterface.IMC_PluginCallback.onMC_UICallback"/>
	/// <remarks>
	/// When a driver makes a call to a <see cref="MC_PluginInterface.ctGetKey"/> type of onMC_UICallbacks, it can impose restrictions on the types of acceptable characters
	/// </remarks>
	/// <seealso cref="MC_PluginInterface.IMC_PluginCallback"/>
	/// <seealso cref="IMC_UICallbackPIGetKey"/>
	casAlphaLoNum = 6;
	/// <summary>
	/// Only alphanumeric characters are accepted
	/// </summary>
	/// The driver imposes that the user enter alphanumeric characters within a <see cref="MC_PluginInterface.ctGetKey"/> type of call to <see cref="MC_PluginInterface.IMC_PluginCallback.onMC_UICallback"/>
	/// <remarks>
	/// When a driver makes a call to a <see cref="MC_PluginInterface.ctGetKey"/> type of onMC_UICallbacks, it can impose restrictions on the types of acceptable characters
	/// </remarks>
	/// <seealso cref="MC_PluginInterface.IMC_PluginCallback"/>
	/// <seealso cref="IMC_UICallbackPIGetKey"/>
	casAlphaNum = 7;
	/// <summary>
	/// Only numercic characters and letters "V", "C", "A" are accepted
	/// </summary>
	/// The driver imposes that the user enter alphanumeric characters within a <see cref="MC_PluginInterface.ctGetKey"/> type of call to <see cref="MC_PluginInterface.IMC_PluginCallback.onMC_UICallback"/>
	/// The letters "V", "C" and "A" match the values <see cref="cbrOk"/>, <see cref="cbrCorrection"/> and <see cref="cbrNoAnswer"/> respectively
	/// <remarks>
	/// When a driver makes a call to a <see cref="MC_PluginInterface.ctGetKey"/> type of onMC_UICallbacks, it can impose restrictions on the types of acceptable characters
	/// </remarks>
	/// <seealso cref="MC_PluginInterface.IMC_PluginCallback"/>
	/// <seealso cref="IMC_UICallbackPIGetKey"/>
	/// <seealso cref="TMC_CallbackResult" Callback result types/>
	casNumVCA = 8;

	// TMC_ReportType
	/// <summary>
	/// Unknown report type
	/// </summary>
	/// This is the undefined value for report types
	/// <seealso cref="TMC_ReportType" Report types/>
	/// <seealso cref="MC_PluginInterface.IMC_PluginCallback" coworking callback management/>
	pptUnknown = 0;
	/// <summary>
	/// Generic report type 1
	/// </summary>
	/// This values identifies a generic report type 1.<p>
	/// These values are generic and could be "adapted" by every device type needing this co-operation command.
	/// <seealso cref="TMC_ReportType" Report types/>
	/// <seealso cref="MC_PluginInterface.IMC_PluginCallback" coworking callback management/>
	pptReportType1 = 1;
	/// <summary>
	/// Generic report type 2
	/// </summary>
	/// This values identifies a generic report type 2.<p>
	/// These values are generic and could be "adapted" by every device type needing this co-operation command.
	/// <seealso cref="TMC_ReportType" Report types/>
	/// <seealso cref="MC_PluginInterface.IMC_PluginCallback" coworking callback management/>
	pptReportType2 = 2;
	/// <summary>
	/// Generic report type 3
	/// </summary>
	/// This values identifies a generic report type 3.<p>
	/// These values are generic and could be "adapted" by every device type needing this co-operation command.
	/// <seealso cref="TMC_ReportType" Report types/>
	/// <seealso cref="MC_PluginInterface.IMC_PluginCallback" coworking callback management/>
	pptReportType3 = 3;
	/// <summary>
	/// Generic report type 4
	/// </summary>
	/// This values identifies a generic report type 4.<p>
	/// These values are generic and could be "adapted" by every device type needing this co-operation command.
	/// <seealso cref="TMC_ReportType" Report types/>
	/// <seealso cref="MC_PluginInterface.IMC_PluginCallback" coworking callback management/>
	pptReportType4 = 4;
	/// <summary>
	/// Generic report type 5
	/// </summary>
	/// This values identifies a generic report type 5.<p>
	/// These values are generic and could be "adapted" by every device type needing this co-operation command.
	/// <seealso cref="TMC_ReportType" Report types/>
	/// <seealso cref="MC_PluginInterface.IMC_PluginCallback" coworking callback management/>
	pptReportType5 = 5;
	/// <summary>
	/// Generic report type 6
	/// </summary>
	/// This values identifies a generic report type 6.<p>
	/// These values are generic and could be "adapted" by every device type needing this co-operation command.
	/// <seealso cref="TMC_ReportType" Report types/>
	/// <seealso cref="MC_PluginInterface.IMC_PluginCallback" coworking callback management/>
	pptReportType6 = 6;
	/// <summary>
	/// Generic report type 7
	/// </summary>
	/// This values identifies a generic report type 7.<p>
	/// These values are generic and could be "adapted" by every device type needing this co-operation command.
	/// <seealso cref="TMC_ReportType" Report types/>
	/// <seealso cref="MC_PluginInterface.IMC_PluginCallback" coworking callback management/>
	pptReportType7 = 7;
	/// <summary>
	/// Generic report type 8
	/// </summary>
	/// This values identifies a generic report type 8.<p>
	/// These values are generic and could be "adapted" by every device type needing this co-operation command.
	/// <seealso cref="TMC_ReportType" Report types/>
	/// <seealso cref="MC_PluginInterface.IMC_PluginCallback" coworking callback management/>
	pptReportType8 = 8;
	/// <summary>
	/// Generic report type 9
	/// </summary>
	/// This values identifies a generic report type 9.<p>
	/// These values are generic and could be "adapted" by every device type needing this co-operation command.
	/// <seealso cref="TMC_ReportType" Report types/>
	/// <seealso cref="MC_PluginInterface.IMC_PluginCallback" coworking callback management/>
	pptReportType9 = 9;

	// TMC_CPOSCommandId
	/// <summary>
	/// Unknown CPOS co-operation command
	/// </summary>
	/// This is the undefined CPOPS co-operation command identifier.
	ccUnknown = 0;
	/// <summary>
	/// CPOS co-operation command to print bank cheque
	/// </summary>
	/// This co-operation command allows CPOS drivers (usually CAT drivers) to request to CPOS to manage  printing out of a bank cheque.<p>
	/// When this command is called, specifid data must be provided by caller driver to fill up mandatory fields on bank cheque.
	/// <seealso cref="IMC_PluginCallbackV2.onMC_CPOSCommand" Callback V2 interface/>
	/// <seealso cref="IMC_CPOSCommandContext" Execution context of CPOS commands/>
	ccPrintCheque = 100;
	/// <summary>
	/// CPOS co-operation command to print Eject bank cheque (on MICR process)
	/// </summary>
	/// This co-operation command allows CPOS drivers (usually CAT drivers) to request to CPOS to manage eject a bank cheque from reader.<p>
	/// <seealso cref="IMC_PluginCallbackV2.onMC_CPOSCommand" Callback V2 interface/>
	/// <seealso cref="IMC_CPOSCommandContext" Execution context of CPOS commands/>
	ccEjectMICRCheque = 101;
	/// <summary>
	/// CPOS co-operation command to read MICR data from bank cheque (on MICR process)
	/// </summary>
	/// This co-operation command allows CPOS drivers (usually CAT drivers) to request to CPOS to manage reading of MICR track from a bank cheque.<p>
	/// <seealso cref="IMC_PluginCallbackV2.onMC_CPOSCommand" Callback V2 interface/>
	/// <seealso cref="IMC_CPOSCommandContext" Execution context of CPOS commands/>
	ccReadMICRCheque = 102;
	/// <summary>
	/// Command to determine whether defective devices can be locked.
	/// </summary>
	/// This command identifier is used by the driver to determine whether it can lock defective devices.<p>
	/// <seealso cref="IMC_PluginCallbackV2.onMC_CPOSCommand" Callback V2 interface/>
	/// <seealso cref="IMC_CPOSCommandContext" Execution context of CPOS commands/>
	ccCanLockDevices = 103;
	/// <summary>
	/// Command to lock defective devices.
	/// </summary>
	/// This command identifier is used by the driver to request the lock of defective devices.<p>
	/// <seealso cref="IMC_PluginCallbackV2.onMC_CPOSCommand" Callback V2 interface/>
	/// <seealso cref="IMC_CPOSCommandContext" Execution context of CPOS commands/>
	ccLockDevices = 104;
	/// <summary>
	/// Command to print a text file by co-operation CPOS.
	/// </summary>
	/// This command identifier is used by any driver to run a printing process from a text file.<p>
	/// <seealso cref="IMC_PluginCallbackV2.onMC_CPOSCommand" Callback V2 interface/>
	/// <seealso cref="IMC_CPOSCommandContext" Execution context of CPOS commands/>
	ccPrintFile = 105;
	/// <summary>
	/// Command to print from a XML stream by co-operation CPOS.
	/// </summary>
	/// This command identifier is used by any driver to run a printing process from a XML stream.<p>
	/// <seealso cref="IMC_PluginCallbackV2.onMC_CPOSCommand" Callback V2 interface/>
	/// <seealso cref="IMC_CPOSCommandContext" Execution context of CPOS commands/>
	ccPrintXmlStream = 106;
	/// <summary>
	/// Command to Get the sequence register number of the device by co-operation CPOS.
	/// </summary>
	/// This command allows a CPOS device driver to know with which number it has been register in CPOS environement.<p>
	/// <seealso cref="IMC_PluginCallbackV2.onMC_CPOSCommand" Callback V2 interface/>
	/// <seealso cref="IMC_CPOSCommandContext" Execution context of CPOS commands/>
	ccGetDeviceNumber = 107;

	// TMC_UICallbackGetStringAllowedCarSet
	/// <summary>
	/// Unknown restrictions on the type of accepted characters
	/// </summary>
	/// The driver does not specify a specific restriction regarding the acceptable characters entered by the user within a <see cref="MC_PluginInterface.ctGetString"/> type of call to <see cref="MC_PluginInterface.IMC_PluginCallback.onMC_UICallback"/>
	/// <remarks>
	/// When a driver makes a call to a <see cref="MC_PluginInterface.ctGetString"/> type of onMC_UICallbacks, it can impose restrictions on the types of acceptable characters
	/// </remarks>
	/// <seealso cref="MC_PluginInterface.IMC_PluginCallback"/>
	/// <seealso cref="IMC_UICallbackPIGetStringV2"/>
	gacsUnknown = 0;
	/// <summary>
	/// Only upper case alphabetic characters are accepted
	/// </summary>
	/// The driver imposes that the user enter upper case alphabetic characters within a <see cref="MC_PluginInterface.ctGetString"/> type of call to <see cref="MC_PluginInterface.IMC_PluginCallback.onMC_UICallback"/>
	/// <remarks>
	/// When a driver makes a call to a <see cref="MC_PluginInterface.ctGetString"/> type of onMC_UICallbacks, it can impose restrictions on the types of acceptable characters
	/// </remarks>
	/// <seealso cref="MC_PluginInterface.IMC_PluginCallback"/>
	/// <seealso cref="IMC_UICallbackPIGetStringV2"/>
	gacsAlphaUpper = 1;
	/// <summary>
	/// Only lower case alphabetic characters are accepted
	/// </summary>
	/// The driver imposes that the user enter lower case alphabetic characters within a <see cref="MC_PluginInterface.ctGetString"/> type of call to <see cref="MC_PluginInterface.IMC_PluginCallback.onMC_UICallback"/>
	/// <remarks>
	/// When a driver makes a call to a <see cref="MC_PluginInterface.ctGetString"/> type of onMC_UICallbacks, it can impose restrictions on the types of acceptable characters
	/// </remarks>
	/// <seealso cref="MC_PluginInterface.IMC_PluginCallback"/>
	/// <seealso cref="IMC_UICallbackPIGetStringV2"/>
	gacsAlphaLower = 2;
	/// <summary>
	/// Only alphabetic characters are accepted
	/// </summary>
	/// The driver imposes that the user enter alphabetic characters within a <see cref="MC_PluginInterface.ctGetString"/> type of call to <see cref="MC_PluginInterface.IMC_PluginCallback.onMC_UICallback"/>
	/// <remarks>
	/// When a driver makes a call to a <see cref="MC_PluginInterface.ctGetString"/> type of onMC_UICallbacks, it can impose restrictions on the types of acceptable characters
	/// </remarks>
	/// <seealso cref="MC_PluginInterface.IMC_PluginCallback"/>
	/// <seealso cref="IMC_UICallbackPIGetStringV2"/>
	gacsAlpha = 3;
	/// <summary>
	/// Only numeric characters are accepted
	/// </summary>
	/// The driver imposes that the user enter numeric characters within a <see cref="MC_PluginInterface.ctGetString"/> type of call to <see cref="MC_PluginInterface.IMC_PluginCallback.onMC_UICallback"/>
	/// <remarks>
	/// When a driver makes a call to a <see cref="MC_PluginInterface.ctGetString"/> type of onMC_UICallbacks, it can impose restrictions on the types of acceptable characters
	/// </remarks>
	/// <seealso cref="MC_PluginInterface.IMC_PluginCallback"/>
	/// <seealso cref="IMC_UICallbackPIGetStringV2"/>
	gacsNumeric = 4;
	/// <summary>
	/// Only upper case alphanumeric characters are accepted
	/// </summary>
	/// The driver imposes that the user enter upper case alphanumeric characters within a <see cref="MC_PluginInterface.ctGetString"/> type of call to <see cref="MC_PluginInterface.IMC_PluginCallback.onMC_UICallback"/>
	/// <remarks>
	/// When a driver makes a call to a <see cref="MC_PluginInterface.ctGetString"/> type of onMC_UICallbacks, it can impose restrictions on the types of acceptable characters
	/// </remarks>
	/// <seealso cref="MC_PluginInterface.IMC_PluginCallback"/>
	/// <seealso cref="IMC_UICallbackPIGetStringV2"/>
	gacsAlphaUpNum = 5;
	/// <summary>
	/// Only lower case alphanumeric characters are accepted
	/// </summary>
	/// The driver imposes that the user enter lower case alphanumeric characters within a <see cref="MC_PluginInterface.ctGetString"/> type of call to <see cref="MC_PluginInterface.IMC_PluginCallback.onMC_UICallback"/>
	/// <remarks>
	/// When a driver makes a call to a <see cref="MC_PluginInterface.ctGetString"/> type of onMC_UICallbacks, it can impose restrictions on the types of acceptable characters
	/// </remarks>
	/// <seealso cref="MC_PluginInterface.IMC_PluginCallback"/>
	/// <seealso cref="IMC_UICallbackPIGetStringV2"/>
	gacsAlphaLoNum = 6;
	/// <summary>
	/// Only alphanumeric characters are accepted
	/// </summary>
	/// The driver imposes that the user enter alphanumeric characters within a <see cref="MC_PluginInterface.ctGetString"/> type of call to <see cref="MC_PluginInterface.IMC_PluginCallback.onMC_UICallback"/>
	/// <remarks>
	/// When a driver makes a call to a <see cref="MC_PluginInterface.ctGetString"/> type of onMC_UICallbacks, it can impose restrictions on the types of acceptable characters
	/// </remarks>
	/// <seealso cref="MC_PluginInterface.IMC_PluginCallback"/>
	/// <seealso cref="IMC_UICallbackPIGetStringV2"/>
	gacsAlphaNum = 7;
	/// <summary>
	/// No restriction on the type of accepted characters
	/// </summary>
	/// The driver imposes a "no restriction" regarding the acceptable characters entered  (that is : any character can be entered) by the user within a <see cref="MC_PluginInterface.ctGetString"/> type of call to <see cref="MC_PluginInterface.IMC_PluginCallback.onMC_UICallback"/>
	/// <remarks>
	/// When a driver makes a call to a <see cref="MC_PluginInterface.ctGetString"/> type of onMC_UICallbacks, it can impose restrictions on the types of acceptable characters
	/// </remarks>
	/// <seealso cref="MC_PluginInterface.IMC_PluginCallback"/>
	/// <seealso cref="IMC_UICallbackPIGetStringV2"/>
	gacsNoControl = 99;

	// Prefixe MC_
	/// <summary>
	/// General prefix for the command identifiers used when calling OnMC_Callback
	/// </summary>
	/// This prefix is used for all the token identifiers used to exchange parameters between CPOS and the drivers
	/// <seealso cref="MC_PluginInterface.IMC_PluginCallback.OnMC_Callback" Callback interface/>
	MC_ = 'MC_';
	// MC_Callback Commands
	/// <summary>
	/// Direct Command called from onMC_Callback identifier
	/// </summary>
	/// This identifier is used to indicate that the call to DirectCommand method is made by <c>onMC_Callback</c> method.
	MC_Callback = MC_ + 'Callback';
	// MC_Callback Commands
	/// <summary>
	/// Command identifier
	/// </summary>
	/// This identifier is used to indicate that the following identifier is the actual command when calling <c>onMC_Callback</c>
	/// <example>
	/// <code>
	/// lsCommand:=MC_command+'='+MC_openDrawer+';'+MC_beepTimeout+'=0;' ;
	/// </code>
	/// </example>
	MC_Command = MC_ + 'Command';
	/// <summary>
	/// Cash drawer open command
	/// </summary>
	/// Command requesting driver to open the cash drawer
	/// <example>
	/// The following example shows how to request that open the cash drawer (the first one to be registered)
	/// <code>
	/// lcCommand:=wideStringToStream(MC_command+'='+MC_openDrawer+';'+MC_beepTimeout+'=0;') ;
	/// try
	/// if Callback.onMC_Callback(self,dtCashDrawer,-1,TStreamAdapter.Create(lcCommand, soReference) as IStream,lcAnswer,zcErr)<>cbrOk then
	/// setError(zcErr) ;
	/// finally
	/// lcCommand.free ;
	/// end ;
	/// </code>
	/// </example>
	MC_OpenDrawer = 'OpenCashDrawer';
	/// <summary>
	/// Command requesting that a shape be displayed on the signature pad
	/// </summary>
	/// Command requesting to display a shape on the signature pad
	/// <example>
	/// Example:
	/// <code>
	/// if length(asCodeForm)>0 then
	/// begin
	/// lcInput:=wideStringtoStream(MC_Command+'='+MC_DisplayForm+';'+MC_FormName+'"'+asCodeForm+';') ;
	/// try
	/// if not Plugin.doMC_Callback(dtSig,-1,TStreamAdapter.Create(lcInput, soReference) as IStream,lcAnswer,lcErr)<>cbrOk then
	/// setError(lcErr) ;
	/// finally
	/// lcInput.free ;
	/// end ;
	/// end ;
	/// </code>
	/// </example>
	MC_DisplayForm = 'DisplayForm';
	/// <summary>
	/// Token indicating the name of the shape to display on the signature pad
	/// </summary>
	/// This token indicates the name (or the code) of the shape which is to be displayed on the signature pad
	/// <example>
	/// <see cref="MC_DisplayForm"/>
	/// </example>
	MC_DFFormName = MC_ + 'FormName';
	/// <summary>
	/// Commande requesting the state of a printer
	/// </summary>
	/// Command requesting to get current printer's status
	/// <example>
	/// The following example shows how to request that driver gets current printer's status
	/// <code>
	/// lcCommand:=wideStringToStream(MC_Command+'='+MC_GetPrinterState+';') ;
	/// try
	/// Callback.onMC_Callback(self,dtPrinter,liDeviceNum,TStreamAdapter.Create(lcCommand, soReference) as IStream,lcAnswer,zcError) ;
	/// lsResult:=widestringFromStream(lcAnswer) ;
	/// liResult:=valeuri(trouveArgument(lsResult,MC_CurrentPrinterState,ord(psUnknown))) ;
	/// lePrinterState:=TMC_PrinterState(liResult) ;
	/// finally
	/// lcCommand.free ;
	/// end ;
	/// </code>
	/// </example>
	MC_GetPrinterState = 'GetPrinterState';
	/// <summary>
	/// Token indicating the current state of the printer
	/// </summary>
	/// This identifier is used by the driver to return the current state of the printer
	MC_CurrentPrinterState = 'CurrentPrinterState';

	/// <summary>
	/// Print file (deprecated)
	/// </summary>
	/// Command requesting CPOS to print a file.<p>
	/// This command is deprecated, it is preferable to use <see cref="IMC_PluginCallbackV2.OnMC_CPOSCommand"/> method.
	/// <example>
	/// The following example shows how to request that CPOS print a given file
	/// <code>
	/// lcCommand:=wideStringToStream(MC_Command+'='+MC_PrintFile+';'+MC_PFFilename+'='+lsNomFichier+';'+MC_PFOriginalCommand+'='+lsOriginalCommand+';'+MC_PFPrintMode+'='+lsPrintMode+';') ;
	/// try
	/// Callback.onMC_Callback(self,dtCPOS,liDeviceNum,TStreamAdapter.Create(lcCommand, soReference) as IStream,lcAnswer,zcError) ;
	/// finally
	/// lcCommand.free ;
	/// end ;
	/// </code>
	/// </example>
	MC_PrintFile = 'PrintFile';
	/// <summary>
	/// Print from stream (deprecated)
	/// </summary>
	/// Command requesting CPOS to print from a data stream.<p>
	/// This command is deprecated, it is preferable to use <see cref="IMC_PluginCallbackV2.OnMC_CPOSCommand"/> method.
	/// <example>
	/// The following example shows how to request that CPOS print from a data stream
	/// <code>
	/// lcCommand:=wideStringToStream(MC_Command+'='+MC_PrintFlux+';'+MC_PFOriginalCommand+'='+lsOriginalCommand+';'+MC_PFPrintMode+'='+lsPrintMode+';'+MC_PFPrintModele+'='+lsModele+';'+MC_PFflux+'='+lsFlux+';') ;
	/// try
	/// Callback.onMC_Callback(self,dtCPOS,liDeviceNum,TStreamAdapter.Create(lcCommand, soReference) as IStream,lcAnswer,zcError) ;
	/// finally
	/// lcCommand.free ;
	/// end ;
	/// </code>
	/// </example>
	MC_PrintFlux = 'PrintFlux';

	// Params' name for PrintFile and PrintFlux Command
	/// <summary>
	/// Parameter identifier for filenames (deprecated).
	/// </summary>
	/// This parameter identifier indicates the filename to be printed.<p>
	/// This command is obsolete, it is preferable to use <see cref="IMC_PluginCallbackV2.OnMC_CPOSCommand"/> method.
	/// <example>
	/// <see cref="MC_PrintFile"/>
	/// </example>
	MC_PFFileName = 'FileName';
	/// <summary>
	/// Printer device number (deprecated).
	/// </summary>
	/// This parameter identifier indicates the device number of the printer to be used.<p>
	/// This command is obsolete, it is preferable to use <see cref="IMC_PluginCallbackV2.OnMC_CPOSCommand"/> method.
	/// <example>
	/// <see cref="MC_PrintFile"/>
	/// </example>
	MC_PFDeviceNum = 'printerDeviceNum';
	/// <summary>
	/// Parameter identifier for original commands (deprecated).
	/// </summary>
	/// This parameter identifier indicates the original command.<p>
	/// This command is obsolete, it is preferable to use <see cref="IMC_PluginCallbackV2.OnMC_CPOSCommand"/> method.
	/// <example>
	/// <see cref="MC_PrintFile"/>
	/// <see cref="MC_PrintFlux"/>
	/// </example>
	MC_PFOriginalCommand = 'OriginalCommand';
	/// <summary>
	/// Parameter identifier for print modes (deprecated).
	/// </summary>
	/// This parameter identifier indicates the print mode.<p>
	/// This command is obsolete, it is preferable to use <see cref="IMC_PluginCallbackV2.OnMC_CPOSCommand"/> method.<p>
	/// For instance:<p>
	/// When printing a transaction payment receipt, it is used to identify the customer printout and the store printout.
	/// <example>
	/// <see cref="MC_PrintFile"/>
	/// <see cref="MC_PrintFlux"/>
	/// </example>
	MC_PFPrintMode = 'PrintMode';
	/// <summary>
	/// Parameter identifier for ticket templates (deprecated).
	/// </summary>
	/// This parameter identifier indicates the template to be used.<p>
	/// This command is obsolete, it is preferable to use <see cref="IMC_PluginCallbackV2.OnMC_CPOSCommand"/> method.
	/// <example>
	/// <see cref="MC_PrintFile"/>
	/// <see cref="MC_PrintFlux"/>
	/// </example>
	MC_PFPrintModele = 'Modele';
	/// <summary>
	/// Parameter identifier for data streams (deprecated).
	/// </summary>
	/// This parameter identifier indicates the stream to be used as a data source.<p>
	/// This command is obsolete, it is preferable to use <see cref="IMC_PluginCallbackV2.OnMC_CPOSCommand"/> method.
	/// <example>
	/// <see cref="MC_PrintFlux"/>
	/// </example>
	MC_PFFlux = 'flux';

	// Filename Id on Params
	/// <summary>
	/// Parameter identifier for filenames to be stored on disk
	/// </summary>
	/// This parameter identifier indicates the name of the file to store on disk
	/// <example>
	/// <code>
	/// if IsExport then
	/// lsConnectString:=lsConnectString+MC_FilenameID + '='+lsMyFilename;
	/// </code>
	/// </example>
	MC_FilenameID = MC_ + 'FilenameID';
	/// <summary>
	/// Token for imposed filenames
	/// </summary>
	/// This token, when appended after the filename, indicates that it is imposed and should not be submitted for user validation
	/// <example>
	/// <code>
	/// if IsExport then
	/// lsConnectString:=lsConnectString+MC_FilenameID + '='+lsMyFilename+MC_FilenameSug ;
	/// </code>
	/// </example>
	MC_FilenameForce = '!';
	/// <summary>
	/// Token for suggested filenames
	/// </summary>
	/// This token, when appended after the filename, indicates that it is only a suggestion, which should be submitted for user validation
	/// <example>
	/// <code>
	/// if IsExport then
	/// lsConnectString:=lsConnectString+MC_FilenameID + '='+lsMyFilename+MC_FilenameSug ;
	/// </code>
	/// </example>
	MC_FileNameSug = '?';

	// Can lock the device out of service?
	/// <summary>
	/// Command to determine whether defective devices can be locked (deprecated).
	/// </summary>
	/// This command identifier is used by the driver to determine whether it can lock defective devices.<p>
	/// This command is obsolete (from  May 13th 2013), it is preferable to use <see cref="IMC_PluginCallbackV2.OnMC_CPOSCommand"/> method.
	/// <example>
	/// <code>
	/// if manageMC_CallBack(MC_Command+'='+MC_CanLockDevices+';') then
	/// LockDevice ;
	/// </code>
	/// </example>
	MC_CanLockDevices = 'canLockDevices';

	// Lock the device out of service
	/// <summary>
	/// Command to lock the driver or all the devices (deprecated).
	/// </summary>
	/// This command identifier is used by the driver to lock itself or ALL the devices of the workstation.<p>
	/// This command is obsolete (From May 13th 2013), it is preferable to use <see cref="IMC_PluginCallbackV2.OnMC_CPOSCommand"/> method.
	/// <example>
	/// <code>
	/// if manageMC_CallBack(MC_Command+'='+MC_LockDevice+';'+MC_LDAllDevices+'=-;') then
	/// LockDevice ;
	/// </code>
	/// </example>
	MC_LockDevice = 'LockDevice';
	/// <summary>
	/// Command to lock all the devices (deprecated)
	/// </summary>
	/// This token indicates whether the lock must apply to all the devices of the workstation.<p>
	/// This command is obsolete, it is preferable to use <see cref="IMC_PluginCallbackV2.OnMC_CPOSCommand"/> method.
	/// <example>
	/// <see cref="MC_DisplayForm"/>
	/// </example>
	MC_LDAllDevices = MC_ + 'AllDevices';

	/// <summary>
	/// Command to load a list of elements
	/// </summary>
	/// Command requesting the client application to provide a list of elements (such lists are usually displayed in comboboxes)
	/// <example>
	/// The following example shows how to request the list of report template codes from the client application, which will be used by the driver.
	/// <code>
	/// lsCommand:=mc_Command+'='+MC_LoadCombo+';'+MC_LCComboID+'='+MC_LCReceiptModels+';'+MC_LCNature+'='+cmPrinterReceiptNature.value+';' ;
	/// if manageMC_Callback(lsCommand,lsAnswer,lcErr)=cbrOk then
	/// ChargeComboModeles(lsAnswer) ;
	/// </code>
	/// </example>
	MC_LoadCombo = 'LoadCombo';
	/// <summary>
	/// Token identifying the combobox control which should be filled with the elements of the list <see cref="MC_PluginInterface.MC_LoadCombo"/>
	/// </summary>
	/// This token indicates the name (or the code) of the combobox control to be filled with the elements of the list
	/// <example>
	/// <see cref="MC_LoadCombo"/>
	/// </example>
	MC_LCComboID = MC_ + 'ComboID';
	/// <summary>
	/// Identifier to request report template types
	/// </summary>
	/// This identifier is used by the driver to request report template types from the client application.
	/// <example>
	/// <see cref="MC_LoadCombo"/>
	/// </example>
	MC_LCReceiptNatureModels = MC_ + 'ReceiptNatureModels';
	/// <summary>
	/// Identifier to request cheque template types
	/// </summary>
	/// This identifier is used by the driver to request cheque template types from the client application.
	/// <example>
	/// <see cref="MC_LoadCombo"/>
	/// </example>
	MC_LCChequeNatureModels = MC_ + 'ChequeNatureModels';
	/// <summary>
	/// Identifier to request report templates
	/// </summary>
	/// This identifier is used by the driver to request report templates from the client application.
	/// <example>
	/// <see cref="MC_LoadCombo"/>
	/// </example>
	MC_LCReceiptModels = MC_ + 'ReceiptModels';
	/// <summary>
	/// Identifier to request report types
	/// </summary>
	/// This identifier is used by the driver to request report types from the client application.
	/// <example>
	/// <see cref="MC_LoadCombo"/>
	/// </example>
	MC_LCNature = MC_ + 'Nature';

	/// <summary>
	/// Command requesting bank card data entry from the client application
	/// </summary>
	/// Command requesting bank card data entry from the client application
	MC_GetCardData = 'GetCardData';

	/// <summary>
	/// Command requesting bank card types from the client application
	/// </summary>
	/// Command requesting that the clerk indicate the type of card: debit or credit
	MC_ChoiceDebitOrCreditCard = 'ChoiceDebitOrCreditCard';

	/// <summary>
	/// Command requesting DCC information entry from the client application
	/// </summary>
	/// Command requesting DCC information entry from the client application
	MC_ChoiceDCC = 'ChoiceDCC';

	/// <summary>
	/// Command requesting card authorization number from the client application
	/// </summary>
	/// Command requesting card authorization number entry from the client application
	MC_GetCardAuthorizationNumber = 'GetCardAuthorizationNumber';

	/// <summary>
	/// Command requesting some data about the store of the register from the client application
	/// </summary>
	/// Command requesting some data about the store of the register from the client application
	MC_GetRegisterStoreDetail = 'GetRegisterStoreDetail';

	/// <summary>
	/// Command requesting barcode gathering from the client application
	/// </summary>
	/// Command requesting barcode entry from the client application
	MC_GetBarCode = 'GetBarCode';

	/// <summary>
	/// Command requesting the client application to display a final report of an action
	/// </summary>
	/// Command requesting he client application to display a report
	MC_DisplayFinalReport = 'DisplayFinalReport';

	// Entry point Plugin DLL's name
	/// <summary>
	/// Entry point function name in the Win32 dll
	/// </summary>
	/// Entry point function name in the Win32 dll
	MC_Win32DLLEP = 'getPluginLoader';

type
	/// <summary>
	/// CPOS device types
	/// </summary>
	/// <remarks>
	/// For compatibility reasons, the enumerated types had to be replaced by numeric values.<p>
	/// Constants were introduced for better code readability.
	/// </remarks>
	/// <seealso cref="dtUnknown" Unknown device/>
	/// <seealso cref="dtApplication" Application device/>
	/// <seealso cref="dtPrinter" Receipt printer/>
	/// <seealso cref="dtLineDisplay" Customer line display/>
	/// <seealso cref="dtCashDrawer" Cash drawer/>
	/// <seealso cref="dtMSR" Card Magnetic Stripe Reader/>
	/// <seealso cref="dtPPad" Pin pad/>
	/// <seealso cref="dtSig" Signature pad/>
	/// <seealso cref="dtCAT" Cardholder Activated terminal/>
	/// <seealso cref="dtBiometrics" Biometrics terminal/>
	/// <seealso cref="dtPointCard" Point card reader/writer terminal/>
	/// <seealso cref="dtFiscalTaxBox" Fiscal tax box terminal/>
	/// <seealso cref="dtICAOReader" ICAO compatible document reader terminal/>
	/// <seealso cref="dtCPOS" CPOS device/>
	TMC_DeviceType = integer;
	/// <summary>
	/// Device states
	/// </summary>
	/// <remarks>
	/// For compatibility reasons, the enumerated types had to be replaced by numeric values.<p>
	/// Constants were introduced for better code readability.
	/// </remarks>
	/// <seealso cref="dsUnknown" Unknown device state/>
	/// <seealso cref="dsConnect" The driver is connected/>
	/// <seealso cref="dsOnLine" The driver is connected and online/>
	/// <seealso cref="MC_PluginInterface.IMC_PluginBase.state" Returns the device state/>
	TMC_StateDevice = integer;
	/// <summary>
	/// Device capability types
	/// </summary>
	/// <remarks>
	/// Each device uses its own values to improve code readability.<p>
	/// For compatibility reasons, the enumerated types had to be replaced by numeric values.<p>
	/// Constants were introduced for better code readability.
	/// </remarks>
	TMC_Capabilities = integer;
	/// <summary>
	/// Log severity types
	/// </summary>
	/// <remarks>
	/// For compatibility reasons, the enumerated types had to be replaced by numeric values.<p>
	/// Constants were introduced for better code readability.
	/// </remarks>
	/// <seealso cref="lsUnknown" Unknown log severity/>
	/// <seealso cref="lsVerbose" Encompasses all the available types of messages./>
	/// <seealso cref="lsInformation" Includes simple information messages./>
	/// <seealso cref="lsWarning" Includes warning messages./>
	/// <seealso cref="lsError" Includes error messages./>
	TMC_LogSeverity = integer;
	/// <summary>
	/// User Interface callback types
	/// </summary>
	/// <remarks>
	/// For compatibility reasons, the enumerated types had to be replaced by numeric values.<p>
	/// Constants were introduced for better code readability.
	/// </remarks>
	/// <seealso cref="TMC_UICallbackType" Log severity/>
	/// <seealso cref="IMC_UICallbackPIMessage" User interface callback message interface/>
	/// <seealso cref="ctUnknown" Unknown callback type/>
	/// <seealso cref="ctMessage" Message callback type/>
	/// <seealso cref="ctAsk" Question callback/>
	/// <seealso cref="ctAskCancel" Question callback with cancel/>
	/// <seealso cref="ctWarning" Warning message callback/>
	/// <seealso cref="ctError" Error message callback/>
	/// <seealso cref="ctMoveInit" Progress bar initialization callback/>
	/// <seealso cref="ctMove" Progress bar update callback/>
	/// <seealso cref="ctMoveEnd" Progress bar termination callback/>
	/// <seealso cref="ctGetKey" Keyboard entry callback/>
	/// <seealso cref="ctSecurity" Access rights assessment callback/>
	/// <seealso cref="ctGetString" Text entry callback/>
	/// <seealso cref="ctContinueProc" Operation in progress callback/>
	/// <seealso cref="ctOpenedCashDrawer" Open cash drawer callback/>
	/// <seealso cref="ctClosedCashDrawer" Closed cash drawer callback/>
	/// <seealso cref="ctChoose" Multiple choice user prompt callback/>
	TMC_UICallbackType = integer;
	/// <summary>
	/// Callback result types
	/// </summary>
	/// <remarks>
	/// For compatibility reasons, the enumerated types had to be replaced by numeric values.<p>
	/// Constants were introduced for better code readability.
	/// </remarks>
	/// <seealso cref="cbrUnknown" Unknown callback result/>
	/// <seealso cref="cbrNoAnswer" No answer callback result/>
	/// <seealso cref="cbrOk" Callback processed ok/>
	/// <seealso cref="cbrNo" Callback refused/>
	/// <seealso cref="cbrCancel" Callback canceled/>
	/// <seealso cref="cbrCorrection" Callback retry request/>
	/// <seealso cref="cbrRetry" Callback retry request/>
	/// <seealso cref="cbrError" Callback error/>
	TMC_CallbackResult = integer;
	/// <summary>
	/// Security verification types
	/// </summary>
	/// <remarks>
	/// For compatibility reasons, the enumerated types had to be replaced by numeric values.<p>
	/// Constants were introduced for better code readability.
	/// </remarks>
	/// <see cref="TMC_UICallbackType"/>
	/// <seealso cref="secUnknown" Unknown type of security validation/>
	TMC_UICBPISecurity = integer;
	/// <summary>
	/// Visual control property change types
	/// </summary>
	/// <remarks>
	/// For compatibility reasons, the enumerated types had to be replaced by numeric values.<p>
	/// Constants were introduced for better code readability.
	/// </remarks>
	/// <seealso cref="bvpcVisible" A control's visibility has changed/>
	/// <seealso cref="bvpcEnabled" A control's accessibility has changed/>
	TMC_BindingVisualPropertyChanged = integer;
	/// <summary>
	/// Input formats applied to <see cref="MC_PluginInterface.IMC_BindingEditControl"/>
	/// </summary>
	/// <remarks>
	/// For compatibility reasons, the enumerated types had to be replaced by numeric values.<p>
	/// Constants were introduced for better code readability.
	/// </remarks>
	/// <seealso cref="betDate" Date input format/>
	/// <seealso cref="betHeure" Time input format/>
	/// <seealso cref="betString" Character string input/>
	/// <seealso cref="betReel" Floating numbers and integers input format/>
	/// <seealso cref="betCurrency" Monetary numbers input format/>
	TMC_BindingEditType = integer;
	/// <summary>
	/// <see cref="MC_PluginInterface.IMC_BindingTrackBarControl"/> tick styles
	/// </summary>
	/// <remarks>
	/// For compatibility reasons, the enumerated types had to be replaced by numeric values.<p>
	/// Constants were introduced for better code readability.
	/// </remarks>
	/// <seealso cref="btsAuto" Automatic trackbar ticks/>
	/// <seealso cref="btsManual" In manual mode, the ticks are positioned using the interval (MaxValue div MinValue)-1/>
	/// <seealso cref="btsNone" No trackbar ticks/>
	TMC_BindingTickStyle = integer;
	/// <summary>
	/// Control alignment with respect to its parent <see cref="MC_PluginInterface.IMC_BindingControl/>
	/// </summary>
	/// <remarks>
	/// For compatibility reasons, the enumerated types had to be replaced by numeric values.<p>
	/// Constants were introduced for better code readability.
	/// </remarks>
	/// <seealso cref="balNone" No alignment/>
	/// <seealso cref="balTop" Top alignment/>
	/// <seealso cref="balBottom" Bottom alignment/>
	/// <seealso cref="balLeft" Left alignment/>
	/// <seealso cref="balRight" Right alignment/>
	/// <seealso cref="balClient" Client alignment/>
	TMC_BindingAlignControl = integer;
	/// <summary>
	/// User Interface security level
	/// </summary>
	/// <remarks>
	/// For compatibility reasons, the enumerated types had to be replaced by numeric values.<p>
	/// Constants were introduced for better code readability.
	/// </remarks>
	/// <seealso cref="srlUnknown" Unknown security level/>
	/// <seealso cref="srlUser" User level security/>
	/// <seealso cref="srlSupervisor" Supervisor level security/>
	/// <seealso cref="srlAdministrator" Administrator level security/>
	TMC_UICBSecurityRequestLevel = integer;
	/// <summary>
	/// Accepted types of characters which can be entered by the user within a <see cref="MC_PluginInterface.ctGetKey"/> type of call to <see cref="MC_PluginInterface.IMC_PluginCallback.onMC_UICallback"/>
	/// </summary>
	/// <remarks>
	/// For compatibility reasons, the enumerated types had to be replaced by numeric values.<p>
	/// Constants were introduced for better code readability.
	/// </remarks>
	/// <seealso cref="casUnknown" No restriction on the type of accepted characters/>
	/// <seealso cref="casAlphaUpper" Only upper case alphabetic characters are accepted/>
	/// <seealso cref="casAlphaLower" Only lower case alphabetic characters are accepted/>
	/// <seealso cref="casAlpha" Only alphabetic characters are accepted/>
	/// <seealso cref="casNumeric" Only numeric characters are accepted/>
	/// <seealso cref="casAlphaUpNum" Only upper case alphanumeric characters are accepted/>
	/// <seealso cref="casAlphaLoNum" Only lower case alphanumeric characters are accepted/>
	/// <seealso cref="casAlphaNum" Only alphanumeric characters are accepted/>
	/// <seealso cref="casNumVCA" Only numercic characters and letters "V", "C", "A" are accepted/>
	TMC_UICallbackCarAllowedSet = integer;

	/// <summary>
	/// CPOS Report Type.<p>
	/// This is a generic type that could be "adapted" ny every device type needing to use printing co-operation CPOS commands.
	/// </summary>
	/// <remarks>
	/// For compatibility reasons, the enumerated types had to be replaced by numeric values.<p>
	/// Constants were introduced for better code readability.
	/// </remarks>
	/// <seealso cref="pptUnknown" Unknown receipt type/>
	/// <seealso cref="pptReportType1" Generic retport type 1/>
	/// <seealso cref="pptReportType2" Generic retport type 2/>
	/// <seealso cref="pptReportType3" Generic retport type 3/>
	/// <seealso cref="pptReportType4" Generic retport type 4/>
	/// <seealso cref="pptReportType5" Generic retport type 5/>
	/// <seealso cref="pptReportType6" Generic retport type 6/>
	/// <seealso cref="pptReportType7" Generic retport type 7/>
	/// <seealso cref="pptReportType8" Generic retport type 8/>
	/// <seealso cref="pptReportType9" Generic retport type 9/>
	TMC_ReportType = integer;

	/// <summary>
	/// CPOS co-operation commands identifier
	/// </summary>
	/// <remarks>
	/// For compatibility reasons, the enumerated types had to be replaced by numeric values.<p>
	/// Constants were introduced for better code readability.
	/// </remarks>
	/// <seealso cref="ccUnknown" Undefined value form CPOS command enumeration/>
	/// <seealso cref="ccPrintCheque" Print cheque CPOS co-operation command/>
	/// <seealso cref="ccEjectMICRCheque" Eject cheque from MICR reader device CPOS co-operation command/>
	/// <seealso cref="ccReadMICRCheque" Read MICR track CPOS co-operation command/>
	/// <seealso cref="ccCanLockDevices" Determine whether defective devices can be locked/>
	/// <seealso cref="ccLockDevices" Lock defective devices/>
	/// <seealso cref="ccPrintFile" Print a text file/>
	/// <seealso cref="ccPrintXmlStream" Print from a XML stream/>
	/// <seealso cref="ccGetDeviceNumber" Get the sequence register number of the device/>
	TMC_CPOSCommandId = integer;

	/// <summary>
	/// Accepted types of characters which can be entered by the user within a <see cref="MC_PluginInterface.ctGetString"/> type of call to <see cref="MC_PluginInterface.IMC_PluginCallback.onMC_UICallback"/>
	/// </summary>
	/// <remarks>
	/// For compatibility reasons, the enumerated types had to be replaced by numeric values.<p>
	/// Constants were introduced for better code readability.
	/// </remarks>
	/// <seealso cref="gacsUnknown" Unknown restriction on the type of accepted characters/>
	/// <seealso cref="gacsAlphaUpper" Only upper case alphabetic characters are accepted/>
	/// <seealso cref="gacsAlphaLower" Only lower case alphabetic characters are accepted/>
	/// <seealso cref="gacsAlpha" Only alphabetic characters are accepted/>
	/// <seealso cref="gacsNumeric" Only numeric characters are accepted/>
	/// <seealso cref="gacsAlphaUpNum" Only upper case alphanumeric characters are accepted/>
	/// <seealso cref="gacsAlphaLoNum" Only lower case alphanumeric characters are accepted/>
	/// <seealso cref="gacsAlphaNum" Only alphanumeric characters are accepted/>
	/// <seealso cref="gacsNoControl" No restriction must be applied, user can enter any character./>
	TMC_UICallbackGetStringAllowedCarSet = integer;

	/// <summary>
	/// IMC_Stream is the interface used to exchange binary (or big blocks of) data between CPOS and CPOS drivers
	/// </summary>
	IMC_Stream = interface(ISequentialStream)
		['{EFADBE1E-7672-4DFE-A79F-CED445179C03}']
		/// <summary>
		/// Move internal pointer to new position
		/// </summary>
		/// Seek command implementation moves internal pointer to new position.
		/// <param name="dlibMove"> How many bytes to move internal pointer for </param>
		/// <param name="dwOrigin"> From where pointer should be deplace. Values : "0".- from begin of stream, "1".- from current position, positifs values runs to the end, negatifs values runs to begin. "2".- from end of stream) </param>
		/// <param name="libNewPosition"> return new position of internal pointer <param>
		/// <returns> S_OK if successful</returns>
		function Seek(dlibMove: Largeint; dwOrigin: Longint; out libNewPosition: Largeint): HResult; stdcall;
		/// <summary>
		/// Changes the size of the underlined stream
		/// </summary>
		/// SetSize command implementation try to change the size of underlined stream.
		/// <param name="libNewSize"> New size of stream</param>
		/// <returns> S_OK if successful</returns>
		function SetSize(libNewSize: Largeint): HResult; stdcall;
		/// <summary>
		/// Copies current contents of the stream to another IMC_Stream
		/// </summary>
		/// CopyTo command implementation copies current contents of stream to another IMC_Stream Object.
		/// <param name="stm"> IMC_Stream which will recevice the current contents</param>
		/// <param name="cb"> How many bytes to copy, from current position</param>
		/// <param name="cbRead"> How many bytes has been read <param>
		/// <param name="libNewPosition"> How many bytes has been written<param>
		/// <returns> S_OK if successful</returns>
		function CopyTo(stm: IMC_Stream; cb: Largeint; out cbRead: Largeint; out cbWritten: Largeint): HResult; stdcall;
		/// <summary>
		/// Gets statical information about unbderlined stream.
		/// </summary>
		/// Stat command implementation retrieves information from underlined stram.
		/// <param name="statstg"> struct providing requested information about stream, see tagStatStg struct on Windows help. </param>
		/// <param name="grfStatFlag"> "0" if Stat has to give pwcsName of statStg struct, 0 otherwise.</param>
		/// <param name="libNewPosition"> return new position of internal pointer <param>
		/// <returns> S_OK if successful</returns>
		function Stat(out statstg: TStatStg; grfStatFlag: Longint): HResult; stdcall;
	end;

	/// <summary>
	/// IMC_Interface is the base of interface, from which all the other interfaces must derive
	/// </summary>
	/// IMC_Interface is the ancestor of all CPOS interfaces
	IMC_Interface = interface
		['{A157622B-B0B9-46BE-9E57-67A511AA2620}']
		/// <summary>
		/// Allows cross-referenced interfaces to be released
		/// </summary>
		/// Provides a way to release cross-referenced interfaces deriving from this ancestor.<p>
		/// Since Delphi interfaces are released when their reference count drops to zero, the
		/// only way cross-referenced interfaced can be released is through an explicit method call
		procedure dispose; stdcall;
	end;

	/// <summary>
	/// This is the interface to derive when implementing assignable interfaces
	/// </summary>
	/// Provides a way to assign (copy) the content of an interface to another.
	IMC_Assignable = interface(IMC_Interface)
		['{9181DE8A-1D7F-4619-83B3-09D3BE35EAB6}']
		/// <summary>
		/// Copies the data from the interface given as a parameter
		/// </summary>
		/// <param name="acSource"> reference to the interface from which the data will be copied</param>
		procedure Assign(acSource: IMC_Assignable); stdcall;
	end;

	/// <summary>
	/// Assignable interface providing a version property and another general purpose property
	/// </summary>
	/// The "recordVersion" property allows the implementation of interface versioning.<p>
	/// La "extra" property can be used to store any kind of text data (similar to the Delphi TComponent "Tag" property)
	/// <remarks>
	/// New versions of an interface must never drop existing methods or properties for obvious compatibility reasons
	/// </remarks>
	IMC_VersionedInterface = interface(IMC_Assignable)
		['{1934466F-EFB4-41DC-B325-C73E8086A351}']
		function get_RecordVersion: integer; stdcall;
		procedure setExtra(const asExtra: wideString); stdcall;
		function getExtra: wideString; stdcall;
		/// <summary>
		/// Returns the interface version.
		/// <value>A numeric value which indicates the interface version number</value>
		/// </summary>
		property recordVersion: integer read get_RecordVersion;
		/// <summary>
		/// A general purpose property
		/// </summary>
		property extra: wideString read getExtra write setExtra;
	end;

	/// <summary>
	/// Versioned interface providing methods to manage batch list updates
	/// </summary>
	/// <remarks>
	/// </remarks>
	IMC_ListVersionedInterface = interface(IMC_VersionedInterface)
		['{D9EFDEAB-2BAC-455A-952F-70EDF44CA83E}']
		/// <summary>
		/// Indicates that a batch list update is about to begin
		/// </summary>
		/// After this method is called, all the event handlers triggered by the list updates (elements added, moved, deleted)
		/// should be postponed until the update has completed so as not to slow it down
		procedure beginUpdate; stdcall;
		/// <summary>
		/// Indicates that a batch list update has completed
		/// </summary>
		/// After this method is called, the event handlers associated with the list updates can now be executed
		procedure endUpdate; stdcall;
	end;

	/// <summary>
	/// Standardised error management interface
	/// </summary>
	/// IMC_Error allows error messages to be exchanged and stored.
	/// <example>
	/// <code>
	/// zcErr:=MC_ErrorMessage(1,'the requested devie does not exist.',0) ;
	/// </code>
	/// </example>
	IMC_Error = interface(IMC_Assignable)
		['{FF07AEE3-91E7-4669-AEC4-0D0ADC07B5C6}']
		function getCode: integer; stdcall;
		function getMessage: wideString; stdcall;
		function getExtraInfo: integer; stdcall;

		/// <summary>
		/// Error code.
		/// </summary>
		property code: integer read getCode;
		/// <summary>
		/// User message.
		/// </summary>
		property message: wideString read getMessage;
		/// <summary>
		/// Additional information.
		/// </summary>
		property extraInfo: integer read getExtraInfo;
	end;

	IMC_DetailedError = interface(IMC_Error)
		['{19E423A4-2CAA-4A58-81EE-D06E9411B037}']
		function getTechnicalMessage: wideString; stdcall;
		function getAdviceMessage: wideString; stdcall;
		function getCritical: Boolean; stdcall;

		/// <summary>
		/// Technical message.
		/// </summary>
		property technicalMessage: wideString read getTechnicalMessage;
		/// <summary>
		/// Advice message.
		/// </summary>
		property adviceMessage: wideString read getAdviceMessage;
		/// <summary>
		/// The error is a critical one. No need to retry.
		/// </summary>
		property critical: Boolean read getCritical;
	end;

	IMC_PluginBase = interface;

	/// <summary>
	/// Provides CPOS drivers detailed version information
	/// </summary>
	/// Implements all the properties of a CPOS driver's version information
	/// <seealso cref="MC_PluginInterface.IMC_PluginInformations" Device information/>
	IMC_PluginVersion = interface(IMC_VersionedInterface)
		['{7AF5E1DC-D98B-4EB1-AD28-C464DE33405A}']
		function get_MajorVersion: integer; stdcall;
		function get_MinorVersion: integer; stdcall;
		function get_ReleaseVersion: integer; stdcall;
		function get_BuildVersion: integer; stdcall;

		/// <summary>
		/// Returns version information as a text
		/// </summary>
		/// Returns version information as a text using the following format: Major.minor.Release.Build
		/// <returns> The character string giving all version numbers</returns>
		function wholeVersionString: wideString; stdcall;

		/// <summary>
		/// Major version number
		/// </summary>
		property majorVersion: integer read get_MajorVersion;
		/// <summary>
		/// Minor version number
		/// </summary>
		property minorVersion: integer read get_MinorVersion;
		/// <summary>
		/// Release version number
		/// </summary>
		property releaseVersion: integer read get_ReleaseVersion;
		/// <summary>
		/// Build version number
		/// </summary>
		property buildVersion: integer read get_BuildVersion;
	end;

	/// <summary>
	/// This interface retuns all the information necessary to identify a given driver
	/// </summary>
	/// This interface is used by CPOS and the client application to manage the drivers main information.
	/// <seealso cref="MC_PluginInterface.IMC_PluginBase"/>
	IMC_PluginInformations = interface(IMC_VersionedInterface)
		['{9DFC4FCB-0A67-4973-BC22-0ABC6041F44B}']
		function get_DeviceType: TMC_DeviceType; stdcall;
		function get_InternalName: wideString; stdcall;
		function get_Creator: wideString; stdcall;
		function get_version: IMC_PluginVersion; stdcall;
		function get_Description: wideString; stdcall;

		/// <summary>
		/// Device type
		/// </summary>
		/// This property returns the device type
		/// <seealso cref="TMC_DeviceType" Type de périphérique/>
		property deviceType: TMC_DeviceType read get_DeviceType;
		/// <summary>
		/// Driver name
		/// </summary>
		/// This property returns the driver name
		property internalName: wideString read get_InternalName;
		/// <summary>
		/// Driver creator
		/// </summary>
		/// This property can be used to identify the creator of the driver
		property creator: wideString read get_Creator;
		/// <summary>
		/// Driver version
		/// </summary>
		/// This property returns the driver version
		/// <seealso cref="IMC_PluginVersion"/>
		property version: IMC_PluginVersion read get_version;
		/// <summary>
		/// Returns the driver description, for instance: which device it manages
		/// </summary>
		property description: wideString read get_Description;
	end;

	/// <summary>
	/// Base interface for input parameters within calls to onMC_UICallback.
	/// </summary>
	/// This is the interface to use for input parameters when calling <see cref="MC_PluginInterface.IMC_PluginCallback.onMC_UICallback"/>
	/// <seealso cref="MC_PluginInterface.IMC_PluginCallback" Callback management interface/>
	/// <seealso cref="TMC_UICallbackType" User interface callback types/>
	IMC_UICallbackParamsIn = interface(IMC_VersionedInterface)
		['{66FA73BC-C7C6-476D-8545-2F1F99091D5F}']
	end;

	/// <summary>
	/// This interface is used to pass parameters when calling <see cref="MC_PluginInterface.IMC_PluginCallback.onMC_UICallback"/>
	/// </summary>
	/// This interface provides the information required by the driver when calling <see cref="MC_PluginInterface.IMC_PluginCallback.onMC_UICallback"/>
	/// of the following type:
	/// * ctMessage
	/// * ctAsk
	/// * ctAskCancel
	/// * ctWarning
	/// * ctError
	/// * ctContinueProc
	/// <seealso cref="MC_PluginInterface.IMC_PluginCallback" Callback management interface/>
	/// <seealso cref="TMC_UICallbackType" User interface callback types/>
	IMC_UICallbackPIMessage = interface(IMC_UICallbackParamsIn)
		['{E710D23D-71B0-4817-B516-B24894FE9AB6}']
		function get_Mess: wideString; stdcall;
		function get_TimeOut: integer; stdcall;

		/// <summary>
		/// Message to process when calling the callback
		/// </summary>
		property mess: wideString read get_Mess;
		/// <summary>
		/// Maximum timeout in the client application before proceeding
		/// valeurs : -1 = no timeout (infinite waiting time), 0 = Immediate result (no waiting time) , >0 number of seconds to wait
		/// </summary>
		property timeout: integer read get_TimeOut;
	end;

	/// <summary>
	/// Interface holding the parameters required to manage progress bars
	/// </summary>
	/// This interface manages all the information required to manage a progress bar.<P>
	/// It is used when calling <see cref="MC_PluginInterface.IMC_PluginCallback.onMC_UICallback"/>
	/// of the following type:
	/// * ctMoveInit
	/// * ctMove
	/// * ctMoveEnd
	/// <seealso cref="MC_PluginInterface.IMC_PluginCallback" Callback management interface/>
	/// <seealso cref="TMC_UICallbackType" User interface callback types/>
	IMC_UICallbackPIMove = interface(IMC_UICallbackParamsIn)
		['{B9532F35-359F-450E-9C6A-CDECBB1E59AB}']
		function get_Mess: wideString; stdcall;
		function get_AllowCancel: Boolean; stdcall;
		function get_MaxValue: integer; stdcall;
		function get_CurrentValue: integer; stdcall;

		/// <summary>
		/// Message to process when calling the callback
		/// </summary>
		property mess: wideString read get_Mess;
		/// <summary>
		/// Allows the user to cancel the process
		/// </summary>
		/// The driver indicates whether the user should be allowed to cancel the process
		/// <value>True allows the user to cancel the process, False forbids it</value>
		property allowCancel: Boolean read get_AllowCancel;
		/// <summary>
		/// Maximum progress value
		/// </summary>
		/// This value is reached when the process reaches its completion
		property maxValue: integer read get_MaxValue;
		/// <summary>
		/// Current progress value
		/// </summary>
		/// The driver should update this value for the application to indicate the current progress
		property currentValue: integer read get_CurrentValue;
	end;

	/// <summary>
	/// Interface used to obtain a security verification.
	/// </summary>
	/// Some devices require that the client application verify the user's right to run the current command.<p>
	/// For instance: <p>
	/// Some Cardholder Activated Terminals (CATs) may require that the user be entitled to validate a refund.
	/// <remarks>
	/// This is implemented as a user interface callback since the client application may need that a user with higher privileges authenticate
	/// in order to validate the current operation
	/// </remarks>
	/// <seealso cref="MC_PluginInterface.IMC_PluginCallback" Callback management interface/>
	/// <seealso cref="TMC_UICallbackType" User interface callback types/>
	IMC_UICallbackPISecurity = interface(IMC_UICallbackParamsIn)
		['{C196ECFA-42BE-4030-897B-9164BD2B5E74}']
		function get_SecurityID: TMC_UICBPISecurity; stdcall;
		function get_TimeOut: integer; stdcall;
		function get_SecurityRequestLevel: TMC_UICBSecurityRequestLevel; stdcall;

		/// <summary>
		/// Type of security verification to perform
		/// </summary>
		/// <seealso cref="TMC_UICBPISecurity" Enuméré des valeurs possibles/>
		property securitID: TMC_UICBPISecurity read get_SecurityID;
		/// <summary>
		/// Maximum timeout in the client application before proceeding
		/// valeurs : -1 = no timeout (infinite waiting time), 0 = Immediate result (no waiting time) , >0 number of seconds to wait
		/// </summary>
		property timeout: integer read get_TimeOut;
		/// <summary>
		/// User rights security level required to manage the callback
		/// </summary>
		/// <seealso cref="TMC_UICBSecurityRequestLevel" User rights security level/>
		property SecurityRequestLevel: TMC_UICBSecurityRequestLevel read get_SecurityRequestLevel;
	end;

	/// <summary>
	/// Interface holding the parameters required to manage user keystrokes
	/// </summary>
	/// This interface provides the information required by the driver to manage user keystrokes.<P>
	/// This type of parameter is used when calling <see cref="MC_PluginInterface.IMC_PluginCallback.onMC_UICallback"/> of the following type:
	/// * ctGetKey
	/// <seealso cref="MC_PluginInterface.IMC_PluginCallback" Callback management interface/>
	/// <seealso cref="TMC_UICallbackType" User interface callback types/>
	IMC_UICallbackPIGetKey = interface(IMC_UICallbackParamsIn)
		['{3CDD35A3-56AB-4448-ACAD-615508CB4FC0}']
		function get_TimeOut: integer; stdcall;
		function get_SecurityRequestLevel: TMC_UICBSecurityRequestLevel; stdcall;
		function get_CarAllowedSet: TMC_UICallbackCarAllowedSet; stdcall;

		/// <summary>
		/// Maximum timeout in the client application before proceeding
		/// valeurs : -1 = no timeout (infinite waiting time), 0 = Immediate result (no waiting time) , >0 number of seconds to wait
		/// </summary>
		property timeout: integer read get_TimeOut;
		/// <summary>
		/// User rights security level required to manage the callback
		/// </summary>
		/// <seealso cref="TMC_UICBSecurityRequestLevel" User rights security level/>
		property SecurityRequestLevel: TMC_UICBSecurityRequestLevel read get_SecurityRequestLevel;
		/// <summary>
		/// Set of characters allowed for user input
		/// </summary>
		/// <seealso cref="TMC_UICallbackCarAllowedSet" Allowed character set/>
		property carAllowedSet: TMC_UICallbackCarAllowedSet read get_CarAllowedSet;
	end;

	/// <summary>
	/// Interface holding the parameters required to manage user text entry
	/// </summary>
	/// This interface is implemented as an input parameter when calling <see cref="MC_PluginInterface.IMC_PluginCallback.onMC_UICallback"/>
	/// in order to retrieve a text entered by the user.
	/// <seealso cref="MC_PluginInterface.IMC_PluginCallback" Callback management interface/>
	/// <seealso cref="TMC_UICallbackType" User interface callback types/>
	IMC_UICallbackPIGetString = interface(IMC_UICallbackParamsIn)
		['{61431974-555E-4AC8-BB6C-55F2001E2030}']
		function get_AnswerMinLength: integer; stdcall;
		function get_AnswerMaxLength: integer; stdcall;
		function get_Mess: wideString; stdcall;
		function get_PasswordChar: wideChar; stdcall;
		function get_Default: wideString; stdcall;
		function get_TimeOut: integer; stdcall;
		function get_SecurityRequestLevel: TMC_UICBSecurityRequestLevel; stdcall;

		/// <summary>
		/// Minimum answer length
		/// </summary>
		/// Minimum length of the character string expected from the user
		/// <seealso cref="MC_PluginInterface.IMC_PluginCallback" Callback management interface/>
		property AnswerMinLength: integer read get_AnswerMinLength;
		/// <summary>
		/// Maximum answer length
		/// </summary>
		/// Maximum length of the character string expected from the user
		/// <seealso cref="MC_PluginInterface.IMC_PluginCallback" Callback management interface/>
		property AnswerMaxLength: integer read get_AnswerMaxLength;
		/// <summary>
		/// Message displayed for the user
		/// </summary>
		/// Message prompting the user to enter some text
		/// <seealso cref="MC_PluginInterface.IMC_PluginCallback" Callback management interface/>
		property mess: wideString read get_Mess;
		/// <summary>
		/// Character to use in order to hide a password
		/// </summary>
		property passwordChar: wideChar read get_PasswordChar;
		/// <summary>
		/// Default value
		/// </summary>
		/// Default value provided by the driver
		/// <seealso cref="MC_PluginInterface.IMC_PluginCallback" Callback management interface/>
		property default: wideString read get_Default;
		/// <summary>
		/// Maximum timeout in the client application before proceeding
		/// valeurs : -1 = no timeout (infinite waiting time), 0 = Immediate result (no waiting time) , >0 number of seconds to wait
		/// </summary>
		property timeout: integer read get_TimeOut;
		/// <summary>
		/// User rights security level required to manage the callback
		/// </summary>
		/// <seealso cref="TMC_UICBSecurityRequestLevel" User rights security level/>
		property SecurityRequestLevel: TMC_UICBSecurityRequestLevel read get_SecurityRequestLevel;
	end;

	/// <summary>
	/// Interface holding the parameters required to manage user text entry (V2)
	/// </summary>
	/// This interface supports V2 of interface used for input parameter when calling <see cref="MC_PluginInterface.IMC_PluginCallback.onMC_UICallback"/>
	/// in order to retrieve a text entered by the user.
	/// <seealso cref="MC_PluginInterface.IMC_UICallbackPIGetString" V1 of parameters to used to get a text entered by the user./>
	/// <seealso cref="MC_PluginInterface.IMC_PluginCallback" Callback management interface/>
	/// <seealso cref="TMC_UICallbackType" User interface callback types/>
	IMC_UICallbackPIGetStringV2 = interface(IMC_UICallbackPIGetString)
		['{BE3597F3-0F31-4A91-AF46-468F93F67BD7}']
		function get_AllowedCarSet: TMC_UICallbackGetStringAllowedCarSet; stdcall;

		/// <summary>
		/// Set of characters allowed for user input
		/// </summary>
		/// <seealso cref="TMC_UICallbackGetStringAllowedCarSet" Getstring allowed character set/>
		property allowedCarSet: TMC_UICallbackGetStringAllowedCarSet read get_AllowedCarSet;
	end;

	/// <summary>
	/// Interface used by the driver to allow the user to choose an an option among a list
	/// </summary>
	/// This interface is implemented as an input parameter when calling <see cref="MC_PluginInterface.IMC_PluginCallback.onMC_UICallback"/>
	/// in order to present the user with a list of options and get the result
	/// <seealso cref="MC_PluginInterface.IMC_PluginCallback" Callback management interface/>
	/// <seealso cref="TMC_UICallbackType" User interface callback types/>
	IMC_UICallbackPIChoose = interface(IMC_UICallbackParamsIn)
		['{2D00B651-B5AA-4542-B171-A95E45673244}']
		function get_Mess: wideString; stdcall;
		function get_OptionsCount: integer; stdcall;
		function get_OptionsSep: wideString; stdcall;
		function get_Options: wideString; stdcall;
		function get_Default: wideString; stdcall;
		function get_TimeOut: integer; stdcall;
		function get_SecurityRequestLevel: TMC_UICBSecurityRequestLevel; stdcall;

		/// <summary>
		/// Selection message
		/// </summary>
		/// Message precising the type of selection from which the user must choose
		/// <seealso cref="MC_PluginInterface.IMC_PluginCallback" Callback management interface/>
		property mess: wideString read get_Mess;
		/// <summary>
		/// Number of options provided to the client application
		/// </summary>
		property OptionsCount: integer read get_OptionsCount;
		/// <summary>
		/// Character(s) used to separate the options
		/// </summary>
		property OptionsSep: wideString read get_OptionsSep;
		/// <summary>
		/// The actual list of options among which the user must choose
		/// </summary>
		/// Les options must be formatted as follows:<p>
		/// "option 1 ID=option 1 description;option 2 ID=option 2 description;option 3 ID=option 3 description;..." <p>
		/// Remark: in this example, the semicolon ";" was used as an option separator
		property Options: wideString read get_Options;
		/// <summary>
		/// Default value
		/// </summary>
		/// Default value provided by the driver
		/// <seealso cref="MC_PluginInterface.IMC_PluginCallback" Callback management interface/>
		property default: wideString read get_Default;
		/// <summary>
		/// Maximum timeout in the client application before proceeding
		/// valeurs : -1 = no timeout (infinite waiting time), 0 = Immediate result (no waiting time) , >0 number of seconds to wait
		/// </summary>
		property timeout: integer read get_TimeOut;
		/// <summary>
		/// User rights security level required to manage the callback
		/// </summary>
		/// <seealso cref="TMC_UICBSecurityRequestLevel" User rights security level/>
		property SecurityRequestLevel: TMC_UICBSecurityRequestLevel read get_SecurityRequestLevel;
	end;

	/// <summary>
	/// Interface used by driver to indicate that the cash drawer state has changed
	/// </summary>
	/// The client application will use this interface to determine whether the cash drawer is still open or if it has just been closed
	/// <seealso cref="MC_PluginInterface.IMC_PluginCallback" Callback management interface/>
	/// <seealso cref="TMC_UICallbackType" User interface callback types/>
	IMC_UICallbackPICashDrawerStateChanged = interface(IMC_UICallbackParamsIn)
		['{0E807882-6F0F-40BF-80DC-7F93EFE05FE6}']
		function get_CashDrawerID: wideString; stdcall;

		/// <summary>
		/// Cash drawer identifier
		/// </summary>
		property CashDrawerID: wideString read get_CashDrawerID;
	end;

	/// <summary>
	/// Base interface to retrieve a reply from the user through a callback function call
	/// </summary>
	/// Some calls made by the driver to <see cref="MC_PluginInterface.IMC_PluginCallback.onMC_UICallback"/> may expect a reply from the user<p>
	/// Such calls must provide the callback with an implementation of this interface, which allows the user reply to be return to the driver.
	/// <seealso cref="MC_PluginInterface.IMC_PluginCallback.onMC_UICallback" User interface callback/>
	IMC_UICallbackResult = interface(IMC_VersionedInterface)
		['{2C33ADA1-58C3-4787-B2F5-731FEFC8BCDF}']
		function get_Result: TMC_CallbackResult; stdcall;

		/// <summary>
		/// Callback result type
		/// </summary>
		/// The result can be the user reply or a value returned by the client application to the driver
		/// <value>The possible values are among the following: <see cref="MC_PluginInterface.IMC_PluginCallback.onMC_UICallback"/></value>
		/// <seealso cref="TMC_CallbackResult" holds the result value when calling <see cref="MC_PluginInterface.IMC_PluginCallback.onMC_UICallback"/>/>
		property result: TMC_CallbackResult read get_Result;
	end;

	/// <summary>
	/// User keystrokes result
	/// </summary>
	/// This interface is used specifically to handle results when calling <see cref="MC_PluginInterface.IMC_PluginCallback.onMC_UICallback"/> of type <see cref="ctGetKey"/>
	/// <seealso cref="IMC_UICallbackResult"/>
	/// <seealso cref="MC_PluginInterface.IMC_PluginCallback"/>
	IMC_UICallbackRKey = interface(IMC_UICallbackResult)
		['{840E6AB5-806C-4B2F-BD12-7A2784EC1446}']
		function get_Key: wideChar; stdcall;
		/// <summary>
		/// Holds the character typed by the user
		/// </summary>
		property key: wideChar read get_Key;
	end;

	/// <summary>
	/// User text entry result
	/// </summary>
	/// This interface is used specifically to handle results when calling <see cref="MC_PluginInterface.IMC_PluginCallback.onMC_UICallback"/> of type <see cref="ctGetString/>
	/// <seealso cref="IMC_UICallbackResult" UICallback result base interface/>
	/// <seealso cref="MC_PluginInterface.IMC_PluginCallback" Callback interface/>
	/// <seealso cref="TMC_CallbackResult" Callback result types/>
	IMC_UICallbackRGetString = interface(IMC_UICallbackResult)
		['{0E861781-C452-40DC-A5A8-DD7112570779}']
		function get_Answer: wideString; stdcall;
		/// <summary>
		/// Text entered by the user
		/// </summary>
		property Answer: wideString read get_Answer;
	end;

	/// <summary>
	/// Multiple option selection result
	/// </summary>
	/// This interface is used specifically to handle results when calling <see cref="MC_PluginInterface.IMC_PluginCallback.onMC_UICallback"/> of type <see cref="ctChoose/>
	/// <seealso cref="IMC_UICallbackResult" UICallback result base interface/>
	/// <seealso cref="MC_PluginInterface.IMC_PluginCallback" Callback interface/>
	/// <seealso cref="TMC_CallbackResult" Callback result types/>
	IMC_UICallbackRChoose = interface(IMC_UICallbackResult)
		['{0E861781-C452-40DC-A5A8-DD7112570779}']
		function get_IDChose: wideString; stdcall;
		/// <summary>
		/// Identifier of the option selected by the user
		/// </summary>
		property IDChose: wideString read get_IDChose;
	end;

	/// <summary>
	/// Interface which must be implemented by the classes managing driver callbacks.
	/// </summary>
	/// Drivers can implement the methods of IMC_PluginCallback to make calls within CPOS packages or the client application
	/// in order to achieve various goals:
	///
	/// * Exchange information with the user through the client application UI (<see cref="onMC_UICallback"/>)
	/// * Request the "cooperation" of another device or even CPOS (<see cref="onMC_Callback"/>)
	/// * Add customised log traces (<see cref="MC_PluginInterface.IMC_PluginCallback.onAddLog"/> and <see cref="MC_PluginInterface.IMC_PluginCallback.manageLog"/>)
	IMC_PluginCallback = interface
		['{BF4E2DC3-0FD6-478D-A2E9-4F280A63A736}']
		/// <summary>
		/// This methods is used by the driver to exchange with the user
		/// </summary>
		/// The driver may call this method in order to:
		/// * notify the user of a task's progress
		/// * display error messages, warnings, information, ...
		/// * prompt the user and collect his/her reply (validation, cancelation, ...).
		/// * verify the user access rights
		/// * retrieve text entered by the user.
		/// * ...
		/// <param name="sender"> Reference to the driver which made the call</param>
		/// <param name="aeType"> Type of call<see cref="TMC_UICallbackType"/></param>
		/// <param name="acParamsIn"> Input parameter interface <c>IMC_UICallbackParamsIn</c>, which holds the required parameters. <see cref="IMC_UICallbackParamsIn"/></param>
		/// <param name="zcParamsOut"> Optional output parameter interface which contains the reply made by the CPOS packages, the client application or the users themselves. <see cref="IMC_UICallbackResult"/> </param>
		/// <returns> A value among <see cref="TMC_CallbackResult"/> which indicates how the callback call was handled.</returns>
		/// <seealso cref="MC_PluginInterface.IMC_PluginBase" Driver base interface/>
		/// <seealso cref="TMC_UICallbackType" User interface callback types/>
		/// <seealso cref="IMC_UICallbackParamsIn" Input parameters within calls to UICallback/>
		/// <seealso cref="IMC_UICallbackResult" User interface callback result/>
		function onMC_UICallback(sender: IMC_PluginBase; aeType: TMC_UICallbackType; acParamsIn: IMC_UICallbackParamsIn; out zcParamOut: IMC_UICallbackResult)
			: TMC_CallbackResult; stdcall;
		/// <summary>
		/// This method enables cooperation between the drivers of two separate devices
		/// </summary>
		/// This method is used to make the drivers of two separate devices communicate.<p>
		/// For instance:<p>
		/// A CPOS drivers need to use a specific functionality on a second CPOS driver that is not available on its interface.
		/// <remarks>
		/// The data format in <paramref name="acInput"/> and <paramref name="zcAnswer"/> are NOT defined by CEGID and it is responsability of developers, who have written the relevfant CPOS drivers,<p>
		/// to agree on the command that will be provided and on the contents (and format) of their input and output parameters.
		/// To call to co-operation command provided by CPOS it will be better to call to <see cref="IMC_PluginCallbackV2.onMC_CPOSCommand"/>
		/// </remarks>
		/// <param name="sender"> Reference to the driver which made the call</param>
		/// <param name="aeDeviceType"> Target device type</param>
		/// <param name="aiDeviceNum"> Target device number</param>
		/// <param name="acInput"> Data stream pushed to the target device, which enables it to complete the operation</param>
		/// <param name="zcAnswer"> Optional data stream returned to the caller with information regarding the completed operation</param>
		/// <param name="zcError"> Interface <see cref="IMC_Error"/> which holds potential errors</param>
		/// <returns> Returns a value among <see cref="TMC_CallbackResult"/> to indicate the result of the cooperation</returns>
		/// <seealso cref="MC_PluginInterface.IMC_PluginBase" Driver base interface/>
		/// <seealso cref="TMC_DeviceType" Device types/>
		/// <seealso cref="IMC_Error" Error management interface/>
		function onMC_Callback(sender: IMC_PluginBase; aeDeviceType: TMC_DeviceType; aiDeviceNum: integer; acInput: IStream; out zcAnswer: IStream;
			out zcErr: IMC_Error): TMC_CallbackResult; stdcall;
		/// <summary>
		/// This methods can be used to implement customised logging traces.
		/// </summary>
		/// Drivers can implement custom logging traces in addition to those already available in all CEGID applications.
		/// <param name="aeSeverity"> Trace severity.</param>
		/// <param name="asCategory"> Trace category. For instance the device name</param>
		/// <param name="asMessage"> Text message to log</param>
		/// <returns> True if the message could be logged, False otherwise</returns>
		/// <seealso cref="manageLog" returns the severity of the log traces which will be processed./>
		/// <seealso cref="TMC_LogSeverity" Log severity/>
		function onAddLog(aeSeverity: TMC_LogSeverity; const asCategory, asMessage: wideString): Boolean; stdcall;
		/// <summary>
		/// Indicates the severity of the log traces which will be processed
		/// </summary>
		/// The severity is useful to fine tune the level of information required (and possibly the application performance).
		/// Hence the driver may call <b>manageLog</b> to find out what is the current managed severity and consequently
		/// whether a particular trace will be taken into account.
		/// <param name="aeSeverity"> Log severity.</param>
		/// <returns>description</returns>
		/// <seealso cref="onAddLog" Adds logging traces/>
		/// <seealso cref="TMC_LogSeverity" Log severity/>
		function manageLog(aeSeverity: TMC_LogSeverity): TMC_CallbackResult; stdcall;
	end;

	/// <summary>
	/// Interface used by <see cref="IMC_PluginCallbackV2.onMC_CPOSCommand"/> to pass input/aout parameters.
	/// </summary>
	/// This is the base interface for all CPOS co-operation commands to pass input/ouput parameters.<p>
	/// Every CPOS co-operation command could describe a more specific interface, inherited from this one, to pass needed parameters.
	IMC_CPOSCommandContext = interface(IMC_VersionedInterface)
		['{6D3F0491-FB80-4868-AD9E-D6871C26AC83}']
		function GetCommandId: TMC_CPOSCommandId; stdcall;
		function GetDeviceType: TMC_DeviceType; stdcall;
		function GetDeviceNum: integer; stdcall;

		/// <summary>
		/// Returns a string representation on the class with log proposals
		/// </summary>
		/// Return a string with relevant information (about class contents) for lor proposals.<p>
		/// This data will be sent to Log manager by CPOS.
		/// <returns>Contents of the class</returns>
		function ToLogString: wideString; stdcall;

		/// <summary>
		/// Returns the identifier of the command to be executed
		/// <value>A value from <see cref="TMC_CPOSCommandId"/> enumeration</value>
		/// </summary>
		property CommandId: TMC_CPOSCommandId read GetCommandId;
		/// <summary>
		/// Returns the device type on the command will be executed.
		/// <value>An enumerated value which indentifies the targeted device type on CPOS</value>
		/// </summary>
		property deviceType: TMC_DeviceType read GetDeviceType;
		/// <summary>
		/// Returns the registered device number on the command will be executed.
		/// <value>A numeric value which indentifies the targeted device on CPOS</value>
		/// </summary>
		property DeviceNum: integer read GetDeviceNum;
	end;

	/// <summary>
	/// Command context to determine whether defective devices can be locked.
	/// </summary>
	/// This command context allows driver to determine whether it can lock defective devices.<p>
	/// <seealso cref="IMC_PluginCallbackV2.onMC_CPOSCommand" Callback V2 interface/>
	/// <seealso cref="IMC_CPOSCommandContext" Execution context of CPOS commands/>
	IMC_CPOSCommandCanLockDevicesContext = interface(IMC_CPOSCommandContext)
		['{03ECCE30-D7A2-479A-A8E8-57E3F680F286}']
		procedure SetLockable(abLockable: Boolean); stdcall;
		function GetLockable: Boolean; stdcall;

		/// <summary>
		/// Returns TRUE when devices could be locked by CPOS, FALSE otherwise.
		/// <value>A boolean value which indicated if drivers could be locked by CPOS</value>
		/// </summary>
		property Lockable: Boolean read GetLockable write SetLockable;
	end;

	/// <summary>
	/// Command context to print anything from a text file.
	/// </summary>
	/// This command context allows driver to send a printing request from contents of a text file.<p>
	/// <seealso cref="IMC_PluginCallbackV2.onMC_CPOSCommand" Callback V2 interface/>
	/// <seealso cref="IMC_CPOSCommandContext" Execution context of CPOS commands/>
	IMC_CPOSCommandPrintFileContext = interface(IMC_CPOSCommandContext)
		['{047389C5-D5F2-400F-9575-0876C3A2FFD5}']
		function GetFilename: wideString; stdcall;
		function GetOriginalCommand: wideString; stdcall;
		function GetReportType: TMC_ReportType; stdcall;
		function GetPrintingLayout: wideString; stdcall;
		function GetLayoutFieldname: wideString; stdcall;

		/// <summary>
		/// Returns filename containing data to be printed out.
		/// <value>A string (with abosulte path) indicated where text file has been saved</value>
		/// </summary>
		property Filename: wideString read GetFilename;
		/// <summary>
		/// Returns an Id of the original command.<p>
		/// This original command could inform to business application how (and where) printing process had been started.
		/// For example, CAT devices needing to print out payment transaction receipt by co-operation could inform, by this property,
		/// which TPE command is behind every request.
		/// Available values of this property must be aggreed with business application developement team.
		/// <value>A string identiying which command has statrted printing proces</value>
		/// </summary>
		property OriginalCommand: wideString read GetOriginalCommand;
		/// <summary>
		/// Returns an Id meaning which kind of report type is being run.
		/// <value>A enumerate value from <see cref="TMC_ReportType"/> identifying the report type of the printing process</value>
		/// </summary>
		property ReportType: TMC_ReportType read GetReportType;
		/// <summary>
		/// Returns layout Id to be used on printing process.
		/// <value>A string identifying which layout should be used on printing process</value>
		/// </summary>
		property PrintingLayout: wideString read GetPrintingLayout;
		/// <summary>
		/// Returns the name of field's layout to be used on printing process.
		/// <value>A string  identifying the field on printing layout to be use to print out data</value>
		/// </summary>
		property LayoutFieldname: wideString read GetLayoutFieldname;
	end;

	/// <summary>
	/// Command context to print from a XML stream.
	/// </summary>
	/// This command context allows driver to send a printing request from contents of a text file.<p>
	/// <seealso cref="IMC_PluginCallbackV2.onMC_CPOSCommand" Callback V2 interface/>
	/// <seealso cref="IMC_CPOSCommandContext" Execution context of CPOS commands/>
	IMC_CPOSCommandPrintXMLStreamContext = interface(IMC_CPOSCommandContext)
		['{A57A5854-486B-4087-9F81-47A747C17239}']
		function GetOriginalCommand: wideString; stdcall;
		function GetReportType: TMC_ReportType; stdcall;
		function GetPrintingLayout: wideString; stdcall;
		function GetXml: wideString; stdcall;

		/// <summary>
		/// Returns an Id of the original command.<p>
		/// This original command could inform to business application how (and where) printing process had been started.
		/// For example, CAT devices needing to print out payment transaction receipt by co-operation could inform, by this property,
		/// which TPE command is behind every request.
		/// Available values of this property must be aggreed with business application developement team.
		/// <value>A string identiying which command has statrted printing proces</value>
		/// </summary>
		property OriginalCommand: wideString read GetOriginalCommand;
		/// <summary>
		/// Returns an Id meaning which kind of report type is being run.
		/// <value>A enumerate value from <see cref="TMC_ReportType"/> identifying the report type of the printing process</value>
		/// </summary>
		property ReportType: TMC_ReportType read GetReportType;
		/// <summary>
		/// Returns layout Id to be used on printing process.
		/// <value>A string identifying which layout should be used on printing process</value>
		/// </summary>
		property PrintingLayout: wideString read GetPrintingLayout;
		/// <summary>
		/// Returns the XML stream to be printed.
		/// <value>A string containing a XML stream with data to be printed</value>
		/// </summary>
		property Xml: wideString read GetXml;
	end;

	/// <summary>
	/// Command context to lock defective devices.
	/// </summary>
	/// This command context allows driver to request lock of defective devices.<p>
	/// <seealso cref="IMC_PluginCallbackV2.onMC_CPOSCommand" Callback V2 interface/>
	/// <seealso cref="IMC_CPOSCommandContext" Execution context of CPOS commands/>
	IMC_CPOSCommandLockDevicesContext = interface(IMC_CPOSCommandContext)
		['{DC4FDE48-4460-420A-9777-1203AC3B6411}']
		function GetAllDevices: Boolean; stdcall;

		/// <summary>
		/// Returns TRUE when driver request lock of ALL available drivers, FALSE if it want to lock only it-self.
		/// <value>A boolean value which indicated which drivers must be locked</value>
		/// </summary>
		property AllDevices: Boolean read GetAllDevices;
	end;

	/// <summary>
	/// Command context to Get Device registering number.
	/// </summary>
	/// This command context allows driver to request its own registering number (in CPOS environemt).<p>
	/// <seealso cref="IMC_PluginCallbackV2.onMC_CPOSCommand" Callback V2 interface/>
	/// <seealso cref="IMC_CPOSCommandContext" Execution context of CPOS commands/>
	IMC_CPOSCommandGetDeviceNumberContext = interface(IMC_CPOSCommandContext)
		['{5C0B6035-E499-4232-BA4A-2B667D5E948D}']
		function GetDeviceNumber: integer; stdcall;
		procedure SetDeviceNumber(aiDeviceNum: integer); stdcall;

		/// <summary>
		/// This property transports the registering device number for the driver executing the CPOS co-operation command.
		/// <value>A boolean value which indicated which drivers must be locked</value>
		/// </summary>
		property DeviceNumber: integer read GetDeviceNumber write SetDeviceNumber;
	end;

	/// <summary>
	/// Second version of <see cref="MC_PluginInterface.IMC_PluginCallback"/> interface.
	/// </summary>
	/// This interface adds new features to existing <see cref="MC_PluginInterface.IMC_Plugininterface"/> and simplifies the communication for CPOS drivers using specific CPOS callback function.
	IMC_PluginCallbackV2 = interface(IMC_PluginCallback)
		['{D3D7A971-073E-4564-BE6B-ABC4514932F1}']

		/// <summary>
		/// This method enables cooperation between drivers and CPOS core
		/// </summary>
		/// This method is used by CPOS drivers that need use any co-operation command provided directly by CPOS.<p>
		/// For instance:<p>
		/// A Cardholder Activated Terminal (CAT) driver needs to give the transaction details to the printer driver so that a receipt can be printed.
		/// <remarks>
		/// The acContext parameter could be specialized for every available command.
		/// </remarks>
		/// <param name="sender"> Reference to the driver which made the call</param>
		/// <param name="acContext"> Target device type</param>
		/// <param name="zcError"> Interface <see cref="IMC_Error"/> which holds potential errors</param>
		/// <returns> Returns a value among <see cref="TMC_CallbackResult"/> to indicate the result of the cooperation</returns>
		/// <seealso cref="MC_PluginInterface.IMC_PluginBase" Driver base interface/>
		/// <seealso cref="IMC_CPOSCommandContext" Execution context for co-operation command/>
		/// <seealso cref="IMC_Error" Error management interface/>
		function onMC_CPOSCommand(sender: IMC_PluginBase; acContext: IMC_CPOSCommandContext; out zcErr: IMC_Error): TMC_CallbackResult; stdcall;
	end;

	/// <summary>
	/// This is the base interface for all drivers managed by the CPOS packages
	/// </summary>
	/// The interface MC_PluginInterface.IMC_PluginBase provides the basics to implement a driver in the CPOS packages.
	/// Each type of device derives from it, adding methods and properties to handle its specificities
	IMC_PluginBase = interface(IMC_VersionedInterface)
		['{5FDB21A5-3A05-4357-9797-DD09587179B7}']
		function get_PluginInformations: IMC_PluginInformations; stdcall;
		function get_State: TMC_StateDevice; stdcall;
		procedure set_Callback(acCallback: IMC_PluginCallback); stdcall;
		function get_CallBack: IMC_PluginCallback; stdcall;

		/// <summary>
		/// Returns a reference to the last error recorded by the driver.
		/// </summary>
		/// If an error occurs when using a device, the driver should return all the information available
		/// to the CPOS packages so that the problem may be corrected
		/// <returns> Returns a reference to <see cref="IMC_Error"/>, which holds all the necessary information</returns>
		/// <seealso cref="IMC_Error" Error management interface/>
		function getLastError: IMC_Error; stdcall;
		/// <summary>
		/// Returns (and clears) a reference to the last error recorded by the driver.
		/// </summary>
		/// If an error occurs when using a device, the driver should return all the information available
		/// to the CPOS packages so that the problem may be corrected
		/// <returns> Returns a reference to <see cref="IMC_Error"/>, which holds all the necessary information</returns>
		/// <seealso cref="IMC_Error" Error management interface/>
		function clearLastError: IMC_Error; stdcall;

		/// <summary>
		/// Allows the client application to discover the driver's capabilities
		/// </summary>
		/// Since all devices do not have the same features, the client application need to interrogate the drivers for each
		/// device to determine its capabilities.
		///
		/// To do so, the client application must call the method <u>getCapabilitiés</u>.
		///
		/// The reply is not necessarily a boolean. For instance: customer line display drivers must return the number
		/// of columns supported by the device.
		/// <remarks>
		/// The parameter <paramref name="aiCapability"/> can be adapted according to the device type.
		/// </remarks>
		/// <example>
		/// <code>
		/// var
		/// lcPlugin : IMC_PluginBase
		/// ...
		/// if (lcPlugin.getCapabilities(caPrinterFiscalPrinter,'')='X') and
		/// (lcplugin.getCapabilities(caFiscalNotFiscalPrintAllowed,'')='X') then
		/// doPrintNonFiscalReceipt;
		/// ...
		/// </code>
		/// </example>
		/// <param name="aiCapability"> Capability being queried</param>
		/// <param name="asOptsArgs"> Optional arguments, which depend upon <paramref name="aiCapability"/></param>
		/// <returns>
		/// The reply provided by the driver.<p>
		/// Conventionaly, a positive reply is expressed using the letter "X" while a negative reply is "-".
		/// Toute autre valeur sera exprimée par sa valeur en chaîne de caractères.
		/// </returns>
		function getCapabilities(aiCapability: TMC_Capabilities; const asOptArgs: wideString): wideString; stdcall;
		/// <summary>
		/// Attempts connecting to the device
		/// </summary>
		/// This commands attempts a connection to the device using the parameters given in <paramref name="asConnectString"/>
		/// <param name="asConnectString"> Holds the information required for the driver to connect to the device</param>
		/// <returns>True if the connection is achieved, False otherwise.</returns>
		/// <remarks>
		/// If the connexion is successful, the property is <see cref="state"/> updated.
		/// If the connexion fails, the problem can be determined by calling the method <see cref="getLastError"/>
		/// </remarks>
		/// <seealso cref="state" Returns the device state/>
		/// <seealso cref="getLastError" Returns the last <see cref="IMC_Error"/> recorded/>
		function connect(const asConnectString: wideString): Boolean; stdcall;
		/// <summary>
		/// Attempts to open the device
		/// </summary>
		/// This command requests that the driver open the device
		/// <returns>True if the device can be opened, False otherwise.</returns>
		/// <remarks>
		/// If the connexion is successful, the property is <see cref="state"/> updated.
		/// If the connexion fails, the problem can be determined by calling the method <see cref="getLastError"/>
		/// </remarks>
		/// <seealso cref="state" Returns the device state/>
		/// <seealso cref="getLastError" Returns the last <see cref="IMC_Error"/> recorded/>
		function open(): Boolean; stdcall;
		/// <summary>
		/// Attempts to close the device
		/// </summary>
		/// This command requests that the driver close the device
		/// <returns>True if the device can be closed, False otherwise.</returns>
		/// <remarks>
		/// If the connexion is successful, the property is <see cref="state"/> updated.
		/// If the connexion fails, the problem can be determined by calling the method <see cref="getLastError"/>
		/// </remarks>
		/// <seealso cref="state" Returns the device state/>
		/// <seealso cref="getLastError" Returns the last <see cref="IMC_Error"/> recorded/>
		function close(): Boolean; stdcall;
		/// <summary>
		/// Attempts to disconnect the device
		/// </summary>
		/// This command requests that the driver disconnect the device
		/// <returns>True if the device can be disconnected, False otherwise.</returns>
		/// <remarks>
		/// If the connexion is successful, the property is <see cref="state"/> updated.
		/// If the connexion fails, the problem can be determined by calling the method <see cref="getLastError"/>
		/// </remarks>
		/// <seealso cref="state" Returns the device state/>
		/// <seealso cref="getLastError" Returns the last <see cref="IMC_Error"/> recorded/>
		function disconnect(): Boolean; stdcall;
		/// <summary>
		/// Check the device's health
		/// </summary>
		/// This command requests that the driver check the device's health.
		/// <param name="asConnectString"> Holds the information required for the driver to connect to the device</param>
		/// <param name="zsAnswer"> The output parameter contains a character string, which is indicative of the device's state </param>
		/// <returns>True if the command succeeded to retrieve the device's health, False otherwise.</returns>
		function checkHealth(const asConnectString: wideString; out zsAnswer: wideString): Boolean; stdcall;
		/// <summary>
		/// Attempts to initialise the device
		/// </summary>
		/// This command requests that the driver initialise the device
		/// <returns>True if the device could be initialised, False otherwise.</returns>
		function InitDevice(): Boolean; stdcall;
		/// <summary>
		/// This method is used to run "direct commands", which are implemented in the driver
		/// </summary>
		/// This method offers the possibility to run "direct commands", which are implemented by the driver beyond the scope of the CPOS standard
		/// or they can be new commands, which are not yet implemented in the driver interface.
		/// <param name="asCommand"> Command identifier.</param>
		/// <param name="acDataIn">  Data stream which provides the necessary parameters for the execution of the command.</param>
		/// <param name="zcDataOut"> Optional output data stream returned by the driver</param>
		/// <returns>True if the command could be executed, False otherwise.</returns>
		/// <remarks>
		/// If the command fails, the problem can be determined by calling the method <see cref="getLastError"/>
		/// </remarks>
		function directCommand(const asCommand: wideString; acDataIn: IStream; out zcDataOut: IStream): Boolean; stdcall;

		/// <summary> Returns general information regarding the device.
		/// <value> A reference to the interface <see cref="MC_PluginInterface.IMC_PluginInformations"/></value>
		/// </summary>
		/// <seealso cref="MC_PluginInterface.IMC_PluginInformations" for details regarding the information provided by the interface/>
		property pluginInformations: IMC_PluginInformations read get_PluginInformations;
		/// <summary> Returns the device's current state
		/// <value> A value among the following <see cref="TMC_StateDevice"/> </value>
		/// </summary>
		/// <seealso cref="TMC_StateDevice" for details regarding the possible states/>
		property state: TMC_StateDevice read get_State;
		/// <summary> Reference to the interface, which manages the callback function calls made by the driver.
		/// <value> Reference to <see cref="MC_PluginInterface.IMC_PluginCallback"/></value>
		/// </summary>
		/// <seealso cref="MC_PluginInterface.IMC_PluginCallback" for details regarding callback management/>
		property callback: IMC_PluginCallback read get_CallBack write set_Callback;
	end;

	/// <summary>
	/// This is the Version 2 of base interface for all drivers managed by the CPOS packages
	/// </summary>
	/// The interface MC_PluginInterface.IMC_PluginBase provides the basics to implement a driver in the CPOS packages.
	/// Each type of device derives from it, adding methods and properties to handle its specificities.<p>
	/// This version 2 adds a new method allowing business applications to get infrastructure information about standalone mode.
	/// <seealso cref="MC_PluginInterface.IMC_PluginBase" base interface for all drivers/>
	IMC_PluginBaseV2 = interface(IMC_PluginBase)
		['{76C47B23-573C-440F-92EC-B2CCDD17EFF7}']

		/// <summary>
		/// This command gives to CPOS drivers the way to provide to business applications any relevant parameter regarding standalone mode.
		/// </summary>
		/// This command gives a XML stream to CPOS/business applications detailing relevant parameters for CPOS driver about standalone mode.<p>
		/// Those parameters could be (for Exemple) the list of receipt layouts that CPOS driver need to work correctly and should be downloaded by business application.
		/// <param name="zcSettings"> XML stream carrying out CPOS driver settings form stansadlone mode</param>
		/// <returns>True if the command could be executed, False otherwise.</returns>
		function GetStandaloneSettings(out zcSettings: IMC_Stream): Boolean; stdcall;
	end;

	/// <summary>
	/// This interface implements an interface list <see cref="MC_PluginInterface.IMC_PluginInformations"/>
	/// </summary>
	/// An implementation of this interface must be able to manage a list of information interfaces allowing a
	/// definite identification of the drivers.<p>
	/// A reference to this interface is obtained by calling the method <see cref="IMC_PluginLoader.enumPlugins"/><p>
	/// The property <see cref="items"/> gives access to the information regarding each driver registered in the list
	/// <example> The following example shows how the name and description of all the drivers found in the DLL can be listed in a memo control.
	/// <code>
	/// var
	/// liIdx : integer ;
	/// lcList : IMC_PluginList ;
	/// ...
	/// lcList:=getPluginLoader.enumplugins ;
	/// for liIdx:=0 to lcList.count-1 do
	/// memo1.lines.add(lcList.items[liIdx].internalname+' '+lcList.items[liIdx].description ;
	/// ...
	/// </code>
	/// </example>
	/// <remarks>
	/// An exception in raised if the index is out of the list bounds
	/// </remarks>
	/// <seealso cref="MC_PluginInterface.IMC_PluginInformations" Device information interface />
	IMC_PluginList = interface(IMC_ListVersionedInterface)
		['{5F291AEF-DCDF-467C-96FF-D7A888BE1376}']
		function get_Item(aiIndex: integer): IMC_PluginInformations; stdcall;
		function get_Count: integer; stdcall;

		/// <summary>
		/// Adds device information to the list
		/// </summary>
		/// Adds a reference to the device information interface to the list
		/// <param name="acItem"> A reference to <see cref="MC_PluginInterface.IMC_PluginInformations"/> to add to the list</param>
		/// <returns> The index of the element added to the list</returns>
		/// <seealso cref="MC_PluginInterface.IMC_PluginInformations" Device information interface/>
		function add(acItem: IMC_PluginInformations): integer; stdcall;
		/// <summary>
		/// Gets a device information
		/// </summary>
		/// Gets a reference to the device information interface found at the position <paramref name="aiIndex"/> in the list.
		/// <param name="aiIndex"> Index of the element to get</param>
		/// <returns> A reference to <see cref="MC_PluginInterface.IMC_PluginInformations"/></returns>
		/// <remarks>
		/// An exception in raised if the index is out of the list bounds
		/// </remarks>
		/// <seealso cref="MC_PluginInterface.IMC_PluginInformations" Device information interface/>
		function get(aiIndex: integer): IMC_PluginInformations; stdcall;
		/// <summary>
		/// Puts the device information
		/// </summary>
		/// Puts the reference to a device information interface <paramref name="acItem"/> at the position <paramref name="aiIndex"/> in the list
		/// <param name="aiIndex"> Index in the list</param>
		/// zparam name="acItem"> Reference <see cref="MC_PluginInterface.IMC_PluginInformations"/> to put in the list </param>
		/// <remarks>
		/// An exception in raised if the index is out of the list bounds
		/// </remarks>
		/// <seealso cref="MC_PluginInterface.IMC_PluginInformations" Device information interface/>
		procedure put(aiIndex: integer; acItem: IMC_PluginInformations); stdcall;
		/// <summary>
		/// Clears the list
		/// </summary>
		/// Clears all the references contained in the list.
		procedure clear(); stdcall;
		/// <summary>
		/// Deletes a device informat
		/// </summary>
		/// Deletes the reference to a device information interface found at position <c aiIndex/> in the list
		/// <param name="aiIndex"> Index in the list</param>
		/// <remarks>
		/// An exception in raised if the index is out of the list bounds
		/// </remarks>
		/// <seealso cref="MC_PluginInterface.IMC_PluginInformations" Device information interface/>
		procedure delete(aiIndex: integer); stdcall;
		/// <summary>
		/// Returns the first device information
		/// </summary>
		/// Returns a reference to the first device information interface managed by the list
		/// <returns> Returns a reference to the first interface of the list, or Nil if the list is empty</returns>
		/// <seealso cref="MC_PluginInterface.IMC_PluginInformations" Device information interface/>
		function first(): IMC_PluginInformations; stdcall;
		/// <summary>
		/// Returns the index of a given device information
		/// </summary>
		/// Returns the index of the element which matches the parameter <paramref name="acItem"/>
		/// <param name="acItem"> Reference to a device information interface </param>
		/// <returns> The index of the reference to the device information, if it was found, -1 otherwise</returns>
		/// <seealso cref="MC_PluginInterface.IMC_PluginInformations" Device information interface/>
		function indexOf(acItem: IMC_PluginInformations): integer; stdcall;
		/// <summary>
		/// Inserts device information in the list
		/// </summary>
		/// Inserts the reference to a device information <paramref name="acItem"/> at the index specified by <paramref name="aiIndex"/>.
		/// <param name="aiIndex"> Index in the list.</param>
		/// <param name="acItem"> Reference to the device information interface to insert</param>
		/// <seealso cref="MC_PluginInterface.IMC_PluginInformations" Device information interface/>
		procedure insert(aiIndex: integer; acItem: IMC_PluginInformations); stdcall;
		/// <summary>
		/// Returns the last device information
		/// </summary>
		/// Returns a reference to the last device information interface managed by the list
		/// <returns> Returns a reference to the last interface of the list, or Nil if the list is empty</returns>
		/// <seealso cref="MC_PluginInterface.IMC_PluginInformations" Device information interface/>
		function last(): IMC_PluginInformations; stdcall;
		/// <summary>
		/// Removes a device information
		/// </summary>
		/// Removes the reference to the device information corresponding to  <paramref name="acItem"/>
		/// <param name="acItem"> Reference to <see cref="MC_PluginInterface.IMC_PluginInformations"/></param>
		/// <seealso cref="MC_PluginInterface.IMC_PluginInformations" Device information interface/>
		procedure remove(acItem: IMC_PluginInformations); stdcall;

		/// <summary>
		/// Gives access to the list elements
		/// </summary>
		/// This property provides a reference to the device information interface found at position <paramref name="aiIndex"/> in the list.<p>
		/// The value of <paramref name="aiIndex"/> must be between 0 and <see cref="count"/>-1.
		/// <param name="aiIndex"> Index in the list</param>
		/// <remarks>
		/// An exception in raised if the index is out of the list bounds
		/// </remarks>
		/// <seealso cref="MC_PluginInterface.IMC_PluginInformations" Device information interface/>
		property items[aiIndex: integer]: IMC_PluginInformations read get_Item; default;
		/// <summary>
		/// Returns the element count
		/// </summary>
		/// Returns the number of device information references present in the list
		property count: integer read get_Count;
	end;

	IMC_BindingControl = interface;

	/// <summary>
	/// Interface managing the Enabled property of controls or device setup windows
	/// </summary>
	/// <seealso cref="MC_PluginInterface.IMC_BindingHandler" Control binding handler/>
	/// <seealso cref="MC_PluginInterface.IMC_BindingControl" Device setup control manager/>
	IMC_BindingVisualEnabled = interface(IMC_Interface)
		['{1A3A88A8-0108-481D-8428-31D8503266DC}']
		procedure set_Enabled(abEnabled: Boolean); stdcall;
		function get_Enabled: Boolean; stdcall;

		/// <summary>
		/// Used to get or set the control's accessibility
		/// </summary>
		/// <seealso cref="MC_PluginInterface.IMC_BindingHandler" Control binding handler/>
		/// <seealso cref="MC_PluginInterface.IMC_BindingControl" Device setup control manager/>
		property Enabled: Boolean read get_Enabled write set_Enabled;
	end;

	/// <summary>
	/// Interface managing the "Visible" property of controls
	/// </summary>
	/// <seealso cref="MC_PluginInterface.IMC_BindingControl" Device setup control manager/>
	IMC_BindingVisualHandler = interface(IMC_BindingVisualEnabled)
		['{B2BCFEE0-3FFD-418E-A3A7-70713BBB0EF9}']
		procedure set_Visible(abVisible: Boolean); stdcall;
		function get_Visible: Boolean; stdcall;
		procedure set_value(const asValue: wideString); stdcall;
		function get_Value: wideString; stdcall;

		/// <summary>
		/// Used to get or set the control's visibility
		/// </summary>
		/// <seealso cref="MC_PluginInterface.IMC_BindingControl" Device setup control manager/>
		property visible: Boolean read get_Visible write set_Visible;
		/// <summary>
		/// Used to get or set the control's value
		/// </summary>
		/// <seealso cref="MC_PluginInterface.IMC_BindingHandler" Control binding handler/>
		/// <seealso cref="MC_PluginInterface.IMC_BindingControl" Control binding manager/>
		property value: wideString read get_Value write set_value;
	end;

	/// <summary>
	/// Interface managing controls which allow the user to choose among a list of values: <see cref="MC_PluginInterface.IMC_BindingComboBoxControl"/>
	/// and <see cref="MC_PluginInterface.IMC_BindingRadioControl"/>
	/// </summary>
	/// <seealso cref="MC_PluginInterface.IMC_BindingComboBoxControl" ComboBox binding manager/>
	/// <seealso cref="MC_PluginInterface.IMC_BindingRadioControl" RadioGroup binding manager/>
	IMC_BindingListVisualHandler = interface(IMC_BindingVisualHandler)
		['{038CC374-EFDD-438E-A17D-08ABCD53AE4F}']
		/// <summary>
		/// Update the list of values in the associated ComboBox or RadioGroup control
		/// </summary>
		/// <seealso cref="MC_PluginInterface.IMC_BindingComboBoxControl" ComboBox binding manager/>
		/// <seealso cref="MC_PluginInterface.IMC_BindingRadioControl" RadioGroup binding manager/>
		procedure UpdateVisualList; stdcall;
	end;

	/// <summary>
	/// Interface managing the position of controls
	/// </summary>
	/// <seealso cref="MC_PluginInterface.IMC_BindingControl" Control binding manager/>
	IMC_BindingPositionableControl = interface(IMC_VersionedInterface)
		['{EFD9D2F3-57B8-4B16-A6BC-BAAFD566E681}']
		function get_Width: integer; stdcall;
		function get_Height: integer; stdcall;
		function get_Align: TMC_BindingAlignControl; stdcall;

		/// <summary>
		/// Returns the control width
		/// </summary>
		property width: integer read get_Width;
		/// <summary>
		/// Returns the control height
		/// </summary>
		property height: integer read get_Height;
		/// <summary>
		/// Returns the control alignemnet
		/// </summary>
		/// <seealso cref="MC_PluginInterface.TMC_BindingAlignControl" Control alignement types/>
		property Align: TMC_BindingAlignControl read get_Align;
	end;

	/// <summary>
	/// Interface handling the events of managed controls
	/// </summary>
	/// <seealso cref="MC_PluginInterface.IMC_BindingControl" Control binding manager/>
	IMC_BindingControlEvents = interface(IMC_Interface)
		['{B5A30D83-9F3F-4FBD-B8C5-4C2FB11C9A6B}']
		/// <summary>
		/// This event is triggered when the associated control gets the focus
		/// </summary>
		/// <seealso cref="MC_PluginInterface.IMC_BindingControl" Control binding manager/>
		procedure onEntered(acCtrl: IMC_BindingControl); stdcall;
		/// <summary>
		/// This event is triggered when the user changes the associated control's content
		/// </summary>
		/// <seealso cref="MC_PluginInterface.IMC_BindingControl" Control binding manager/>
		procedure onChanged(acCtrl: IMC_BindingControl); stdcall;
		/// <summary>
		/// This event is triggered when the associated control looses the focus
		/// </summary>
		/// <seealso cref="MC_PluginInterface.IMC_BindingControl" Control binding manager/>
		procedure onExited(acCtrl: IMC_BindingControl); stdcall;
		/// <summary>
		/// This event is triggered when a visual property is changed in the associated control
		/// </summary>
		/// <seealso cref="MC_PluginInterface.IMC_BindingControl" Control binding manager/>
		/// <seealso cref="MC_PluginInterface.TMC_BindingVisualPropertyChanged" Types de changement visuel des contrôles/>
		procedure onVisualChanged(acCtrl: IMC_BindingControl; aeProperty: TMC_BindingVisualPropertyChanged); stdcall;
	end;

	/// <summary>
	/// Base interface used to define the controls used in device setup windows
	/// </summary>
	/// <seealso cref="MC_PluginInterface.IMC_BindingHandler" Control binding handler/>
	IMC_BindingControl = interface(IMC_BindingPositionableControl)
		['{3BA49EF0-3AEF-4E77-ACC3-2DC5A3FB84E7}']
		function get_Name: wideString; stdcall;
		function get_TabOrder: integer; stdcall;
		procedure set_Changed(abChanged: Boolean); stdcall;
		function get_Changed: Boolean; stdcall;
		procedure set_OnControlEvents(acControlEvents: IMC_BindingControlEvents); stdcall;
		function get_OnControlEvents: IMC_BindingControlEvents; stdcall;
		procedure set_VisualChangeshandler(acVisualChangeshandler: IMC_BindingVisualHandler); stdcall;
		function get_VisualChangeshandler: IMC_BindingVisualHandler; stdcall;

		/// <summary>
		/// Returns the control name
		/// </summary>
		/// <seealso cref="MC_PluginInterface.IMC_BindingControl" Control binding manager/>
		property name: wideString read get_Name;
		/// <summary>
		/// Returns the tabulation order of the control
		/// </summary>
		/// <seealso cref="MC_PluginInterface.IMC_BindingControl" Control binding manager/>
		property tabOrder: integer read get_TabOrder;
		/// <summary>
		/// Indicates whether the content of the control has changed
		/// </summary>
		/// <seealso cref="MC_PluginInterface.IMC_BindingControl" Control binding manager/>
		property Changed: Boolean read get_Changed write set_Changed;
		/// <summary>
		/// Used to get or set the control visual events handler
		/// </summary>
		/// <seealso cref="MC_PluginInterface.IMC_BindingControl" Control binding manager/>
		/// <seealso cref="MC_PluginInterface.IMC_BindingVisualHandler" Control visual events handler/>
		property VisualChangesHandler: IMC_BindingVisualHandler read get_VisualChangeshandler write set_VisualChangeshandler;
		/// <summary>
		/// Used to get or set the control events handler
		/// </summary>
		/// <seealso cref="MC_PluginInterface.IMC_BindingControl" Control binding manager/>
		/// <seealso cref="MC_PluginInterface.IMC_BindingControlEvents" Control events handler/>
		property onControlEvents: IMC_BindingControlEvents read get_OnControlEvents write set_OnControlEvents;
	end;

	/// <summary>
	/// This interface manages a list of references to <see cref="MC_PluginInterface.IMC_BindingControl"/>
	/// </summary>
	/// When implemented, this interface should be capable to manage a list of controls placed in a device setup window
	/// <seealso cref="MC_PluginInterface.IMC_BindingControl" Control binding manager/>
	IMC_BindingControlsList = interface(IMC_ListVersionedInterface)
		['{0CF25879-E9EE-427B-9E23-2D588CC1B650}']
		function get_Item(aiIndex: integer): IMC_BindingControl; stdcall;
		function get_Count: integer; stdcall;
		procedure set_Changed(abChanged: Boolean); stdcall;
		function get_Changed: Boolean; stdcall;

		/// <summary>
		/// Adds a control
		/// </summary>
		/// Adds a reference to a control binding manager interface.
		/// <param name="acItem"> A reference to <see cref="MC_PluginInterface.IMC_BindingControl"/></param>
		/// <returns>The index of the reference in the list</returns>
		/// <seealso cref="MC_PluginInterface.IMC_BindingControl" Device information interface/>
		function add(acItem: IMC_BindingControl): integer; stdcall;
		/// <summary>
		/// Gets a control
		/// </summary>
		/// Get the control binding manager interface at the index <paramref name="aiIndex"/> in the list.
		/// <param name="aiIndex"> Index in the list</param>
		/// <returns> A reference to <see cref="MC_PluginInterface.IMC_BindingControl"/></returns>
		/// <remarks>
		/// An exception in raised if the index is out of the list bounds
		/// </remarks>
		/// <seealso cref="MC_PluginInterface.IMC_BindingControl" Device information interface/>
		function get(aiIndex: integer): IMC_BindingControl; stdcall;
		/// <summary>
		/// Puts a control at the given index
		/// </summary>
		/// Puts a reference to  <paramref name="acItem"/> at the index <paramref name="aiIndex"/> in the list
		/// <param name="aiIndex"> Index in the list</param>
		/// zparam name="acItem"> Reference to <see cref="MC_PluginInterface.IMC_BindingControl"/> </param>
		/// <remarks>
		/// An exception in raised if the index is out of the list bounds
		/// </remarks>
		/// <seealso cref="MC_PluginInterface.IMC_BindingControl" Device information interface/>
		procedure put(aiIndex: integer; acItem: IMC_BindingControl); stdcall;
		/// <summary>
		/// Clear the list
		/// </summary>
		/// Clears all the references contained in the list.
		procedure clear(); stdcall;
		/// <summary>
		/// Removes a control
		/// </summary>
		/// Removes the control binding manager interface found at the position <c aiIndex/> in the list
		/// <param name="aiIndex"> Index in the list</param>
		/// <remarks>
		/// An exception in raised if the index is out of the list bounds
		/// </remarks>
		/// <seealso cref="MC_PluginInterface.IMC_BindingControl" Device information interface/>
		procedure delete(aiIndex: integer); stdcall;
		/// <summary>
		/// Returns the first control
		/// </summary>
		/// Returns a reference to the first control binding manager interface managed by the list
		/// <returns> Returns a reference to the first interface of the list, or Nil if the list is empty</returns>
		/// <seealso cref="MC_PluginInterface.IMC_BindingControl" Device information interface/>
		function first(): IMC_BindingControl; stdcall;
		/// <summary>
		/// Returns the index of the element given as a parameter
		/// </summary>
		/// Returns the index of the element given in <paramref name="acItem"/>
		/// <param name="acItem"> Reference to the interface</param>
		/// <returns> The index of the reference found in the list, -1 otherwise</returns>
		/// <seealso cref="MC_PluginInterface.IMC_BindingControl" Device information interface/>
		function indexOf(acItem: IMC_BindingControl): integer; stdcall;
		/// <summary>
		/// Inserts an element at the given index
		/// </summary>
		/// Inserts the element given in <paramref name="acItem"/> at the index specified by <paramref name="aiIndex"/>.
		/// <param name="aiIndex"> Index in the list.</param>
		/// <param name="acItem"> Reference to the interface</param>
		/// <seealso cref="MC_PluginInterface.IMC_BindingControl" Device information interface/>
		procedure insert(aiIndex: integer; acItem: IMC_BindingControl); stdcall;
		/// <summary>
		/// Returns the last control
		/// </summary>
		/// Returns a reference to the last control binding manager interface managed by the list
		/// <returns> Returns a reference to the last interface of the list, or Nil if the list is empty</returns>
		/// <seealso cref="MC_PluginInterface.IMC_BindingControl" Device information interface/>
		function last(): IMC_BindingControl; stdcall;
		/// <summary>
		/// Removes an element from the list
		/// </summary>
		/// Removes the element given in <paramref name="acItem"/>
		/// <param name="acItem"> Reference to <see cref="MC_PluginInterface.IMC_BindingControl"/> to be removed from the list</param>
		/// <seealso cref="MC_PluginInterface.IMC_BindingControl" Device information interface/>
		procedure remove(acItem: IMC_BindingControl); stdcall;

		/// <summary>
		/// Searches a control by its name
		/// </summary>
		/// Searches the controls with a name matching <paramref name="asName"/>.
		/// <param name="acName">Nom du contrôle à rechercher</param>
		function search(const asName: wideString): IMC_BindingControl; stdcall;

		/// <summary>
		/// Gives access to the elements
		/// </summary>
		/// This property returns a reference to the interface found at the index <paramref name="aiIndex"/>.<p>
		/// The value <paramref name="aiIndex"/> must be between 0 and <see cref="count"/>-1.
		/// <param name="aiIndex"> Index in the list</param>
		/// <remarks>
		/// An exception in raised if the index is out of the list bounds
		/// </remarks>
		/// <seealso cref="MC_PluginInterface.IMC_BindingControl" Device information interface/>
		property items[aiIndex: integer]: IMC_BindingControl read get_Item; default;
		/// <summary>
		/// Element count
		/// </summary>
		/// Returns the number of elements in the list
		property count: integer read get_Count;
		/// <summary>
		/// Indicates whether the content of one of the controls has changed
		/// </summary>
		/// Returns True if the content of at least one of the controls has changed
		property Changed: Boolean read get_Changed write set_Changed;
	end;

	/// <summary>
	/// This interface manages the caption of the associated control
	/// </summary>
	/// <seealso cref="MC_PluginInterface.IMC_BindingControl" Control binding manager/>
	IMC_BindingCaption = interface(IMC_BindingPositionableControl)
		['{1F6E1102-5C5B-433E-B636-AE345B429CF9}']
		function get_caption: wideString; stdcall;

		/// <summary>
		/// Returns the control caption
		/// </summary>
		property caption: wideString read get_caption;
	end;

	/// <summary>
	/// Interface managing the content of controls which allow the user to choose among a list of values: <see cref="MC_PluginInterface.IMC_BindingComboBoxControl"/>
	/// and <see cref="MC_PluginInterface.IMC_BindingRadioControl"/>
	/// </summary>
	/// <seealso cref="MC_PluginInterface.IMC_BindingControl" Control binding manager/>
	/// <seealso cref="MC_PluginInterface.IMC_BindingComboBoxControl" ComboBox binding manager/>
	/// <seealso cref="MC_PluginInterface.IMC_BindingRadioControl" RadioGroup binding manager/>
	IMC_BindingListValue = interface(IMC_VersionedInterface)
		['{669A9BB4-FFBD-4AA6-8821-EBDEBCE02B7D}']
		function get_Value: wideString; stdcall;
		function get_Item: wideString; stdcall;

		/// <summary>
		/// Returns the option identifier (code)
		/// </summary>
		property value: wideString read get_Value;
		/// <summary>
		/// Returns the option description
		/// </summary>
		property Item: wideString read get_Item;
	end;

	IMC_BindingListValuesControl = interface;

	/// <summary>
	/// This interface manages a list of interfaces <see cref="MC_PluginInterface.IMC_BindingListValue"/>
	/// </summary>
	/// When implemented, this interface should be capable to manage a list of options
	/// <seealso cref="MC_PluginInterface.IMC_BindingListValue" Value list manager/>
	IMC_BindingListValuesList = interface(IMC_ListVersionedInterface)
		['{0CF25879-E9EE-427B-9E23-2D588CC1B650}']
		function get_Item(aiIndex: integer): IMC_BindingListValue; stdcall;
		function get_Count: integer; stdcall;
		function get_ValuesListParent: IMC_BindingListValuesControl; stdcall;

		/// <summary>
		/// Adds a value list
		/// </summary>
		/// Adds a reference to a value list manager interface
		/// <param name="acItem"> A reference to <see cref="MC_PluginInterface.IMC_BindingListValue"/></param>
		/// <returns> The index of the element in the list</returns>
		/// <seealso cref="MC_PluginInterface.IMC_BindingListValue" Device information interface/>
		function add(acItem: IMC_BindingListValue): integer; stdcall;
		/// <summary>
		/// Gets the value list at the given index
		/// </summary>
		/// Gets the value list at the given index <paramref name="aiIndex"/> in the list.
		/// <param name="aiIndex"> Index in the list</param>
		/// <returns> A reference to <see cref="MC_PluginInterface.IMC_BindingListValue"/></returns>
		/// <remarks>
		/// An exception in raised if the index is out of the list bounds
		/// </remarks>
		/// <seealso cref="MC_PluginInterface.IMC_BindingListValue" Device information interface/>
		function get(aiIndex: integer): IMC_BindingListValue; stdcall;
		/// <summary>
		/// Puts a new element at the given index
		/// </summary>
		/// Puts the reference to <paramref name="acItem"/> at the index <paramref name="aiIndex"/> in the list
		/// <param name="aiIndex"> Index in the list</param>
		/// zparam name="acItem"> Reference to <see cref="MC_PluginInterface.IMC_BindingListValue"/></param>
		/// <remarks>
		/// An exception in raised if the index is out of the list bounds
		/// </remarks>
		/// <seealso cref="MC_PluginInterface.IMC_BindingListValue" Device information interface/>
		procedure put(aiIndex: integer; acItem: IMC_BindingListValue); stdcall;
		/// <summary>
		/// Clears the list
		/// </summary>
		/// Clears all the references contained in the list.
		procedure clear(); stdcall;
		/// <summary>
		/// Deletes an element
		/// </summary>
		/// Deletes the element found at the index <c aiIndex/> in the list
		/// <param name="aiIndex"> Index in the list</param>
		/// <remarks>
		/// An exception in raised if the index is out of the list bounds
		/// </remarks>
		/// <seealso cref="MC_PluginInterface.IMC_BindingListValue" Device information interface/>
		procedure delete(aiIndex: integer); stdcall;
		/// <summary>
		/// Returns the first element
		/// </summary>
		/// Returns a reference to the first interface managed by the list
		/// <returns> Returns a reference to the first interface of the list, or Nil if the list is empty</returns>
		/// <seealso cref="MC_PluginInterface.IMC_BindingListValue" Device information interface/>
		function first(): IMC_BindingListValue; stdcall;
		/// <summary>
		/// Returns the index of the element given as a parameter
		/// </summary>
		/// Returns the index of the element given in <paramref name="acItem"/>
		/// <param name="acItem"> Reference to the interface</param>
		/// <returns> The index of the reference found in the list, -1 otherwise</returns>
		/// <seealso cref="MC_PluginInterface.IMC_BindingListValue" Device information interface/>
		function indexOf(acItem: IMC_BindingListValue): integer; stdcall;
		/// <summary>
		/// Inserts an element at the given index
		/// </summary>
		/// Inserts the element given in <paramref name="acItem"/> at the index specified by <paramref name="aiIndex"/>.
		/// <param name="aiIndex"> Index in the list.</param>
		/// <param name="acItem"> Reference to the interface</param>
		/// <seealso cref="MC_PluginInterface.IMC_BindingListValue" Device information interface/>
		procedure insert(aiIndex: integer; acItem: IMC_BindingListValue); stdcall;
		/// <summary>
		/// Returns the last element
		/// </summary>
		/// Returns a reference to the last interface managed by the list
		/// <returns> Returns a reference to the last interface of the list, or Nil if the list is empty</returns>
		/// <seealso cref="MC_PluginInterface.IMC_BindingListValue" Device information interface/>
		function last(): IMC_BindingListValue; stdcall;
		/// <summary>
		/// Removes an element from the list
		/// </summary>
		/// Removes the element given in <paramref name="acItem"/>
		/// <param name="acItem"> Reference to <see cref="MC_PluginInterface.IMC_BindingControl"/> to be removed from the list</param>
		/// <seealso cref="MC_PluginInterface.IMC_BindingListValue" Device information interface/>
		procedure remove(acItem: IMC_BindingListValue); stdcall;

		/// <summary>
		/// Gives access to the elements
		/// </summary>
		/// This property returns a reference to the interface found at the index <paramref name="aiIndex"/>.<p>
		/// The value <paramref name="aiIndex"/> must be between 0 and <see cref="count"/>-1.
		/// <param name="aiIndex"> Index in the list</param>
		/// <remarks>
		/// An exception in raised if the index is out of the list bounds
		/// </remarks>
		/// <seealso cref="MC_PluginInterface.IMC_BindingListValue" Device information interface/>
		property items[aiIndex: integer]: IMC_BindingListValue read get_Item; default;
		/// <summary>
		/// Element count
		/// </summary>
		/// Returns the number of elements in the list
		property count: integer read get_Count;
		/// <summary>
		/// Returns a reference to <see cref="MC_PluginInterface.IMC_BindingComboBoxControl"/> or <see cref="MC_PluginInterface.IMC_BindingRadioControl"/>
		/// </summary>
		property valueListParent: IMC_BindingListValuesControl read get_ValuesListParent;
	end;

	/// <summary>
	/// Interface managing a panel control
	/// </summary>
	/// <seealso cref="MC_PluginInterface.IMC_BindingControl" Control binding manager/>
	IMC_BindingPanelControl = interface(IMC_BindingControl)
		['{9B15D307-AD4B-41B3-8431-E53E023ED7CF}']
		function get_Controls: IMC_BindingControlsList; stdcall;

		/// <summary>
		/// Returns the list of controls that it contains
		/// </summary>
		/// <seealso cref="MC_PluginInterface.IMC_BindingControl" Control binding manager/>
		property controls: IMC_BindingControlsList read get_Controls;
	end;

	/// <summary>
	/// Interface managing a groupbox control
	/// </summary>
	/// <seealso cref="MC_PluginInterface.IMC_BindingControl" Control binding manager/>
	IMC_BindingGroupControl = interface(IMC_BindingPanelControl)
		['{92C028DF-957B-4AB0-BE43-8B58097A9DA7}']
		function get_caption: wideString; stdcall;

		/// <summary>
		/// Returns the groupbox caption
		/// </summary>
		/// <seealso cref="MC_PluginInterface.IMC_BindingControl" Control binding manager/>
		property caption: wideString read get_caption;
	end;

	/// <summary>
	/// Interface managing a checkbox control
	/// </summary>
	/// <seealso cref="MC_PluginInterface.IMC_BindingControl" Control binding manager/>
	IMC_BindingCheckControl = interface(IMC_BindingControl)
		['{3637678A-45AA-41E4-A016-A0E467530A3D}']
		function get_caption: wideString; stdcall;

		/// <summary>
		/// Returns the checkbox caption
		/// </summary>
		/// <seealso cref="MC_PluginInterface.IMC_BindingControl" Control binding manager/>
		property caption: wideString read get_caption;
	end;

	/// <summary>
	/// (Internal) interface managing a list of values
	/// </summary>
	/// <seealso cref="MC_PluginInterface.IMC_BindingControl" Control binding manager/>
	/// <seealso cref="MC_PluginInterface.IMC_BindingComboBoxControl" ComboBox binding manager/>
	/// <seealso cref="MC_PluginInterface.IMC_BindingRadioControl" RadioGroup binding manager/>
	IMC_BindingListValuesControl = interface(IMC_BindingControl)
		['{776C5341-62DB-493E-9C37-CC29E391DFBA}']
		function get_Values: IMC_BindingListValuesList; stdcall;

		/// <summary>
		/// Returns the list of options managed by the associated control
		/// </summary>
		/// <seealso cref="MC_PluginInterface.IMC_BindingListValuesList" Value list/>
		property values: IMC_BindingListValuesList read get_Values;
	end;

	/// <summary>
	/// Interface managing a combobox control
	/// </summary>
	/// <seealso cref="MC_PluginInterface.IMC_BindingControl" Control binding manager/>
	IMC_BindingComboBoxControl = interface(IMC_BindingListValuesControl)
		['{A7EBE23F-99F6-4D79-97EF-9ED35467F596}']
		function get_caption: IMC_BindingCaption; stdcall;

		/// <summary>
		/// Returns a reference to <see cref="MC_PluginInterface.IMC_BindingCaption"/>,
		/// which should contain the information regarding the control's caption
		/// </summary>
		/// <seealso cref="MC_PluginInterface.IMC_BindingCaption" Control caption/>
		property caption: IMC_BindingCaption read get_caption;
	end;

	/// <summary>
	/// Interface managing a radiogroup control
	/// </summary>
	/// <seealso cref="MC_PluginInterface.IMC_BindingControl" Control binding manager/>
	IMC_BindingRadioControl = interface(IMC_BindingListValuesControl)
		['{70033971-AA84-4D15-BA15-A57CC364E306}']
		function get_Columns: integer; stdcall;
		function get_caption: wideString; stdcall;

		/// <summary>
		/// Returns the number of columns to use when displaying the options of the value list
		/// </summary>
		property columns: integer read get_Columns;
		/// <summary>
		/// Returns the text of the radiogroup caption
		/// </summary>
		property caption: wideString read get_caption;
	end;

	/// <summary>
	/// Interface managing a spinedit control
	/// </summary>
	/// <seealso cref="MC_PluginInterface.IMC_BindingControl" Control binding manager/>
	IMC_BindingSpinControl = interface(IMC_BindingControl)
		['{FB8ACCF2-AFC2-4C1A-A34D-B68691186566}']
		function get_MinValue: integer; stdcall;
		function get_MaxValue: integer; stdcall;
		function get_IncrementValue: integer; stdcall;
		function get_caption: IMC_BindingCaption; stdcall;

		/// <summary>
		/// Returns the minimum value allowed by the spinedit
		/// </summary>
		property minValue: integer read get_MinValue;
		/// <summary>
		/// Returns the maximum value allowed by the spinedit
		/// </summary>
		property maxValue: integer read get_MaxValue;
		/// <summary>
		/// Returns the increment used by the spinedit
		/// </summary>
		/// <seealso cref="MC_PluginInterface.IMC_BindingCaption" Control caption/>
		property IncrementValue: integer read get_IncrementValue;
		/// <summary>
		/// Returns a reference to <see cref="MC_PluginInterface.IMC_BindingCaption"/>,
		/// which should contain the information regarding the control's caption
		/// </summary>
		/// <seealso cref="MC_PluginInterface.IMC_BindingCaption" Control caption/>
		property caption: IMC_BindingCaption read get_caption;
	end;

	/// <summary>
	/// Interface managing a trackbar control
	/// </summary>
	/// <seealso cref="MC_PluginInterface.IMC_BindingControl" Control binding manager/>
	IMC_BindingTrackBarControl = interface(IMC_BindingSpinControl)
		['{1AD59F38-8A61-40DB-81A6-B0B45EB3893D}']
		function get_TickStyle: TMC_BindingTickStyle; stdcall;
		function get_factorValue: integer; stdcall;
		function get_FactorCaption: IMC_BindingCaption; stdcall;

		/// <summary>
		/// Returns the tick style displayed by the trackbar
		/// </summary>
		/// <seealso cref="MC_PluginInterface.TMC_BindingTickStyle" Trackbar ticks styles/>
		property tickStyle: TMC_BindingTickStyle read get_TickStyle;
		/// <summary>
		/// Returns the increment used by the trackbar
		/// </summary>
		/// <seealso cref="MC_PluginInterface.IMC_BindingCaption" Control caption/>
		property FactorValue: integer read get_factorValue;
		/// <summary>
		/// Returns a reference to <see cref="MC_PluginInterface.IMC_BindingCaption"/>,
		/// which should contain the information regarding the control's caption
		/// </summary>
		/// <seealso cref="MC_PluginInterface.IMC_BindingCaption" Control caption/>
		property factorCaption: IMC_BindingCaption read get_FactorCaption;
	end;

	/// <summary>
	/// Interface managing an edit control
	/// </summary>
	/// <seealso cref="MC_PluginInterface.IMC_BindingControl" Control binding manager/>
	IMC_BindingEditControl = interface(IMC_BindingControl)
		['{2093BD1A-7B0E-4955-BA03-563BB9582A51}']
		function get_Mask: wideString; stdcall;
		function get_EditType: TMC_BindingEditType; stdcall;
		function get_caption: IMC_BindingCaption; stdcall;

		/// <summary>
		/// Returns the display mask used by the edit control
		/// </summary>
		property Mask: wideString read get_Mask;
		/// <summary>
		/// Returns the type of data managed by the edit control
		/// </summary>
		/// <seealso cref="MC_PluginInterface.IMC_BindingCaption" Control caption/>
		property editType: TMC_BindingEditType read get_EditType;
		/// <summary>
		/// Returns a reference to <see cref="MC_PluginInterface.IMC_BindingCaption"/>,
		/// which should contain the information regarding the control's caption
		/// </summary>
		/// <seealso cref="MC_PluginInterface.IMC_BindingCaption" Control caption/>
		property caption: IMC_BindingCaption read get_caption;
	end;

	/// <summary>
	/// Interface managing a Page control
	/// </summary>
	/// <seealso cref="MC_PluginInterface.IMC_BindingControl" Control binding manager/>
	IMC_BindingPageControl = interface(IMC_BindingGroupControl)
		['{0519F37A-CC5A-4CAE-998F-59CCAA86343E}']
	end;

	/// <summary>
	/// This interface manages a list of references to <see cref="MC_PluginInterface.IMC_BindingPageControl"/>
	/// </summary>
	/// When implemented, this interface should be capable to manage a list of pages
	/// <seealso cref="MC_PluginInterface.IMC_BindingPageControl" page control manager/>
	IMC_BindingPagesList = interface(IMC_ListVersionedInterface)
		['{E058871B-FA58-4C2B-B5ED-0F852C3A20A4}']
		function get_Count: integer; stdcall;
		procedure set_Changed(abChanged: Boolean); stdcall;
		function get_Changed: Boolean; stdcall;

		/// <summary>
		/// Adds a page
		/// </summary>
		/// Adds a reference to a page control manager interface.
		/// <param name="acItem"> A reference to <see cref="MC_PluginInterface.IMC_BindingPageControl"/></param>
		/// <returns>The index of the reference in the list</returns>
		/// <seealso cref="MC_PluginInterface.IMC_BindingPageControl" Page control manager/>
		function add(acItem: IMC_BindingPageControl): integer; stdcall;
		/// <summary>
		/// Gets a page
		/// </summary>
		/// Get the page  manager interface at the index <paramref name="aiIndex"/> in the list.
		/// <param name="aiIndex"> Index in the list</param>
		/// <returns> A reference to <see cref="MC_PluginInterface.IMC_BindingPageControl"/></returns>
		/// <remarks>
		/// An exception in raised if the index is out of the list bounds
		/// </remarks>
		/// <seealso cref="MC_PluginInterface.IMC_BindingPageControl" Page control interface/>
		function get(aiIndex: integer): IMC_BindingPageControl; stdcall;
		/// <summary>
		/// Puts a page at the given index
		/// </summary>
		/// Puts a reference to  <paramref name="acItem"/> at the index <paramref name="aiIndex"/> in the list
		/// <param name="aiIndex"> Index in the list</param>
		/// zparam name="acItem"> Reference to <see cref="MC_PluginInterface.IMC_BindingPageControl"/> </param>
		/// <remarks>
		/// An exception in raised if the index is out of the list bounds
		/// </remarks>
		/// <seealso cref="MC_PluginInterface.IMC_BindingPageControl" Page control interface/>
		procedure put(aiIndex: integer; acItem: IMC_BindingPageControl); stdcall;
		/// <summary>
		/// Clear the list
		/// </summary>
		/// Clears all the references contained in the list.
		procedure clear(); stdcall;
		/// <summary>
		/// Removes a Page
		/// </summary>
		/// Removes the page manager interface found at the position <c aiIndex/> in the list
		/// <param name="aiIndex"> Index in the list</param>
		/// <remarks>
		/// An exception in raised if the index is out of the list bounds
		/// </remarks>
		/// <seealso cref="MC_PluginInterface.IMC_BindingPageControl" Page control interface/>
		procedure delete(aiIndex: integer); stdcall;
		/// <summary>
		/// Returns the first page
		/// </summary>
		/// Returns a reference to the first page manager interface managed by the list
		/// <returns> Returns a reference to the first interface of the list, or Nil if the list is empty</returns>
		/// <seealso cref="MC_PluginInterface.IMC_BindingPageControl" Page control interface/>
		function first(): IMC_BindingPageControl; stdcall;
		/// <summary>
		/// Returns the index of the element given as a parameter
		/// </summary>
		/// Returns the index of the element given in <paramref name="acItem"/>
		/// <param name="acItem"> Reference to the interface</param>
		/// <returns> The index of the reference found in the list, -1 otherwise</returns>
		/// <seealso cref="MC_PluginInterface.IMC_BindingPageControl" Page control interface/>
		function indexOf(acItem: IMC_BindingPageControl): integer; stdcall;
		/// <summary>
		/// Inserts an element at the given index
		/// </summary>
		/// Inserts the element given in <paramref name="acItem"/> at the index specified by <paramref name="aiIndex"/>.
		/// <param name="aiIndex"> Index in the list.</param>
		/// <param name="acItem"> Reference to the interface</param>
		/// <seealso cref="MC_PluginInterface.IMC_BindingPageControl" Device information interface/>
		procedure insert(aiIndex: integer; acItem: IMC_BindingPageControl); stdcall;
		/// <summary>
		/// Returns the last page
		/// </summary>
		/// Returns a reference to the last page manager interface managed by the list
		/// <returns> Returns a reference to the last interface of the list, or Nil if the list is empty</returns>
		/// <seealso cref="MC_PluginInterface.IMC_BindingPageControl" Page control interface/>
		function last(): IMC_BindingPageControl; stdcall;
		/// <summary>
		/// Removes an element from the list
		/// </summary>
		/// Removes the element given in <paramref name="acItem"/>
		/// <param name="acItem"> Reference to <see cref="MC_PluginInterface.IMC_BindingPageControl"/> to be removed from the list</param>
		/// <seealso cref="MC_PluginInterface.IMC_BindingPageControl" Page control interface/>
		procedure remove(acItem: IMC_BindingPageControl); stdcall;

		/// <summary>
		/// Searches a control by its name
		/// </summary>
		/// Searches the controls with a name matching <paramref name="asName"/>.
		/// <param name="acName">Nom du contrôle à rechercher</param>
		function search(const asName: wideString): IMC_BindingControl; stdcall;

		/// <summary>
		/// Gives access to the elements
		/// </summary>
		/// This property returns a reference to the interface found at the index <paramref name="aiIndex"/>.<p>
		/// The value <paramref name="aiIndex"/> must be between 0 and <see cref="count"/>-1.
		/// <param name="aiIndex"> Index in the list</param>
		/// <remarks>
		/// An exception in raised if the index is out of the list bounds
		/// </remarks>
		/// <seealso cref="MC_PluginInterface.IMC_BindingPageControl" Page control interface/>
		property items[aiIndex: integer]: IMC_BindingPageControl read get write put; default;
		/// <summary>
		/// Element count
		/// </summary>
		/// Returns the number of elements in the list
		property count: integer read get_Count;
		/// <summary>
		/// Indicates whether the content of one of the controls has changed
		/// </summary>
		/// Returns True if the content of at least one of the controls has changed
		property Changed: Boolean read get_Changed write set_Changed;
	end;

	/// <summary>
	/// Interface managing a Pages container control
	/// </summary>
	/// <seealso cref="MC_PluginInterface.IMC_BindingControl" Control binding manager/>
	IMC_BindingPagesContainerControl = interface(IMC_BindingControl)
		['{5848E869-BB22-4412-AA4B-56320C7D9A56}']
		function get_Pages: IMC_BindingPagesList; stdcall;

		/// <summary>
		/// Returns the list of pages that it contains
		/// </summary>
		/// <seealso cref="MC_PluginInterface.IMC_BindingPageControl" pages binding manager/>
		property pages: IMC_BindingPagesList read get_Pages;
	end;

	/// <summary>
	/// Interface used to implement event handlers linked to the bound control
	/// </summary>
	/// <seealso cref="MC_PluginInterface.IMC_BindingHandler" Control binding handler/>
	IMC_BindingHandlerEvents = interface(IMC_Interface)
		['{931F2E68-B7D0-442C-8F13-70426BB93C83}']
		procedure OnLoad(const asConnectString: wideString); stdcall;
		/// <summary>
		/// This event is triggered when the user attempts to validate his/her input
		/// </summary>
		/// <seealso cref="MC_PluginInterface.IMC_BindingHandler" Control binding handler/>
		function onValidating(out zcErr: IMC_Error): Boolean; stdcall;
		/// <summary>
		/// This event is triggered when the user input has been validated
		/// </summary>
		/// <seealso cref="MC_PluginInterface.IMC_BindingHandler" Control binding handler/>
		function onValidated: wideString; stdcall;
		/// <summary>
		/// This event is triggered when the user presses an Ok button in the window
		/// or if he/she simply closes the window
		/// </summary>
		/// <seealso cref="MC_PluginInterface.IMC_BindingHandler" Control binding handler/>
		function onClosing: Boolean; stdcall;
		/// <summary>
		/// This event is triggered when the window is closed
		/// </summary>
		/// <seealso cref="MC_PluginInterface.IMC_BindingHandler" Control binding handler/>
		procedure onClosed; stdcall;
		/// <summary>
		/// This event is triggered when the user requests some help
		/// </summary>
		/// <seealso cref="MC_PluginInterface.IMC_BindingHandler" Control binding handler/>
		procedure onHelp; stdcall;
	end;

	/// <summary>
	/// Interface managing device setup windows
	/// </summary>
	IMC_BindingHandler = interface(IMC_VersionedInterface)
		['{5D12A541-554A-4DF2-A68B-A48E4B46ED1B}']
		function get_caption: wideString; stdcall;
		function get_Controls: IMC_BindingControlsList; stdcall;
		procedure set_OnFormEvents(acFormEvents: IMC_BindingVisualEnabled); stdcall;
		function get_OnFormEvents: IMC_BindingVisualEnabled; stdcall;
		procedure set_HandlerEvents(acHandlerEvents: IMC_BindingHandlerEvents); stdcall;
		function get_HandlerEvents: IMC_BindingHandlerEvents; stdcall;

		/// <summary>
		/// Returns the window caption
		/// </summary>
		property caption: wideString read get_caption;
		/// <summary>
		/// Returns the list of controls found in the window
		/// </summary>
		/// <seealso cref="MC_PluginInterface.IMC_BindingControl" Control binding manager/>
		property controls: IMC_BindingControlsList read get_Controls;
		/// <summary>
		/// Used to get or set the control visual events handler
		/// </summary>
		/// <seealso cref="MC_PluginInterface.IMC_BindingControl" Control binding manager/>
		/// <seealso cref="MC_PluginInterface.IMC_BindingVisualHandler" Control visual events handler/>
		property onFormEvents: IMC_BindingVisualEnabled read get_OnFormEvents write set_OnFormEvents;
		/// <summary>
		/// Used to get or set the control events handler
		/// </summary>
		/// <seealso cref="MC_PluginInterface.IMC_BindingControl" Control binding manager/>
		/// <seealso cref="MC_PluginInterface.IMC_BindingControlEvents" Control events handler/>
		property HandlerEvents: IMC_BindingHandlerEvents read get_HandlerEvents write set_HandlerEvents;
	end;

	/// <summary>
	/// This interface manages the drivers contained in a DLL.
	/// </summary>
	/// This interface manages all the drivers contained in a DLL.
	/// <seealso cref="IMC_PluginList" Driver information list/>
	/// <seealso cref="MC_PluginInterface.IMC_PluginBase" Driver base interface/>
	IMC_PluginLoader = interface(IMC_VersionedInterface)
		['{D44CB735-F567-44C2-B038-686F27151E06}']
		/// <summary>
		/// Returns a list of all the drivers contained in the DLL
		/// </summary>
		/// Returns a reference to <see cref="IMC_PluginList"/>, which manages the list of all the drivers contained in the DLL.
		/// <param name="aeDeviceType"> Can be used to filter the drivers for a particular kind of device</param>
		/// <returns> Reference to the interface IMC_PluginList which manages the information of all selected devices</returns>
		/// <seealso cref="IMC_PluginList" Driver information list/>
		/// <seealso cref="MC_PluginInterface.IMC_PluginInformations" Device information interface/>
		/// <seealso cref="TMC_DeviceType" Device types/>
		function enumPlugins(aeDeviceType: TMC_DeviceType; out zcErr: IMC_Error): IMC_PluginList; stdcall;
		/// <summary>
		/// Sets up the driver configuration options
		/// </summary>
		/// This function produces the connexion string used to establish a connexion with the driver.
		/// The actual content of the connexion string is handled by the driver.
		/// <param name="asDeviceID"> Device identifier <see cref="MC_PluginInterface.IMC_PluginInformations.internalName"/></param>
		/// <param name="asLangID"> Language to use for messages (please refer to remarks)</param>
		/// <param name="abAdvancedSetup"> Indicates whether an advanced setup is to be carried out </param>
		/// <param name="acCallback"> Reference ot the interface which manages the callbacks which will be called by the driver.</param>
		/// <param name="zcForm"> Reference to the device setup window handler</param>
		/// <param name="zcErr"> Reference to <see cref="IMC_Error"/>, which manages the possible errors</param>
		/// <returns>True if the setup was successful, False otherwise</returns>
		/// <remarks>
		/// <paramref name="asLangID"/> Uses the Microsoft LCID codification standard.
		/// </remarks>
		function binding(const asDeviceID, asLangID: wideString; abAdvancedSetup: Boolean; acCallback: IMC_PluginCallback; out zcForm: IMC_BindingHandler;
			out zcErr: IMC_Error): Boolean; stdcall;
		/// <summary>
		/// Returns a reference to the desired driver
		/// </summary>
		/// Returns a reference to the driver which matches the given parameters
		/// <param name="asDeviceId"> Driver identifier</param>
		/// <param name="asLangID"> Language to use for messages (please refer to remarks)</param>
		/// <param name="zcErr">Paramètre de type <see cref="IMC_Error"/> pour contenior des événtuels erreurs produits lors le processus</param>
		/// <returns>Une référence à l'interface <see cref="MC_PluginInterface.IMC_PluginBase"/> pour le pilote indiqué</returns>
		/// <remarks>
		/// <paramref name="asLangID"/> Uses the Microsoft LCID codification standard.
		/// </remarks>
		/// <seealso cref="MC_PluginInterface.IMC_PluginBase" Driver base interface/>
		function getInstance(const asDeviceID, asLangID: wideString; out zcErr: IMC_Error): IMC_PluginBase; stdcall;
	end;

	/// <summary>
	/// Entry point function signature for the Win32 DLL
	/// </summary>
	/// Win32 DLLs require an entry point in order to receive a reference to the driver loader <see cref="IMC_PluginLoader"/>
	/// <returns> Reference to IMC_PluginLoader</returns>
	/// <seealso cref="IMC_PluginLoader" Device loader/>
	TWin32DLLEP = function(out zcErr: IMC_Error): IMC_PluginLoader; stdcall;

implementation

end.
