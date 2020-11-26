// USELESS
unit MC_Binding;

interface

uses
	MC_PluginInterface, NEXOTypes, Controls;

type
	TMC_BindingPositionableControl = class(TNexoVersionedObjectBase, IMC_BindingPositionableControl)
	private
		fiwidth: integer;
		fiheight: integer;
		feAlign: TMC_BindingAlignControl;
	protected
		procedure AssignFrom(acSource: IMC_Assignable); override;

		function get_Width: integer; stdcall;
		function get_Height: integer; stdcall;
		function get_Align: TMC_BindingAlignControl; stdcall;
	public
		constructor create(aiwidth, aiheight: integer; aeAlign: TMC_BindingAlignControl); reintroduce;

		property width: integer read get_Width;
		property height: integer read get_Height;
		property Align: TMC_BindingAlignControl read get_Align;
	end;

	TMC_BindingControl = class(TMC_BindingPositionableControl, IMC_BindingControl)
	private
		fsName: string;
		fiTabOrder: integer;
		fcVisualChanges: IMC_BindingVisualHandler;
		fcControlEvents: IMC_BindingControlEvents;
		fbChanged: boolean;
	protected
		procedure AssignFrom(acSource: IMC_Assignable); override;

		function get_Name: wideString; stdcall;
		function get_TabOrder: integer; stdcall;
		procedure set_Changed(abChanged: boolean); stdcall;
		function get_Changed: boolean; stdcall;
		procedure set_OnControlEvents(acControlEvents: IMC_BindingControlEvents); stdcall;
		function get_OnControlEvents: IMC_BindingControlEvents; stdcall;
		procedure set_VisualChangeshandler(acVisualChangeshandler: IMC_BindingVisualHandler); stdcall;
		function get_VisualChangeshandler: IMC_BindingVisualHandler; stdcall;
		procedure DoDispose; override;
	public
		constructor create(aiwidth, aiheight: integer; aeAlign: TMC_BindingAlignControl; const asName: string; aiTabOrder: integer);

		property name: wideString read get_Name;
		property TabOrder: integer read get_TabOrder;
		property Changed: boolean read get_Changed write set_Changed;
		property VisualChangesHandler: IMC_BindingVisualHandler read get_VisualChangeshandler write set_VisualChangeshandler;
		property onControlEvents: IMC_BindingControlEvents read get_OnControlEvents write set_OnControlEvents;
	end;

	TMC_BindingControlsList = class(TMC_VersionedListBase, IMC_BindingControlsList)
	private
		procedure freeList;
	protected
		function Get_Item(aiIndex: integer): IMC_BindingControl; stdcall;
		procedure Set_Item(aiIndex: integer; acItem: IMC_BindingControl); stdcall;
		function get_Count: integer; reintroduce; stdcall;
		procedure set_Changed(abChanged: boolean); stdcall;
		function get_Changed: boolean; stdcall;

		procedure AssignFrom(acSource: IMC_Assignable); override;
	public
		procedure dispose; override;

		function add(acItem: IMC_BindingControl): integer; stdcall;
		function get(aiIndex: integer): IMC_BindingControl; stdcall;
		procedure put(aiIndex: integer; acItem: IMC_BindingControl); stdcall;
		procedure clear(); stdcall;
		procedure delete(aiIndex: integer); stdcall;
		function first(): IMC_BindingControl; stdcall;
		function indexOf(acItem: IMC_BindingControl): integer; stdcall;
		procedure insert(aiIndex: integer; acItem: IMC_BindingControl); stdcall;
		function last(): IMC_BindingControl; stdcall;
		procedure remove(acItem: IMC_BindingControl); stdcall;

		function search(const asName: wideString): IMC_BindingControl; stdcall;

		property Items[index: integer]: IMC_BindingControl read Get_Item write Set_Item; default;
		property Changed: boolean read get_Changed write set_Changed;
	end;

	TMC_BindingCaption = class(TMC_BindingPositionableControl, IMC_BindingCaption)
	private
		fsCaption: wideString;
	protected
		procedure AssignFrom(acSource: IMC_Assignable); override;

		function get_caption: wideString; stdcall;
	public
		constructor create(aiwidth, aiheight: integer; aeAlign: TMC_BindingAlignControl; const asCaption: wideString);

		property caption: wideString read get_caption;
	end;

	TMC_BindingListValue = class(TNexoVersionedObjectBase, IMC_BindingListValue)
	private
		fsValue: wideString;
		fsItem: wideString;
	protected
		procedure AssignFrom(acSource: IMC_Assignable); override;

		function get_Value: wideString; stdcall;
		function Get_Item: wideString; stdcall;
	public
		constructor create(const asValue, asItem: wideString); reintroduce;

		property value: wideString read get_Value;
		property Item: wideString read Get_Item;
	end;

	TMC_BindingListValuesList = class(TMC_VersionedListBase, IMC_BindingListValuesList)
	private
		fcValueListParent: IMC_BindingListValuesControl;

		procedure freeList;
	protected
		function Get_Item(aiIndex: integer): IMC_BindingListValue; stdcall;
		procedure Set_Item(aiIndex: integer; acItem: IMC_BindingListValue); stdcall;
		function get_Count: integer; reintroduce; stdcall;
		function get_ValuesListParent: IMC_BindingListValuesControl; stdcall;

		procedure AssignFrom(acSource: IMC_Assignable); override;
		procedure doEndUpdate; override;
	public
		constructor create(acValueListParent: IMC_BindingListValuesControl);
		procedure dispose; override;

		function add(acItem: IMC_BindingListValue): integer; stdcall;
		function get(aiIndex: integer): IMC_BindingListValue; stdcall;
		procedure put(aiIndex: integer; acItem: IMC_BindingListValue); stdcall;
		procedure clear(); stdcall;
		procedure delete(aiIndex: integer); stdcall;
		function first(): IMC_BindingListValue; stdcall;
		function indexOf(acItem: IMC_BindingListValue): integer; stdcall;
		procedure insert(aiIndex: integer; acItem: IMC_BindingListValue); stdcall;
		function last(): IMC_BindingListValue; stdcall;
		procedure remove(acItem: IMC_BindingListValue); stdcall;

		property Items[index: integer]: IMC_BindingListValue read Get_Item write Set_Item; default;
		property valueListParent: IMC_BindingListValuesControl read get_ValuesListParent;
	end;

	TMC_BindingPanelControl = class(TMC_BindingControl, IMC_BindingPanelControl)
	private
		fcControls: IMC_BindingControlsList;

		procedure freeControls;
	protected
		procedure AssignFrom(acSource: IMC_Assignable); override;

		function get_Controls: IMC_BindingControlsList; stdcall;

		procedure DoDispose; override;
	public
		constructor create(aiwidth, aiheight: integer; aeAlign: TMC_BindingAlignControl; const asName: string; aiTabOrder: integer);

		property Controls: IMC_BindingControlsList read get_Controls;
	end;

	TMC_BindingGroupControl = class(TMC_BindingPanelControl, IMC_BindingGroupControl)
	private
		fsCaption: wideString;
	protected
		procedure AssignFrom(acSource: IMC_Assignable); override;

		function get_caption: wideString; stdcall;
	public
		constructor create(aiwidth, aiheight: integer; aeAlign: TMC_BindingAlignControl; const asName: string; aiTabOrder: integer; const asCaption: wideString);

		property caption: wideString read get_caption;
	end;

	TMC_BindingCheckControl = class(TMC_BindingControl, IMC_BindingCheckControl)
	private
		fsCaption: wideString;
	protected
		procedure AssignFrom(acSource: IMC_Assignable); override;

		function get_caption: wideString; stdcall;
	public
		constructor create(aiwidth, aiheight: integer; aeAlign: TMC_BindingAlignControl; const asName: string; aiTabOrder: integer; const asCaption: wideString);

		property caption: wideString read get_caption;
	end;

	TMC_BindingListValuesControl = class(TMC_BindingControl, IMC_BindingListValuesControl)
	private
		fcValues: IMC_BindingListValuesList;

		procedure freeValues;
	protected
		procedure AssignFrom(acSource: IMC_Assignable); override;
		function get_Values: IMC_BindingListValuesList; stdcall;

		procedure DoDispose; override;
	public
		constructor create(aiwidth, aiheight: integer; aeAlign: TMC_BindingAlignControl; const asName: string; aiTabOrder: integer);

		property values: IMC_BindingListValuesList read get_Values;
	end;

	TMC_BindingComboBoxControl = class(TMC_BindingListValuesControl, IMC_BindingComboBoxControl)
	private
		fcCaption: IMC_BindingCaption;
		procedure freeCaption;
	protected
		procedure AssignFrom(acSource: IMC_Assignable); override;

		function get_caption: IMC_BindingCaption; stdcall;

		procedure DoDispose; override;
	public
		constructor create(aiwidth, aiheight: integer; aeAlign: TMC_BindingAlignControl; const asName: string; aiTabOrder: integer; acCaption: IMC_BindingCaption);

		property caption: IMC_BindingCaption read get_caption;
	end;

	TMC_BindingRadioControl = class(TMC_BindingListValuesControl, IMC_BindingRadioControl)
	private
		fsCaption: wideString;
		fiColumns: integer;
	protected
		procedure AssignFrom(acSource: IMC_Assignable); override;

		function get_Columns: integer; stdcall;
		function get_caption: wideString; stdcall;
	public
		constructor create(aiwidth, aiheight: integer; aeAlign: TMC_BindingAlignControl; const asName: string; aiTabOrder: integer; const asCaption: wideString;
			aiColumns: integer);

		property columns: integer read get_Columns;
		property caption: wideString read get_caption;
	end;

	TMC_BindingSpinControl = class(TMC_BindingControl, IMC_BindingSpinControl)
	private
		fiMinValue: integer;
		fiMaxValue: integer;
		fiIncrementValue: integer;
		fcCaption: IMC_BindingCaption;

		procedure freeCaption;
	protected
		procedure AssignFrom(acSource: IMC_Assignable); override;

		function get_MinValue: integer; stdcall;
		function get_MaxValue: integer; stdcall;
		function get_IncrementValue: integer; stdcall;
		function get_caption: IMC_BindingCaption; stdcall;

		procedure DoDispose; override;
	public
		constructor create(aiwidth, aiheight: integer; aeAlign: TMC_BindingAlignControl; const asName: string;
			aiTabOrder, aiMinValue, aiMaxValue, aiIncrementValue: integer; acCaption: IMC_BindingCaption);

		property minValue: integer read get_MinValue;
		property MaxValue: integer read get_MaxValue;
		property IncrementValue: integer read get_IncrementValue;
		property caption: IMC_BindingCaption read get_caption;
	end;

	TMC_BindingTrackBarControl = class(TMC_BindingSpinControl, IMC_BindingTrackBarControl)
	private
		feTickStyle: TMC_BindingTickStyle;
		fiFactor: integer;
		fcFactorCaption: IMC_BindingCaption;

		procedure freeFactorCaption;
	protected
		procedure AssignFrom(acSource: IMC_Assignable); override;

		function get_TickStyle: TMC_BindingTickStyle; stdcall;
		function get_factorValue: integer; stdcall;
		function get_FactorCaption: IMC_BindingCaption; stdcall;

		procedure DoDispose; override;
	public
		constructor create(aiwidth, aiheight: integer; aeAlign: TMC_BindingAlignControl; const asName: string;
			aiTabOrder, aiMinValue, aiMaxValue, aiIncrementValue: integer; acCaption: IMC_BindingCaption; aeTickStyle: TMC_BindingTickStyle; aiFactor: integer;
			acFactorCaption: IMC_BindingCaption);

		property tickStyle: TMC_BindingTickStyle read get_TickStyle;
		property FactorValue: integer read get_factorValue;
		property factorCaption: IMC_BindingCaption read get_FactorCaption;
	end;

	TMC_BindingEditControl = class(TMC_BindingControl, IMC_BindingEditControl)
	private
		fsMask: wideString;
		feEditType: TMC_BindingEditType;
		fcCaption: IMC_BindingCaption;

		procedure freeCaption;
	protected
		procedure AssignFrom(acSource: IMC_Assignable); override;

		function get_Mask: wideString; stdcall;
		function get_EditType: TMC_BindingEditType; stdcall;
		function get_caption: IMC_BindingCaption; stdcall;

		procedure DoDispose; override;
	public
		constructor create(aiwidth, aiheight: integer; aeAlign: TMC_BindingAlignControl; const asName: string; aiTabOrder: integer; const asMask: wideString;
			aeEditType: TMC_BindingEditType; acCaption: IMC_BindingCaption);

		property Mask: wideString read get_Mask;
		property editType: TMC_BindingEditType read get_EditType;
		property caption: IMC_BindingCaption read get_caption;
	end;

	TMC_BindingPageControl = class(TMC_BindingGroupControl, IMC_BindingPageControl)
	end;

	TMC_BindingPagesList = class(TMC_VersionedListBase, IMC_BindingPagesList)
	private
	private
		procedure freeList;
	protected
		procedure AssignFrom(acSource: IMC_Assignable); override;
		function get_Count: integer; stdcall;
		procedure set_Changed(abChanged: boolean); stdcall;
		function get_Changed: boolean; stdcall;
		function add(acItem: IMC_BindingPageControl): integer; stdcall;
		function get(aiIndex: integer): IMC_BindingPageControl; stdcall;
		procedure put(aiIndex: integer; acItem: IMC_BindingPageControl); stdcall;
		procedure clear(); stdcall;
		procedure delete(aiIndex: integer); stdcall;
		function first(): IMC_BindingPageControl; stdcall;
		function indexOf(acItem: IMC_BindingPageControl): integer; stdcall;
		procedure insert(aiIndex: integer; acItem: IMC_BindingPageControl); stdcall;
		function last(): IMC_BindingPageControl; stdcall;
		procedure remove(acItem: IMC_BindingPageControl); stdcall;
		function search(const asName: wideString): IMC_BindingControl; stdcall;
	public
		procedure dispose; override;

		property Items[aiIndex: integer]: IMC_BindingPageControl read get write put; default;
		property count: integer read get_Count;
		property Changed: boolean read get_Changed write set_Changed;
	end;

	TMC_BindingPagesContainerControl = class(TMC_BindingControl, IMC_BindingPagesContainerControl)
	private
		fcPages: IMC_BindingPagesList;
		procedure freeValues;
	protected
		function get_Pages: IMC_BindingPagesList; stdcall;
		procedure DoDispose; override;
	public
		property pages: IMC_BindingPagesList read get_Pages;
	end;

	TMC_BindingHandler = class(TNexoVersionedObjectBase, IMC_BindingHandler, IMC_BindingHandlerEvents)
	private
		fsCaption: wideString;
		fcControls: IMC_BindingControlsList;
		fcEvents: IMC_BindingHandlerEvents;
		fcFormEvents: IMC_BindingVisualEnabled;
		fbAdvancedSetup: boolean;
		fcCallback: IMC_PluginCallback;

		procedure freeControls;
	protected
		procedure manageUICallback(aeType: TMC_UICallbackType; const asMessage: wideString);
		procedure doAddLog(aeSeverity: TMC_LogSeverity; const asMessage: wideString);
		function doManageLog(aeSeverity: TMC_LogSeverity): TMC_CallbackResult;
		function ManageMC_Callback(const asCommand: wideString; out zsAnswer: wideString; out zcError: IMC_Error): TMC_CallbackResult; reintroduce;

		procedure AssignFrom(acSource: IMC_Assignable); override;

		function getValue(const asToken, asConnectString: wideString; const asDefaultValue: wideString = ''): wideString;

		function get_caption: wideString; stdcall;
		function get_Controls: IMC_BindingControlsList; stdcall;
		procedure set_OnFormEvents(acFormEvents: IMC_BindingVisualEnabled); stdcall;
		function get_OnFormEvents: IMC_BindingVisualEnabled; stdcall;
		procedure set_HandlerEvents(acHandlerEvents: IMC_BindingHandlerEvents); stdcall;
		function get_HandlerEvents: IMC_BindingHandlerEvents; stdcall;

		procedure SetControlValue(const asParamName, asConnectString: wideString; const asDefaultValue: wideString = '');
		function GetControlValue(const asControlName: wideString): wideString;

		procedure doOnLoad(const asConnectString: wideString); virtual;
		function doOnValidating(out zcErr: IMC_Error): boolean; virtual;
		function doOnValidated: wideString; virtual;
		function doOnClosing: boolean; virtual;
		procedure doOnClosed; virtual;
		procedure doOnHelp; virtual;

		procedure DoDispose; override;
	public
		constructor create(const asCaption: wideString; abAdvancedSetup: boolean; acCallback: IMC_PluginCallback); reintroduce;

		procedure OnLoad(const asConnectString: wideString); stdcall;
		function onValidating(out zcErr: IMC_Error): boolean; stdcall;
		function onValidated: wideString; stdcall;
		function onClosing: boolean; stdcall;
		procedure onClosed; stdcall;
		procedure onHelp; stdcall;

		property caption: wideString read get_caption;
		property Controls: IMC_BindingControlsList read get_Controls;
		property onFormEvents: IMC_BindingVisualEnabled read get_OnFormEvents write set_OnFormEvents;
		property HandlerEvents: IMC_BindingHandlerEvents read get_HandlerEvents write set_HandlerEvents;
	end;

implementation

uses
	sysutils, Math, MC_UICallbackParamsIn, classes, activeX, NEXOLib;

// TMC_BindingPositionableControl
constructor TMC_BindingPositionableControl.create(aiwidth, aiheight: integer; aeAlign: TMC_BindingAlignControl);
begin
	inherited create('');

	fiwidth := aiwidth;
	fiheight := aiheight;
	feAlign := aeAlign;
end;

procedure TMC_BindingPositionableControl.AssignFrom(acSource: IMC_Assignable);
var
	lcSource: IMC_BindingPositionableControl;
begin
	if acSource.QueryInterface(IMC_BindingPositionableControl, lcSource) = S_OK
	then begin
		inherited;
		fiwidth := lcSource.width;
		fiheight := lcSource.height;
		feAlign := lcSource.Align;
	end
	else assignError;
end;

function TMC_BindingPositionableControl.get_Width: integer;
begin
	result := fiwidth;
end;

function TMC_BindingPositionableControl.get_Height: integer;
begin
	result := fiheight;
end;

function TMC_BindingPositionableControl.get_Align: TMC_BindingAlignControl;
begin
	result := feAlign;
end;

// TMC_BindingControl
constructor TMC_BindingControl.create(aiwidth, aiheight: integer; aeAlign: TMC_BindingAlignControl; const asName: string; aiTabOrder: integer);
var
	liTabOrder: integer;
begin
	inherited create(aiwidth, aiheight, aeAlign);

	fsName := asName;
	liTabOrder := aiTabOrder;
	if liTabOrder < -1
	then liTabOrder := high(TTabOrder);
	fiTabOrder := liTabOrder;
end;

procedure TMC_BindingControl.DoDispose;
begin
	if assigned(fcVisualChanges)
	then begin
		fcVisualChanges.dispose;
		fcVisualChanges := nil;
	end;
	if assigned(fcControlEvents)
	then begin
		fcControlEvents.dispose;
		fcControlEvents := nil;
	end;

	inherited;
end;

procedure TMC_BindingControl.AssignFrom(acSource: IMC_Assignable);
var
	lcSource: IMC_BindingControl;
begin
	if acSource.QueryInterface(IMC_BindingControl, lcSource) = S_OK
	then begin
		inherited;
		fsName := lcSource.Name;
		fiTabOrder := lcSource.TabOrder;
		VisualChangesHandler := lcSource.VisualChangesHandler;
		onControlEvents := lcSource.onControlEvents;
		Changed := lcSource.Changed;
	end
	else assignError;
end;

function TMC_BindingControl.get_Name: wideString;
begin
	result := fsName;
end;

function TMC_BindingControl.get_TabOrder: integer;
begin
	result := fiTabOrder;
end;

procedure TMC_BindingControl.set_Changed(abChanged: boolean);
var
	lcPanel: IMC_BindingPanelControl;
begin
	fbChanged := abChanged;
	if (not abChanged) and (QueryInterface(IMC_BindingPanelControl, lcPanel) = S_OK)
	then lcPanel.Controls.Changed := abChanged;
end;

function TMC_BindingControl.get_Changed: boolean;
var
	lcPanel: IMC_BindingPanelControl;
begin
	result := fbChanged;
	if (not result) and (QueryInterface(IMC_BindingPanelControl, lcPanel) = S_OK)
	then result := lcPanel.Controls.Changed;
end;

procedure TMC_BindingControl.set_OnControlEvents(acControlEvents: IMC_BindingControlEvents);
begin
	fcControlEvents := acControlEvents;
end;

function TMC_BindingControl.get_OnControlEvents: IMC_BindingControlEvents;
begin
	result := fcControlEvents;
end;

procedure TMC_BindingControl.set_VisualChangeshandler(acVisualChangeshandler: IMC_BindingVisualHandler);
begin
	fcVisualChanges := acVisualChangeshandler;
end;

function TMC_BindingControl.get_VisualChangeshandler: IMC_BindingVisualHandler;
begin
	result := fcVisualChanges;
end;

// TMC_BindingControlsList
procedure TMC_BindingControlsList.dispose;
begin
	freeList;

	inherited;
end;

procedure TMC_BindingControlsList.freeList;
var
	lcCtrl: IMC_BindingControl;
begin
	while count > 0 do begin
		lcCtrl := Items[0];
		delete(0);
		lcCtrl.dispose;
		lcCtrl := nil;
	end;
end;

procedure TMC_BindingControlsList.AssignFrom(acSource: IMC_Assignable);
var
	lcCtrl, lcItem: IMC_BindingControl;
	liIdx: integer;
	lcSource: IMC_BindingControlsList;
begin
	clear;
	if acSource.QueryInterface(IMC_BindingControlsList, lcSource) = S_OK
	then begin
		for liIdx := 0 to lcSource.count - 1 do begin
			lcItem := lcSource[liIdx];
			lcCtrl := TMC_BindingControl.create(lcItem.width, lcItem.height, lcItem.Align, lcItem.Name, lcItem.TabOrder);
			add(lcCtrl);
		end;
	end
	else assignError;
end;

function TMC_BindingControlsList.Get_Item(aiIndex: integer): IMC_BindingControl;
begin
	result := (inherited Items[aiIndex] as IMC_BindingControl);
end;

function TMC_BindingControlsList.get_Count: integer;
begin
	result := inherited getCount;
end;

procedure TMC_BindingControlsList.Set_Item(aiIndex: integer; acItem: IMC_BindingControl);
begin
	inherited Items[aiIndex] := acItem;
end;

function TMC_BindingControlsList.add(acItem: IMC_BindingControl): integer;
begin
	result := inherited add(acItem);
end;

procedure TMC_BindingControlsList.remove(acItem: IMC_BindingControl);
begin
	inherited remove(acItem);
end;

function TMC_BindingControlsList.get(aiIndex: integer): IMC_BindingControl;
begin
	result := (inherited get(aiIndex) as IMC_BindingControl);
end;

procedure TMC_BindingControlsList.put(aiIndex: integer; acItem: IMC_BindingControl);
begin
	inherited put(aiIndex, acItem);
end;

procedure TMC_BindingControlsList.clear();
begin
	freeList;
	inherited clear;
end;

procedure TMC_BindingControlsList.delete(aiIndex: integer);
begin
	inherited delete(aiIndex);
end;

function TMC_BindingControlsList.first(): IMC_BindingControl;
begin
	result := (inherited first) as IMC_BindingControl;
end;

function TMC_BindingControlsList.last(): IMC_BindingControl;
begin
	result := (inherited last) as IMC_BindingControl;
end;

function TMC_BindingControlsList.indexOf(acItem: IMC_BindingControl): integer;
begin
	result := inherited indexOf(acItem);
end;

procedure TMC_BindingControlsList.insert(aiIndex: integer; acItem: IMC_BindingControl);
begin
	inherited insert(aiIndex, acItem);
end;

procedure TMC_BindingControlsList.set_Changed(abChanged: boolean);
var
	liIdx: integer;
begin
	for liIdx := 0 to count - 1 do Items[liIdx].Changed := abChanged;
end;

function TMC_BindingControlsList.get_Changed: boolean;
var
	liIdx: integer;
begin
	result := FALSE;
	for liIdx := 0 to count - 1 do begin
		result := Items[liIdx].Changed;
		if result
		then break;
	end;
end;

function TMC_BindingControlsList.search(const asName: wideString): IMC_BindingControl;
var
	liIdx: integer;
	lcPanel: IMC_BindingPanelControl;
	lcPages: IMC_BindingPagesContainerControl;
	lcPage: IMC_BindingPageControl;
begin
	result := nil;
	for liIdx := 0 to count - 1 do begin
		if sameText(asName, Items[liIdx].Name)
		then result := Items[liIdx]
		else begin
			if Items[liIdx].QueryInterface(IMC_BindingPanelControl, lcPanel) = S_OK
			then result := lcPanel.Controls.search(asName)
			else
				if Items[liIdx].QueryInterface(IMC_BindingPagesContainerControl, lcPages) = S_OK
				then result := lcPages.pages.search(asName)
				else
					if Items[liIdx].QueryInterface(IMC_BindingPageControl, lcPage) = S_OK
					then result := lcPage.Controls.search(asName);
		end;
		if assigned(result)
		then break;
	end;
end;

// TMC_BindingCaption
constructor TMC_BindingCaption.create(aiwidth, aiheight: integer; aeAlign: TMC_BindingAlignControl; const asCaption: wideString);
begin
	inherited create(aiwidth, aiheight, aeAlign);

	fsCaption := asCaption;
end;

procedure TMC_BindingCaption.AssignFrom(acSource: IMC_Assignable);
var
	lcSource: IMC_BindingCaption;
begin
	if acSource.QueryInterface(IMC_BindingCaption, lcSource) = S_OK
	then begin
		inherited;
		fsCaption := lcSource.caption;
	end
	else assignError;
end;

function TMC_BindingCaption.get_caption: wideString;
begin
	result := fsCaption;
end;

// TMC_BindingListValue
constructor TMC_BindingListValue.create(const asValue, asItem: wideString);
begin
	inherited create('');

	fsValue := asValue;
	fsItem := asItem;
end;

procedure TMC_BindingListValue.AssignFrom(acSource: IMC_Assignable);
var
	lcSource: IMC_BindingListValue;
begin
	if acSource.QueryInterface(IMC_BindingListValue, lcSource) = S_OK
	then begin
		inherited;
		fsValue := lcSource.value;
		fsItem := lcSource.Item;
	end
	else assignError;
end;

function TMC_BindingListValue.get_Value: wideString;
begin
	result := fsValue;
end;

function TMC_BindingListValue.Get_Item: wideString;
begin
	result := fsItem;
end;

// TMC_BindingListValuesList
constructor TMC_BindingListValuesList.create(acValueListParent: IMC_BindingListValuesControl);
begin
	inherited create;

	fcValueListParent := acValueListParent;
end;

procedure TMC_BindingListValuesList.dispose;
begin
	fcValueListParent := nil;
	freeList;

	inherited;
end;

procedure TMC_BindingListValuesList.freeList;
var
	lcValue: IMC_BindingListValue;
begin
	while count > 0 do begin
		lcValue := Items[0];
		delete(0);

		lcValue.dispose;
		lcValue := nil;
	end;
end;

procedure TMC_BindingListValuesList.AssignFrom(acSource: IMC_Assignable);
var
	lcInfo, lcItem: IMC_BindingListValue;
	liIdx: integer;
	lcSource: IMC_BindingListValuesList;
begin
	clear;
	if acSource.QueryInterface(IMC_BindingListValuesList, lcSource) = S_OK
	then begin
		fcValueListParent := lcSource.valueListParent;
		beginUpdate;
		try
			for liIdx := 0 to lcSource.count - 1 do begin
				lcItem := lcSource[liIdx];
				lcInfo := TMC_BindingListValue.create(lcItem.value, lcItem.Item);
				add(lcInfo);
			end;
		finally
			endUpdate;
		end;
	end
	else assignError;
end;

procedure TMC_BindingListValuesList.doEndUpdate;
var
	lcListHandler: IMC_BindingListVisualHandler;
begin
	if (assigned(fcValueListParent)) and (assigned(fcValueListParent.VisualChangesHandler)) and
		(fcValueListParent.VisualChangesHandler.QueryInterface(IMC_BindingListVisualHandler, lcListHandler) = S_OK)
	then lcListHandler.UpdateVisualList;
end;

function TMC_BindingListValuesList.get_ValuesListParent: IMC_BindingListValuesControl;
begin
	result := fcValueListParent;
end;

function TMC_BindingListValuesList.Get_Item(aiIndex: integer): IMC_BindingListValue;
begin
	result := (inherited Items[aiIndex] as IMC_BindingListValue);
end;

function TMC_BindingListValuesList.get_Count: integer;
begin
	result := inherited getCount;
end;

procedure TMC_BindingListValuesList.Set_Item(aiIndex: integer; acItem: IMC_BindingListValue);
begin
	inherited Items[aiIndex] := acItem;
	if not InUpdateMode
	then doEndUpdate;
end;

function TMC_BindingListValuesList.add(acItem: IMC_BindingListValue): integer;
begin
	result := inherited add(acItem);
	if not InUpdateMode
	then doEndUpdate;
end;

procedure TMC_BindingListValuesList.remove(acItem: IMC_BindingListValue);
begin
	inherited remove(acItem);
	if not InUpdateMode
	then doEndUpdate;
end;

function TMC_BindingListValuesList.get(aiIndex: integer): IMC_BindingListValue;
begin
	result := (inherited get(aiIndex) as IMC_BindingListValue);
end;

procedure TMC_BindingListValuesList.put(aiIndex: integer; acItem: IMC_BindingListValue);
begin
	inherited put(aiIndex, acItem);
	if not InUpdateMode
	then doEndUpdate;
end;

procedure TMC_BindingListValuesList.clear();
begin
	freeList;
	inherited clear;
	if not InUpdateMode
	then doEndUpdate;
end;

procedure TMC_BindingListValuesList.delete(aiIndex: integer);
begin
	inherited delete(aiIndex);
	if not InUpdateMode
	then doEndUpdate;
end;

function TMC_BindingListValuesList.first(): IMC_BindingListValue;
begin
	result := (inherited first) as IMC_BindingListValue;
end;

function TMC_BindingListValuesList.last(): IMC_BindingListValue;
begin
	result := (inherited last) as IMC_BindingListValue;
end;

function TMC_BindingListValuesList.indexOf(acItem: IMC_BindingListValue): integer;
begin
	result := inherited indexOf(acItem);
end;

procedure TMC_BindingListValuesList.insert(aiIndex: integer; acItem: IMC_BindingListValue);
begin
	inherited insert(aiIndex, acItem);
	if not InUpdateMode
	then doEndUpdate;
end;

// TMC_BindingPanelControl
constructor TMC_BindingPanelControl.create(aiwidth, aiheight: integer; aeAlign: TMC_BindingAlignControl; const asName: string; aiTabOrder: integer);
begin
	inherited create(aiwidth, aiheight, aeAlign, asName, aiTabOrder);

	freeControls;
end;

procedure TMC_BindingPanelControl.DoDispose;
begin
	freeControls;

	inherited;
end;

procedure TMC_BindingPanelControl.freeControls;
begin
	if assigned(fcControls)
	then fcControls.dispose;

	fcControls := nil;
end;

procedure TMC_BindingPanelControl.AssignFrom(acSource: IMC_Assignable);
var
	lcSource: IMC_BindingPanelControl;
begin
	if acSource.QueryInterface(IMC_BindingPanelControl, lcSource) = S_OK
	then begin
		inherited;
		freeControls;
		Controls.assign(lcSource.Controls);
	end
	else assignError;
end;

function TMC_BindingPanelControl.get_Controls: IMC_BindingControlsList;
begin
	if not assigned(fcControls)
	then fcControls := TMC_BindingControlsList.create;

	result := fcControls;
end;

// TMC_BindingGroupControl
constructor TMC_BindingGroupControl.create(aiwidth, aiheight: integer; aeAlign: TMC_BindingAlignControl; const asName: string; aiTabOrder: integer;
	const asCaption: wideString);
begin
	inherited create(aiwidth, aiheight, aeAlign, asName, aiTabOrder);

	fsCaption := asCaption;
end;

procedure TMC_BindingGroupControl.AssignFrom(acSource: IMC_Assignable);
var
	lcSource: IMC_BindingGroupControl;
begin
	if acSource.QueryInterface(IMC_BindingGroupControl, lcSource) = S_OK
	then begin
		inherited;
		fsCaption := lcSource.caption;
	end
	else assignError;
end;

function TMC_BindingGroupControl.get_caption: wideString;
begin
	result := fsCaption;
end;

// TMC_BindingCheckControl
constructor TMC_BindingCheckControl.create(aiwidth, aiheight: integer; aeAlign: TMC_BindingAlignControl; const asName: string; aiTabOrder: integer;
	const asCaption: wideString);
begin
	inherited create(aiwidth, aiheight, aeAlign, asName, aiTabOrder);

	fsCaption := asCaption;
end;

procedure TMC_BindingCheckControl.AssignFrom(acSource: IMC_Assignable);
var
	lcSource: IMC_BindingCheckControl;
begin
	if acSource.QueryInterface(IMC_BindingCheckControl, lcSource) = S_OK
	then begin
		inherited;
		fsCaption := lcSource.caption;
	end
	else assignError;
end;

function TMC_BindingCheckControl.get_caption: wideString;
begin
	result := fsCaption;
end;

// TMC_BindingListValuesControl
constructor TMC_BindingListValuesControl.create(aiwidth, aiheight: integer; aeAlign: TMC_BindingAlignControl; const asName: string; aiTabOrder: integer);
begin
	inherited create(aiwidth, aiheight, aeAlign, asName, aiTabOrder);

	freeValues;
end;

procedure TMC_BindingListValuesControl.DoDispose;
begin
	freeValues;

	inherited;
end;

procedure TMC_BindingListValuesControl.freeValues;
begin
	if assigned(fcValues)
	then fcValues.dispose;

	fcValues := nil;
end;

procedure TMC_BindingListValuesControl.AssignFrom(acSource: IMC_Assignable);
var
	lcSource: IMC_BindingListValuesControl;
begin
	if acSource.QueryInterface(IMC_BindingListValuesControl, lcSource) = S_OK
	then begin
		inherited;
		freeValues;
		fcValues.assign(lcSource.values);
	end
	else assignError;
end;

function TMC_BindingListValuesControl.get_Values: IMC_BindingListValuesList;
begin
	if not assigned(fcValues)
	then fcValues := TMC_BindingListValuesList.create(self);

	result := fcValues;
end;

// TMC_BindingComboBoxControl
constructor TMC_BindingComboBoxControl.create(aiwidth, aiheight: integer; aeAlign: TMC_BindingAlignControl; const asName: string; aiTabOrder: integer;
	acCaption: IMC_BindingCaption);
begin
	inherited create(aiwidth, aiheight, aeAlign, asName, aiTabOrder);

	fcCaption := TMC_BindingCaption.create(acCaption.width, acCaption.height, acCaption.Align, acCaption.caption);
end;

procedure TMC_BindingComboBoxControl.DoDispose;
begin
	freeCaption;

	inherited;
end;

procedure TMC_BindingComboBoxControl.freeCaption;
begin
	if assigned(fcCaption)
	then fcCaption.dispose;

	fcCaption := nil;
end;

procedure TMC_BindingComboBoxControl.AssignFrom(acSource: IMC_Assignable);
var
	lcSource: IMC_BindingComboBoxControl;
begin
	if acSource.QueryInterface(IMC_BindingComboBoxControl, lcSource) = S_OK
	then begin
		inherited;
		freeCaption;
		fcCaption := TMC_BindingCaption.create(lcSource.caption.width, lcSource.caption.height, lcSource.caption.Align, lcSource.caption.caption);
	end
	else assignError;
end;

function TMC_BindingComboBoxControl.get_caption: IMC_BindingCaption;
begin
	result := fcCaption;
end;

// TMC_BindingRadioControl
constructor TMC_BindingRadioControl.create(aiwidth, aiheight: integer; aeAlign: TMC_BindingAlignControl; const asName: string; aiTabOrder: integer;
	const asCaption: wideString; aiColumns: integer);
begin
	inherited create(aiwidth, aiheight, aeAlign, asName, aiTabOrder);

	fsCaption := asCaption;
	fiColumns := aiColumns;
end;

procedure TMC_BindingRadioControl.AssignFrom(acSource: IMC_Assignable);
var
	lcSource: IMC_BindingRadioControl;
begin
	if acSource.QueryInterface(IMC_BindingRadioControl, lcSource) = S_OK
	then begin
		inherited;
		fsCaption := lcSource.caption;
		fiColumns := lcSource.columns;
	end
	else assignError;
end;

function TMC_BindingRadioControl.get_Columns: integer;
begin
	result := fiColumns;
end;

function TMC_BindingRadioControl.get_caption: wideString;
begin
	result := fsCaption;
end;

// TMC_BindingSpinControl
constructor TMC_BindingSpinControl.create(aiwidth, aiheight: integer; aeAlign: TMC_BindingAlignControl; const asName: string;
	aiTabOrder, aiMinValue, aiMaxValue, aiIncrementValue: integer; acCaption: IMC_BindingCaption);
begin
	inherited create(aiwidth, aiheight, aeAlign, asName, aiTabOrder);

	fiMinValue := aiMinValue;
	fiMaxValue := aiMaxValue;
	fiIncrementValue := aiIncrementValue;
	freeCaption;
	fcCaption := TMC_BindingCaption.create(acCaption.width, acCaption.height, acCaption.Align, acCaption.caption);
end;

procedure TMC_BindingSpinControl.DoDispose;
begin
	freeCaption;

	inherited;
end;

procedure TMC_BindingSpinControl.freeCaption;
begin
	if assigned(fcCaption)
	then fcCaption.dispose;

	fcCaption := nil;
end;

procedure TMC_BindingSpinControl.AssignFrom(acSource: IMC_Assignable);
var
	lcSource: IMC_BindingSpinControl;
begin
	if acSource.QueryInterface(IMC_BindingSpinControl, lcSource) = S_OK
	then begin
		inherited;
		fiMinValue := lcSource.minValue;
		fiMaxValue := lcSource.MaxValue;
		fiIncrementValue := lcSource.IncrementValue;
		freeCaption;
		fcCaption := TMC_BindingCaption.create(lcSource.caption.width, lcSource.caption.height, lcSource.caption.Align, lcSource.caption.caption);
	end
	else assignError;
end;

function TMC_BindingSpinControl.get_MinValue: integer; stdcall;
begin
	result := fiMinValue;
end;

function TMC_BindingSpinControl.get_MaxValue: integer; stdcall;
begin
	result := fiMaxValue;
end;

function TMC_BindingSpinControl.get_IncrementValue: integer; stdcall;
begin
	result := fiIncrementValue;
end;

function TMC_BindingSpinControl.get_caption: IMC_BindingCaption;
begin
	result := fcCaption;
end;

// TMC_BindingTrackBarControl
constructor TMC_BindingTrackBarControl.create(aiwidth, aiheight: integer; aeAlign: TMC_BindingAlignControl; const asName: string;
	aiTabOrder, aiMinValue, aiMaxValue, aiIncrementValue: integer; acCaption: IMC_BindingCaption; aeTickStyle: TMC_BindingTickStyle; aiFactor: integer;
	acFactorCaption: IMC_BindingCaption);
begin
	inherited create(aiwidth, aiheight, aeAlign, asName, aiTabOrder, aiMinValue, aiMaxValue, aiIncrementValue, acCaption);

	feTickStyle := aeTickStyle;
	fiFactor := aiFactor;
	freeFactorCaption;
	fcFactorCaption := TMC_BindingCaption.create(acFactorCaption.width, acFactorCaption.height, acFactorCaption.Align, acFactorCaption.caption);
end;

procedure TMC_BindingTrackBarControl.DoDispose;
begin
	freeFactorCaption;

	inherited;
end;

procedure TMC_BindingTrackBarControl.freeFactorCaption;
begin
	if assigned(fcFactorCaption)
	then fcFactorCaption.dispose;

	fcFactorCaption := nil;
end;

procedure TMC_BindingTrackBarControl.AssignFrom(acSource: IMC_Assignable);
var
	lcSource: IMC_BindingTrackBarControl;
begin
	if acSource.QueryInterface(IMC_BindingTrackBarControl, lcSource) = S_OK
	then begin
		inherited;
		feTickStyle := lcSource.tickStyle;
		fiFactor := lcSource.FactorValue;
		fiIncrementValue := lcSource.IncrementValue;
		freeFactorCaption;
		fcFactorCaption := TMC_BindingCaption.create(lcSource.factorCaption.width, lcSource.factorCaption.height, lcSource.factorCaption.Align,
			lcSource.factorCaption.caption);
	end
	else assignError;
end;

function TMC_BindingTrackBarControl.get_TickStyle: TMC_BindingTickStyle;
begin
	result := feTickStyle;
end;

function TMC_BindingTrackBarControl.get_factorValue: integer;
begin
	result := fiFactor;
end;

function TMC_BindingTrackBarControl.get_FactorCaption: IMC_BindingCaption;
begin
	result := fcFactorCaption;
end;

// TMC_BindingEditControl
constructor TMC_BindingEditControl.create(aiwidth, aiheight: integer; aeAlign: TMC_BindingAlignControl; const asName: string; aiTabOrder: integer;
	const asMask: wideString; aeEditType: TMC_BindingEditType; acCaption: IMC_BindingCaption);
begin
	inherited create(aiwidth, aiheight, aeAlign, asName, aiTabOrder);

	fsMask := asMask;
	feEditType := aeEditType;
	freeCaption;
	fcCaption := TMC_BindingCaption.create(acCaption.width, acCaption.height, acCaption.Align, acCaption.caption);
end;

procedure TMC_BindingEditControl.DoDispose;
begin
	freeCaption;

	inherited;
end;

procedure TMC_BindingEditControl.freeCaption;
begin
	if assigned(fcCaption)
	then fcCaption.dispose;

	fcCaption := nil;
end;

procedure TMC_BindingEditControl.AssignFrom(acSource: IMC_Assignable);
var
	lcSource: IMC_BindingEditControl;
begin
	if acSource.QueryInterface(IMC_BindingEditControl, lcSource) = S_OK
	then begin
		inherited;
		fsMask := lcSource.Mask;
		feEditType := lcSource.editType;
		freeCaption;
		fcCaption := TMC_BindingCaption.create(lcSource.caption.width, lcSource.caption.height, lcSource.caption.Align, lcSource.caption.caption);
	end
	else assignError;
end;

function TMC_BindingEditControl.get_Mask: wideString;
begin
	result := fsMask;
end;

function TMC_BindingEditControl.get_EditType: TMC_BindingEditType;
begin
	result := feEditType;
end;

function TMC_BindingEditControl.get_caption: IMC_BindingCaption;
begin
	result := fcCaption;
end;

// TMC_BindingHandler
constructor TMC_BindingHandler.create(const asCaption: wideString; abAdvancedSetup: boolean; acCallback: IMC_PluginCallback);
begin
	inherited create('');

	fsCaption := asCaption;
	fbAdvancedSetup := abAdvancedSetup;
	fcCallback := acCallback;
	fcControls := nil;
	fcEvents := self;
	fcFormEvents := nil;
	freeControls;
end;

procedure TMC_BindingHandler.DoDispose;
begin
	fcEvents := nil;
	fcCallback := nil;
	freeControls;

	inherited;
end;

procedure TMC_BindingHandler.freeControls;
begin
	if assigned(fcControls)
	then fcControls.dispose;

	fcControls := nil;
end;

procedure TMC_BindingHandler.AssignFrom(acSource: IMC_Assignable);
var
	lcSource: IMC_BindingHandler;
begin
	if acSource.QueryInterface(IMC_BindingHandler, lcSource) = S_OK
	then begin
		inherited;
		fsCaption := lcSource.caption;
		HandlerEvents := lcSource.HandlerEvents;
		onFormEvents := lcSource.onFormEvents;
		freeControls;
		Controls.assign(lcSource.Controls);
	end
	else assignError;
end;

function TMC_BindingHandler.get_caption: wideString;
begin
	result := fsCaption;
end;

function TMC_BindingHandler.get_Controls: IMC_BindingControlsList;
begin
	if not assigned(fcControls)
	then fcControls := TMC_BindingControlsList.create;

	result := fcControls;
end;

procedure TMC_BindingHandler.set_OnFormEvents(acFormEvents: IMC_BindingVisualEnabled);
begin
	fcFormEvents := acFormEvents;
end;

function TMC_BindingHandler.get_OnFormEvents: IMC_BindingVisualEnabled;
begin
	result := fcFormEvents;
end;

procedure TMC_BindingHandler.set_HandlerEvents(acHandlerEvents: IMC_BindingHandlerEvents);
begin
	fcEvents := acHandlerEvents;
end;

function TMC_BindingHandler.get_HandlerEvents: IMC_BindingHandlerEvents;
begin
	result := fcEvents;
end;

function TMC_BindingHandler.getValue(const asToken, asConnectString, asDefaultValue: wideString): wideString;
var
	liPosIdx, liPosSemi: integer;
	lsToken, lsConnectString: wideString;
begin
	result := asDefaultValue;
	if (length(asToken) > 0) and (length(asConnectString) > 0)
	then begin
		lsToken := ';' + asToken + '=';
		lsConnectString := ';' + asConnectString + ';';
		liPosIdx := pos(lsToken, lsConnectString);
		if liPosIdx > 0
		then begin
			liPosSemi := pos(';', copy(lsConnectString, liPosIdx + length(lsToken), length(lsConnectString)));
			if liPosSemi > 0
			then begin
				result := copy(lsConnectString, liPosIdx + length(lsToken), liPosSemi - 1);
			end;
		end;
	end;
end;

procedure TMC_BindingHandler.manageUICallback(aeType: TMC_UICallbackType; const asMessage: wideString);
var
	lcParamsOut: IMC_UICallbackResult;
begin
	if assigned(fcCallback)
	then
		// there you need to send a reference to your EFT driver, but I don't know how (and where) it's better to instantiate it
		// |
		// V
			fcCallback.onMC_UICallback(nil, aeType, TMC_UICallbackPIMessage.create(asMessage, -1), lcParamsOut);
end;

procedure TMC_BindingHandler.doAddLog(aeSeverity: TMC_LogSeverity; const asMessage: wideString);
begin
	if assigned(fcCallback)
	then fcCallback.onAddLog(aeSeverity, 'ED_EFT', className + asMessage);
end;

function TMC_BindingHandler.doManageLog(aeSeverity: TMC_LogSeverity): TMC_CallbackResult;
begin
	result := cbrNoAnswer;

	if assigned(fcCallback)
	then result := fcCallback.manageLog(aeSeverity);
end;

function TMC_BindingHandler.ManageMC_Callback(const asCommand: wideString; out zsAnswer: wideString; out zcError: IMC_Error): TMC_CallbackResult;
var
	lcInput: TStream;
	lcAnswer: IStream;
	lsError: wideString;
begin
	if doManageLog(lsVerbose) = cbrOk
	then doAddLog(lsVerbose, '(TMC_BindingHandler).manageMC_CallBack entrée : asCommand="' + asCommand + '"');

	result := cbrNoAnswer;
	lcInput := wideStringtoStream(asCommand);
	try
		try
			if assigned(fcCallback)
			then result := fcCallback.onMC_Callback(nil, dtApplication, -1, TStreamAdapter.create(lcInput, soReference) as IStream, lcAnswer, zcError);
			if result = cbrOk
			then begin
				if assigned(lcAnswer)
				then zsAnswer := wideStringfromStream(lcAnswer);
			end
			else
				if assigned(zcError)
				then result := cbrError;
		finally
			lcInput.free;
		end;
	except
		on E: Exception do begin
			lsError := 'An unexpected error was produced :' + Format(' lsCommand="%s"', [asCommand]); // Ne pas localiser
			manageUICallback(ctError, lsError);
			if not assigned(zcError)
			then zcError := TMC_Error.create(1, lsError, 0);
			result := cbrError;
		end;
	end;

	if doManageLog(lsVerbose) = cbrOk
	then doAddLog(lsVerbose, '(TMC_BindingHandler).manageMC_CallBack sortie : result="' + inttostr(ord(result)) + '"');
end;

procedure TMC_BindingHandler.SetControlValue(const asParamName, asConnectString, asDefaultValue: wideString);
var
	lsValue: wideString;
	lcCtrl: IMC_BindingControl;
begin
	lsValue := getValue(asParamName, asConnectString, asDefaultValue);

	lcCtrl := Controls.search(asParamName);
	if assigned(lcCtrl)
	then begin
		if assigned(lcCtrl.VisualChangesHandler)
		then lcCtrl.VisualChangesHandler.value := lsValue;
	end
	else manageUICallback(ctError, Format('Control %s not found!', [asParamName]))
end;

function TMC_BindingHandler.GetControlValue(const asControlName: wideString): wideString;
var
	lcCtrl: IMC_BindingControl;
begin
	result := '';

	lcCtrl := Controls.search(asControlName);
	if assigned(lcCtrl)
	then begin
		if assigned(lcCtrl.VisualChangesHandler)
		then begin
			result := asControlName + '=' + lcCtrl.VisualChangesHandler.value + ';';
		end;
	end;
end;

procedure TMC_BindingHandler.doOnLoad(const asConnectString: wideString);
begin
end;

function TMC_BindingHandler.doOnValidating(out zcErr: IMC_Error): boolean;
begin
	result := TRUE;
end;

function TMC_BindingHandler.doOnValidated: wideString;
begin
	result := '';
end;

function TMC_BindingHandler.doOnClosing: boolean;
begin
	result := TRUE; // There you can check if a modification has made and It has not been saved
end;

procedure TMC_BindingHandler.doOnClosed;
begin
	// Nothing to do ...
end;

procedure TMC_BindingHandler.doOnHelp;
begin
	// Nothing to do ...
end;

procedure TMC_BindingHandler.OnLoad(const asConnectString: wideString);
begin
	doOnLoad(asConnectString);
end;

function TMC_BindingHandler.onValidating(out zcErr: IMC_Error): boolean;
begin
	result := doOnValidating(zcErr);
end;

function TMC_BindingHandler.onValidated: wideString;
begin
	result := doOnValidated;
end;

function TMC_BindingHandler.onClosing: boolean;
begin
	result := doOnClosing;
end;

procedure TMC_BindingHandler.onClosed;
begin
	doOnClosed;
end;

procedure TMC_BindingHandler.onHelp;
begin
	doOnHelp;
end;

{ TMC_BindingPagesContainerControl }

procedure TMC_BindingPagesContainerControl.DoDispose;
begin
	freeValues;

	inherited;
end;

procedure TMC_BindingPagesContainerControl.freeValues;
begin
	if assigned(fcPages)
	then fcPages.dispose;

	fcPages := nil;
end;

function TMC_BindingPagesContainerControl.get_Pages: IMC_BindingPagesList;
begin
	if not assigned(fcPages)
	then fcPages := TMC_BindingPagesList.create();

	result := fcPages;
end;

{ TMC_BindingPagesList }

function TMC_BindingPagesList.add(acItem: IMC_BindingPageControl): integer;
begin
	result := inherited add(acItem);
end;

procedure TMC_BindingPagesList.AssignFrom(acSource: IMC_Assignable);
var
	lcItem, lcCtrl: IMC_BindingPageControl;
	liIdx: integer;
	lcSource: IMC_BindingControlsList;
begin
	clear;
	if acSource.QueryInterface(IMC_BindingControlsList, lcSource) = S_OK
	then begin
		for liIdx := 0 to lcSource.count - 1 do begin
			lcItem := lcSource[liIdx] as IMC_BindingPageControl;
			lcCtrl := TMC_BindingPageControl.create(lcItem.width, lcItem.height, lcItem.Align, lcItem.Name, lcItem.TabOrder, lcItem.caption);
			add(lcCtrl);
		end;
	end
	else assignError;
end;

procedure TMC_BindingPagesList.clear;
begin
	freeList;
	inherited clear;
end;

procedure TMC_BindingPagesList.delete(aiIndex: integer);
begin
	inherited delete(aiIndex);
end;

procedure TMC_BindingPagesList.dispose;
begin
	freeList;

	inherited;
end;

function TMC_BindingPagesList.first: IMC_BindingPageControl;
begin
	result := (inherited first) as IMC_BindingPageControl;
end;

procedure TMC_BindingPagesList.freeList;
var
	lcCtrl: IMC_BindingControl;
begin
	while count > 0 do begin
		lcCtrl := Items[0];
		delete(0);
		lcCtrl.dispose;
		lcCtrl := nil;
	end;
end;

function TMC_BindingPagesList.get(aiIndex: integer): IMC_BindingPageControl;
begin
	result := (inherited Items[aiIndex] as IMC_BindingPageControl);
end;

function TMC_BindingPagesList.get_Changed: boolean;
var
	liIdx: integer;
begin
	result := FALSE;
	for liIdx := 0 to count - 1 do begin
		result := Items[liIdx].Changed;
		if result
		then break;
	end;
end;

function TMC_BindingPagesList.get_Count: integer;
begin
	result := inherited getCount;
end;

function TMC_BindingPagesList.indexOf(acItem: IMC_BindingPageControl): integer;
begin
	result := inherited indexOf(acItem);
end;

procedure TMC_BindingPagesList.insert(aiIndex: integer; acItem: IMC_BindingPageControl);
begin
	inherited insert(aiIndex, acItem);
end;

function TMC_BindingPagesList.last: IMC_BindingPageControl;
begin
	result := (inherited last) as IMC_BindingPageControl;
end;

procedure TMC_BindingPagesList.put(aiIndex: integer; acItem: IMC_BindingPageControl); stdcall;
begin
	inherited Items[aiIndex] := acItem;
end;

procedure TMC_BindingPagesList.remove(acItem: IMC_BindingPageControl);
begin
	inherited remove(acItem);
end;

function TMC_BindingPagesList.search(const asName: wideString): IMC_BindingControl;
var
	liIdx: integer;
	lcPanel: IMC_BindingPanelControl;
begin
	result := nil;
	for liIdx := 0 to count - 1 do begin
		if sameText(asName, Items[liIdx].Name)
		then result := Items[liIdx]
		else begin
			if Items[liIdx].QueryInterface(IMC_BindingPanelControl, lcPanel) = S_OK
			then result := lcPanel.Controls.search(asName);
		end;
		if assigned(result)
		then break;
	end;
end;

procedure TMC_BindingPagesList.set_Changed(abChanged: boolean);
var
	liIdx: integer;
begin
	for liIdx := 0 to count - 1 do Items[liIdx].Changed := abChanged;
end;

end.
