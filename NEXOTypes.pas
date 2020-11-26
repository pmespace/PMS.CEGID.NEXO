unit NEXOTypes;

interface

uses
	Classes, MC_PluginInterface, PMS_NEXOSale_TLB;

const
	DRIVER_VERSION_MAJOR   = 0;
	DRIVER_VERSION_MINOR   = 1;
	DRIVER_VERSION_RELEASE = 0;
	DRIVER_VERSION_BUILD   = 0;
	DRIVER_NAME_SHORT      = 'NEXO Retailer Driver';
	DRIVER_NAME_EXTENDED   = 'NEXO Retailer v3.0 Driver';
	DRIVER_COPYRIGHT       = '© PMS';
	REGISTRY_APP_NAME      = 'NEXO Retailer Y2 Driver';

	CEGID_STRING_TRUE  = 'X';
	CEGID_STRING_FALSE = '-';
	CEGID_STRING_YES   = 'Y';
	CEGID_STRING_NO    = 'N';

type
	TNexoObjectBase = class(TInterfacedObject)
	end;

	TNexoVersionedObjectBase = class(TNexoObjectBase, IMC_Interface, IMC_Assignable, IMC_VersionedInterface)
		private
			fsExtra: wideString;
		protected
			procedure AssignError; virtual;
			procedure AssignFrom(acSource: IMC_Assignable); virtual;
			function get_RecordVersion: integer; virtual; stdcall;
			procedure setExtra(const asExtra: wideString); virtual; stdcall;
			function getExtra: wideString; virtual; stdcall;
			procedure DoDispose; virtual;
		public
			constructor create(const asExtra: wideString); virtual;
			procedure dispose; stdcall;
			procedure Assign(acSource: IMC_Assignable); stdcall;
			property recordVersion: integer read get_RecordVersion;
			property extra: wideString read getExtra write setExtra;
	end;

	TMC_VersionedListBase = class(TInterfaceList, IMC_Interface, IMC_Assignable, IMC_ListVersionedInterface)
		private
			fsExtra: wideString;
			fiUpdateCount: integer;
		protected
			procedure AssignFrom(acSource: IMC_Assignable); virtual;
			procedure AssignError; virtual;
			procedure doBeginUpdate; virtual;
			procedure doEndUpdate; virtual;
			function InUpdateMode: boolean;
			function get_RecordVersion: integer; virtual; stdcall;
			procedure setExtra(const asExtra: wideString); virtual; stdcall;
			function getExtra: wideString; virtual; stdcall;
		public
			procedure dispose; virtual; stdcall;
			procedure Assign(acSource: IMC_Assignable); stdcall;
			procedure beginUpdate; virtual; stdcall;
			procedure endUpdate; virtual; stdcall;

			property recordVersion: integer read get_RecordVersion;
			property extra: wideString read getExtra write setExtra;
	end;

	TMC_Error = class(TNexoVersionedObjectBase, IMC_Error)
		private
			fiCode: integer;
			fiextraInfo: integer;
			fsMessage: wideString;
		protected
			procedure AssignFrom(acSource: IMC_Assignable); override;
			function getCode: integer; stdcall;
			function getMessage: wideString; stdcall;
			function getextraInfo: integer; stdcall;
		public
			constructor create(aiCode: integer; const asMessage: wideString; aiExtraInfo: integer); reintroduce; overload;
			property code: integer read getCode;
			property message: wideString read getMessage;
			property extraInfo: integer read getextraInfo;
		public
			constructor create(aiCode: integer; data: wideString); reintroduce; overload;
			constructor create(aiCode: integer); reintroduce; overload;
	end;

	TMC_DetailedError = class(TMC_Error, IMC_DetailedError)
		private
			fsTechnicalMessage: wideString;
			fsAdviceMessage: wideString;
			fbCritical: boolean;
		protected
			procedure AssignFrom(acSource: IMC_Assignable); override;

			function getTechnicalMessage: wideString; stdcall;
			function getAdviceMessage: wideString; stdcall;
			function getCritical: boolean; stdcall;
		public
			constructor create(aiCode: integer; const asMessage: wideString; aiExtraInfo: integer; const asTechnicalMessage, asAdviceMessage: wideString;
				abCritical: boolean); reintroduce;
			property technicalMessage: wideString read getTechnicalMessage;
			property adviceMessage: wideString read getAdviceMessage;
			property critical: boolean read getCritical;
	end;

	TMC_PluginVersion = class(TNexoVersionedObjectBase, IMC_PluginVersion)
		private
			fimajorVersion: integer;
			fiminorVersion: integer;
			fireleaseVersion: integer;
			fibuildVersion: integer;
		protected
			procedure AssignFrom(acSource: IMC_Assignable); override;
			function get_MajorVersion: integer; stdcall;
			function get_MinorVersion: integer; stdcall;
			function get_ReleaseVersion: integer; stdcall;
			function get_BuildVersion: integer; stdcall;
		public
			constructor create(aimajorVersion, aiminorVersion, aireleaseVersion, aibuildVersion: integer); reintroduce;
			function wholeVersionString: wideString; stdcall;
			property majorVersion: integer read get_MajorVersion;
			property minorVersion: integer read get_MinorVersion;
			property releaseVersion: integer read get_ReleaseVersion;
			property buildVersion: integer read get_BuildVersion;
	end;

	TMC_PluginInformations = class(TNexoVersionedObjectBase, IMC_PluginInformations)
		private
			fideviceType: integer;
			fsinternalName: wideString;
			fscreator: wideString;
			fcversion: IMC_PluginVersion;
			fsdescription: wideString;
		protected
			procedure AssignFrom(acSource: IMC_Assignable); override;
			function get_DeviceType: TMC_DeviceType; stdcall;
			function get_InternalName: wideString; stdcall;
			function get_Creator: wideString; stdcall;
			function get_version: IMC_PluginVersion; stdcall;
			function get_Description: wideString; stdcall;
		public
			constructor create(aiDeviceType: integer; const asInternalName, asCreator: wideString; acVersion: IMC_PluginVersion; const asDescription: wideString);
				reintroduce;
			property deviceType: integer read get_DeviceType;
			property internalName: wideString read get_InternalName;
			property creator: wideString read get_Creator;
			property version: IMC_PluginVersion read get_version;
			property description: wideString read get_Description;
	end;

	TMC_PluginList = class(TMC_VersionedListBase, IMC_PluginList)
		protected
			function Get_Item(aiIndex: integer): IMC_PluginInformations; stdcall;
			procedure Set_Item(aiIndex: integer; acItem: IMC_PluginInformations); stdcall;
			function get_Count: integer; reintroduce; stdcall;
			procedure AssignFrom(acSource: IMC_Assignable); override;
		public
			function add(acItem: IMC_PluginInformations): integer; stdcall;
			function get(aiIndex: integer): IMC_PluginInformations; stdcall;
			procedure put(aiIndex: integer; acItem: IMC_PluginInformations); stdcall;
			procedure clear(); stdcall;
			procedure delete(aiIndex: integer); stdcall;
			function first(): IMC_PluginInformations; stdcall;
			function indexOf(acItem: IMC_PluginInformations): integer; stdcall;
			procedure insert(aiIndex: integer; acItem: IMC_PluginInformations); stdcall;
			function last(): IMC_PluginInformations; stdcall;
			procedure remove(acItem: IMC_PluginInformations); stdcall;
			property Items[index: integer]: IMC_PluginInformations read Get_Item write Set_Item; default;
	end;

implementation

uses
	sysutils, rtlConsts, NEXOLib;

// TNexoVersionedObjectBase
constructor TNexoVersionedObjectBase.create(const asExtra: wideString);
begin
	inherited create;

	fsExtra := asExtra;
end;

procedure TNexoVersionedObjectBase.dispose;
begin
	DoDispose;
end;

procedure TNexoVersionedObjectBase.DoDispose;
begin
	// Nothing to do...
end;

procedure TNexoVersionedObjectBase.Assign(acSource: IMC_Assignable);
begin
	if (Assigned(acSource))
	then AssignFrom(acSource)
	else AssignError;
end;

procedure TNexoVersionedObjectBase.AssignError;
begin
	raise EConvertError.CreateResFmt(@SAssignError, ['', ClassName]);
end;

procedure TNexoVersionedObjectBase.AssignFrom(acSource: IMC_Assignable);
var
	lcSource: IMC_VersionedInterface;
begin
	if acSource.QueryInterface(IMC_VersionedInterface, lcSource) = S_OK
	then begin
		fsExtra := lcSource.extra;
	end
	else AssignError;
end;

function TNexoVersionedObjectBase.get_RecordVersion: integer;
begin
	result := 1;
end;

procedure TNexoVersionedObjectBase.setExtra(const asExtra: wideString);
begin
	fsExtra := asExtra;
end;

function TNexoVersionedObjectBase.getExtra: wideString;
begin
	result := fsExtra;
end;

// TMC_VersionedListBase
procedure TMC_VersionedListBase.dispose;
begin
	clear;
end;

procedure TMC_VersionedListBase.Assign(acSource: IMC_Assignable);
begin
	if (Assigned(acSource))
	then begin
		beginUpdate;
		try
			AssignFrom(acSource)
		finally
			endUpdate;
		end;
	end
	else AssignError;
end;

procedure TMC_VersionedListBase.doBeginUpdate;
begin
	// Nothing to do a this level...
end;

procedure TMC_VersionedListBase.doEndUpdate;
begin
	// Nothing to do a this level...
end;

function TMC_VersionedListBase.InUpdateMode: boolean;
begin
	result := (fiUpdateCount > 0);
end;

procedure TMC_VersionedListBase.beginUpdate;
begin
	if fiUpdateCount <= 0
	then begin
		fiUpdateCount := 0;
		doBeginUpdate;
	end;

	inc(fiUpdateCount);
end;

procedure TMC_VersionedListBase.endUpdate;
begin
	dec(fiUpdateCount);

	if fiUpdateCount <= 0
	then begin
		fiUpdateCount := 0;
		doEndUpdate;
	end;
end;

procedure TMC_VersionedListBase.AssignFrom(acSource: IMC_Assignable);
var
	lcSource: IMC_VersionedInterface;
begin
	if acSource.QueryInterface(IMC_VersionedInterface, lcSource) = S_OK
	then begin
		fsExtra := lcSource.extra;
	end
	else AssignError;
end;

procedure TMC_VersionedListBase.AssignError;
begin
	raise EConvertError.CreateResFmt(@SAssignError, ['', ClassName]);
end;

function TMC_VersionedListBase.get_RecordVersion: integer;
begin
	result := 1;
end;

procedure TMC_VersionedListBase.setExtra(const asExtra: wideString);
begin
	fsExtra := asExtra;
end;

function TMC_VersionedListBase.getExtra: wideString;
begin
	result := fsExtra;
end;

// TMC_Error
constructor TMC_Error.create(aiCode: integer; const asMessage: wideString; aiExtraInfo: integer);
begin
	inherited create('');
	fiCode := aiCode;
	fsMessage := asMessage;
	fiextraInfo := aiExtraInfo;
end;

constructor TMC_Error.create(aiCode: integer; data: wideString);
begin
	inherited create('');
	fiCode := aiCode;
	fsMessage := GetErrorDescription(aiCode) + ': ' + data;
	fiextraInfo := 0;
end;

constructor TMC_Error.create(aiCode: integer);
begin
	inherited create('');
	fiCode := aiCode;
	fsMessage := GetErrorDescription(aiCode);
	fiextraInfo := 0;
end;

procedure TMC_Error.AssignFrom(acSource: IMC_Assignable);
var
	lcSource: IMC_Error;
begin
	if acSource.QueryInterface(IMC_Error, lcSource) = S_OK
	then begin
		fiCode := lcSource.code;
		fiextraInfo := lcSource.extraInfo;
		fsMessage := lcSource.message;
	end
	else AssignError;
end;

function TMC_Error.getCode: integer;
begin
	result := fiCode;
end;

function TMC_Error.getMessage: wideString;
begin
	result := fsMessage;
end;

function TMC_Error.getextraInfo: integer;
begin
	result := fiextraInfo;
end;

// TMC_DetailedError
constructor TMC_DetailedError.create(aiCode: integer; const asMessage: wideString; aiExtraInfo: integer; const asTechnicalMessage, asAdviceMessage: wideString;
	abCritical: boolean);
begin
	inherited create(aiCode, asMessage, aiExtraInfo);

	fsTechnicalMessage := asTechnicalMessage;
	fsAdviceMessage := asAdviceMessage;
	fbCritical := abCritical;
end;

procedure TMC_DetailedError.AssignFrom(acSource: IMC_Assignable);
var
	lcSource: IMC_DetailedError;
begin
	inherited;
	if acSource.QueryInterface(IMC_DetailedError, lcSource) = S_OK
	then begin
		fsTechnicalMessage := lcSource.technicalMessage;
		fsAdviceMessage := lcSource.adviceMessage;
		fbCritical := lcSource.critical;
	end;
end;

function TMC_DetailedError.getTechnicalMessage: wideString;
begin
	result := fsTechnicalMessage;
end;

function TMC_DetailedError.getAdviceMessage: wideString;
begin
	result := fsAdviceMessage;
end;

function TMC_DetailedError.getCritical: boolean;
begin
	result := fbCritical;
end;

// TMC_PluginVersion
constructor TMC_PluginVersion.create(aimajorVersion, aiminorVersion, aireleaseVersion, aibuildVersion: integer);
begin
	inherited create('');

	fimajorVersion := aimajorVersion;
	fiminorVersion := aiminorVersion;
	fireleaseVersion := aireleaseVersion;
	fibuildVersion := aibuildVersion;
end;

procedure TMC_PluginVersion.AssignFrom(acSource: IMC_Assignable);
var
	lcSource: IMC_PluginVersion;
begin
	if acSource.QueryInterface(IMC_PluginVersion, lcSource) = S_OK
	then begin
		fimajorVersion := lcSource.majorVersion;
		fiminorVersion := lcSource.minorVersion;
		fireleaseVersion := lcSource.releaseVersion;
		fibuildVersion := lcSource.buildVersion;
	end
	else AssignError;
end;

function TMC_PluginVersion.wholeVersionString: wideString;
begin
	result := Format('%0:.0d.%1:.0d.%2:.0d.%3:.0d', [majorVersion, minorVersion, releaseVersion, buildVersion]);
end;

function TMC_PluginVersion.get_MajorVersion: integer;
begin
	result := fimajorVersion;
end;

function TMC_PluginVersion.get_MinorVersion: integer;
begin
	result := fiminorVersion;
end;

function TMC_PluginVersion.get_ReleaseVersion: integer;
begin
	result := fireleaseVersion;
end;

function TMC_PluginVersion.get_BuildVersion: integer;
begin
	result := fibuildVersion;
end;

// TMC_PluginInformations
constructor TMC_PluginInformations.create(aiDeviceType: integer; const asInternalName, asCreator: wideString; acVersion: IMC_PluginVersion;
	const asDescription: wideString);
begin
	inherited create('');

	fideviceType := aiDeviceType;
	fsinternalName := asInternalName;
	fscreator := asCreator;
	fcversion := acVersion;
	fsdescription := asDescription;
end;

procedure TMC_PluginInformations.AssignFrom(acSource: IMC_Assignable);
var
	lcSource: IMC_PluginInformations;
begin
	if acSource.QueryInterface(IMC_PluginInformations, lcSource) = S_OK
	then begin
		fideviceType := lcSource.deviceType;
		fsinternalName := lcSource.internalName;
		fscreator := lcSource.creator;
		fcversion := TMC_PluginVersion.create(lcSource.version.majorVersion, lcSource.version.minorVersion, lcSource.version.releaseVersion,
			lcSource.version.buildVersion);
		fsdescription := lcSource.description;
	end
	else AssignError;
end;

function TMC_PluginInformations.get_DeviceType: TMC_DeviceType;
begin
	result := fideviceType;
end;

function TMC_PluginInformations.get_InternalName: wideString;
begin
	result := fsinternalName;
end;

function TMC_PluginInformations.get_Creator: wideString;
begin
	result := fscreator;
end;

function TMC_PluginInformations.get_version: IMC_PluginVersion;
begin
	result := fcversion;
end;

function TMC_PluginInformations.get_Description: wideString;
begin
	result := fsdescription;
end;

// TMC_PluginList
procedure TMC_PluginList.AssignFrom(acSource: IMC_Assignable);
var
	lcInfo, lcItem: IMC_PluginInformations;
	liIdx: integer;
	lcSource: IMC_PluginList;
begin
	clear;
	if acSource.QueryInterface(IMC_PluginList, lcSource) = S_OK
	then begin
		for liIdx := 0 to lcSource.count - 1 do begin
			lcItem := lcSource[liIdx];
			lcInfo := TMC_PluginInformations.create(lcItem.deviceType, lcItem.internalName, lcItem.creator, lcItem.version, lcItem.description);
			add(lcInfo);
		end;
	end
	else AssignError;
end;

function TMC_PluginList.Get_Item(aiIndex: integer): IMC_PluginInformations;
begin
	result := (inherited Items[aiIndex] as IMC_PluginInformations);
end;

function TMC_PluginList.get_Count: integer;
begin
	result := inherited getCount;
end;

procedure TMC_PluginList.Set_Item(aiIndex: integer; acItem: IMC_PluginInformations);
begin
	inherited Items[aiIndex] := acItem;
end;

function TMC_PluginList.add(acItem: IMC_PluginInformations): integer;
begin
	result := inherited add(acItem);
end;

procedure TMC_PluginList.remove(acItem: IMC_PluginInformations);
begin
	inherited remove(acItem);
end;

function TMC_PluginList.get(aiIndex: integer): IMC_PluginInformations;
begin
	result := (inherited get(aiIndex) as IMC_PluginInformations);
end;

procedure TMC_PluginList.put(aiIndex: integer; acItem: IMC_PluginInformations);
begin
	inherited put(aiIndex, acItem);
end;

procedure TMC_PluginList.clear();
begin
	inherited clear;
end;

procedure TMC_PluginList.delete(aiIndex: integer);
begin
	inherited delete(aiIndex);
end;

function TMC_PluginList.first(): IMC_PluginInformations;
begin
	result := (inherited first) as IMC_PluginInformations;
end;

function TMC_PluginList.last(): IMC_PluginInformations;
begin
	result := (inherited last) as IMC_PluginInformations;
end;

function TMC_PluginList.indexOf(acItem: IMC_PluginInformations): integer;
begin
	result := inherited indexOf(acItem);
end;

procedure TMC_PluginList.insert(aiIndex: integer; acItem: IMC_PluginInformations);
begin
	inherited insert(aiIndex, acItem);
end;

{ TNexoObjectBase }

end.
