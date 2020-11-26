unit NEXOPluginLoader;

interface

uses
	MC_PluginInterface, NEXOTypes, PMS_NEXOSale_TLB;

type
	TNexoPluginLoaderBase = class(TNexoVersionedObjectBase, IMC_PluginLoader)
		protected
			procedure doEnumPlugins(const acPluginList: IMC_PluginList; aeDeviceType: TMC_DeviceType; out zcErr: IMC_Error); virtual; abstract;
			function doBinding(const asDeviceID, asLangID: wideString; abAdvancedSetup: Boolean; acCallback: IMC_PluginCallback; out zcForm: IMC_BindingHandler;
				out zcErr: IMC_Error): Boolean; virtual; abstract;
			function doGetInstance(const asDeviceID, asLangID: wideString; out zcErr: IMC_Error): IMC_PluginBase; virtual; abstract;
		public
			function enumPlugins(aeDeviceType: TMC_DeviceType; out zcErr: IMC_Error): IMC_PluginList; stdcall;
			function binding(const asDeviceID, asLangID: wideString; abAdvancedSetup: Boolean; acCallback: IMC_PluginCallback; out zcForm: IMC_BindingHandler;
				out zcErr: IMC_Error): Boolean; stdcall;
			function getInstance(const asDeviceID, asLangID: wideString; out zcErr: IMC_Error): IMC_PluginBase; stdcall;
	end;

	TNexoPluginLoader = class(TNexoPluginLoaderBase)
		protected
			myNexo: NEXOSale;

		protected
			procedure doEnumPlugins(const acPluginList: IMC_PluginList; aeDeviceType: TMC_DeviceType; out zcErr: IMC_Error); override;
			function doBinding(const asDeviceID, asLangID: wideString; abAdvancedSetup: Boolean; acCallback: IMC_PluginCallback; out zcForm: IMC_BindingHandler;
				out zcErr: IMC_Error): Boolean; override;
			function doGetInstance(const asDeviceID, asLangID: wideString; out zcErr: IMC_Error): IMC_PluginBase; override;

		public
			constructor create(const asExtra: wideString); override; // reintroduce; overload;
	end;

implementation

uses
	sysutils, Controls, MC_Binding, NEXOLib, Forms, NEXO;

// TNexoPluginLoader

procedure TNexoPluginLoader.doEnumPlugins(const acPluginList: IMC_PluginList; aeDeviceType: TMC_DeviceType; out zcErr: IMC_Error);
begin
	if aeDeviceType in [dtCAT, dtUnknown]
	then
		with (TNexo.create('', myNexo) as IMC_PluginBase) do acPluginList.add(pluginInformations);
end;

constructor TNexoPluginLoader.create(const asExtra: wideString);
begin
	inherited;
	myNexo := CoNEXOSale.create;
	myNexo.MainWindow := Application.MainFormHandle;
	InitialiseSettings(myNexo);
end;

function TNexoPluginLoader.doBinding(const asDeviceID, asLangID: wideString; abAdvancedSetup: Boolean; acCallback: IMC_PluginCallback;
	out zcForm: IMC_BindingHandler; out zcErr: IMC_Error): Boolean;
begin
	// Cette section est appelée quand on clique sur le bouton des paramètres du driver
	result := DisplaySettings(myNexo, abAdvancedSetup);
end;

function TNexoPluginLoader.doGetInstance(const asDeviceID, asLangID: wideString; out zcErr: IMC_Error): IMC_PluginBase;
begin
	result := nil;
	// Widesametext(copy(asDeviceID, 1, 7), APBE_DRIVER_NAME_SHORT) then // - ' + APBE.AutoReaderSoftwareID) then
	if Widesametext(asDeviceID, DRIVER_NAME_SHORT)
	then begin
		result := TNexo.create(asLangID, myNexo);
	end;
end;

// TNexoPluginLoaderBase

function TNexoPluginLoaderBase.enumPlugins(aeDeviceType: TMC_DeviceType; out zcErr: IMC_Error): IMC_PluginList;
begin
	result := TMC_PluginList.create;
	doEnumPlugins(result, aeDeviceType, zcErr);
end;

function TNexoPluginLoaderBase.binding(const asDeviceID, asLangID: wideString; abAdvancedSetup: Boolean; acCallback: IMC_PluginCallback;
	out zcForm: IMC_BindingHandler; out zcErr: IMC_Error): Boolean; stdcall;
begin
	result := doBinding(asDeviceID, asLangID, abAdvancedSetup, acCallback, zcForm, zcErr);
end;

function TNexoPluginLoaderBase.getInstance(const asDeviceID, asLangID: wideString; out zcErr: IMC_Error): IMC_PluginBase;
begin
	result := (doGetInstance(asDeviceID, asLangID, zcErr) as IMC_PluginBase);
end;

end.
