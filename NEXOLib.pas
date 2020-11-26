unit NEXOLib;

interface

uses
	ActiveX, classes, windows, PMS_NEXOSale_TLB, MC_PluginCatInterface, System.DateUtils;

function BooltoStr_(abValue: boolean): wideString;
function valeuri(const asValeur: wideString): integer;
procedure CopyFromIStream(
	acIStream: IStream;
	acStream: TStream);
function wideStringfromStream(acIStream: IStream): wideString; overload;
function wideStringfromStream(acStream: TStream): wideString; overload;
function wideStringtoStream(const asText: wideString): TStream;
function WideReadToken(
	var St: wideString;
	const Sep: wideString = ';'): wideString;
function WideExtractValue(
	St: wideString;
	const Name: wideString;
	const Sep: wideString = ';'): wideString;
function WideStartsText(const ASubText, AText: string): boolean;
function StringtoStream(const asText: string): TStream;
function encodeBase64Data(const asData: wideString): wideString;
function decodeBase64Data(const asEncodedData: wideString): wideString;
function ReadVersionInfo(
	const sProgram: string;
	Major, Minor, Release, Build: pWord): boolean;
function GetVersion(
	const FileName: string;
	var v: array of word): boolean;

function GetErrorDescription(error: integer): wideString;
procedure InitialiseSettings(myNexo: NEXOSale);
function DisplaySettings(
	myNexo: NEXOSale;
	fFullSettings: boolean): boolean;
function TrueFalseValue(f: boolean): integer;
function CreateNexoDateTime(acParamsIn: IMC_CATParamsIn): wideString;
function IsString(
	v: string;
	default: string): string;
function ToBoolean(w: wordbool): boolean;

const
	DRIVER_NO_ERROR                            = 0;
	DRIVER_ERROR_INVALID_COMMAND               = 1;
	DRIVER_ERROR_INVALID_TRANSACTION           = 2;
	DRIVER_ERROR_REQUIRED_PARAMSIN_MISSING     = 3;
	DRIVER_ERROR_CURRENCY_DOES_NOT_MATCH       = 4;
	DRIVER_ERROR_CURRENCY_IS_MISSING           = 5;
	DRIVER_ERROR_COMMAND_NOT_SUPPORTED         = 6;
	DRIVER_ERROR_TRANSACTION_DECLINED          = 7;
	DRIVER_ERROR_TRANSACTION_CANCELLED_BY_USER = 8;
	DRIVER_ERROR_TRANSACTION_UNKNOWN_ERROR     = 9;
	DRIVER_ERROR_TRANSACTION_TIMEOUT           = 10;
	DRIVER_ERROR_EXCEPTION                     = 11;

implementation

uses
	AXCtrls, SysUtils, NEXOTypes, Dialogs, UITypes;

function TrueFalseValue(f: boolean): integer;
begin
	if f then
		result := -1
	else
		result := 0;
end;

function CreateNexoDateTime(acParamsIn: IMC_CATParamsIn): wideString;
var
	dt: TDateTime;
begin
	// prepare the date time
	dt := EncodeDateTime(
		StrToInt(Copy(acParamsIn.Transac.date, 5, 4)),
		StrToInt(Copy(acParamsIn.Transac.date, 3, 2)),
		StrToInt(Copy(acParamsIn.Transac.date, 1, 2)),
		StrToInt(Copy(acParamsIn.Transac.hour, 1, 2)),
		StrToInt(Copy(acParamsIn.Transac.hour, 3, 2)),
		StrToInt(Copy(acParamsIn.Transac.hour, 5, 2)),
		0);

	// convert in UTC format
	result := DateToISO8601(
		dt,
		false);
end;

function GetErrorDescription(error: integer): wideString;
begin
	case error of
		DRIVER_NO_ERROR: result := 'No error';
		DRIVER_ERROR_INVALID_COMMAND: result := 'Invalid command';
		DRIVER_ERROR_INVALID_TRANSACTION: result := 'Invalid transaction';
		DRIVER_ERROR_REQUIRED_PARAMSIN_MISSING: result := 'Required input parameters are missing';
		DRIVER_ERROR_CURRENCY_DOES_NOT_MATCH: result := 'Currency does not match';
		DRIVER_ERROR_CURRENCY_IS_MISSING: result := 'Currency is missing';
		DRIVER_ERROR_COMMAND_NOT_SUPPORTED: result := 'Command not supported';
		DRIVER_ERROR_TRANSACTION_DECLINED: result := 'TRANSACTION DECLINED';
		DRIVER_ERROR_TRANSACTION_CANCELLED_BY_USER: result := 'Operation cancelled by user';
		DRIVER_ERROR_TRANSACTION_UNKNOWN_ERROR: result := 'Unknown error';
		DRIVER_ERROR_TRANSACTION_TIMEOUT: result := 'Timeout';
		DRIVER_ERROR_EXCEPTION: result := 'An exception has occurred';
	end;
end;

procedure InitialiseSettings(myNexo: NEXOSale);
begin
	// non modifiable settings

	// {$IFDEF DEBUG}
	//
	// myNexo.URL := myNexo.URLToString(enumURL_staging);
	//
	// {$ELSE}
	//
	// myNexo.URL := myNexo.URLToString(enumURL_live);
	//
	// {$ENDIF}

end;

function DisplaySettings(
	myNexo: NEXOSale;
	fFullSettings: boolean): boolean;
begin
	// call settings to set
	myNexo.DisplaySettings(fFullSettings);
	result := true;
end;

function BooltoStr_(abValue: boolean): wideString;
begin
	result := CEGID_STRING_FALSE;
	if abValue then
		result := CEGID_STRING_TRUE;
end;

function valeuri(const asValeur: wideString): integer;

var
	liValue, liCode: integer;
begin
	result := 0;
	Val(
		asValeur,
		liValue,
		liCode);
	if liCode = 0 then
		result := liValue;
end;

procedure CopyFromIStream(
	acIStream: IStream;
	acStream: TStream);
var
	lcAdapter: TOLEStream;
begin
	lcAdapter := TOLEStream.Create(acIStream);
	try
		lcAdapter.position := 0;
		acStream.position := 0;
		acStream.copyFrom(
			lcAdapter,
			lcAdapter.Size);
		acStream.position := 0;
		lcAdapter.position := 0;
	finally
		lcAdapter.free;
	end;
end;

function wideStringfromStream(acIStream: IStream): wideString;
var
	lcStream: TMemoryStream;
begin
	lcStream := TMemoryStream.Create;
	try
		CopyFromIStream(
			acIStream,
			lcStream);
		result := wideStringfromStream(lcStream);
	finally
		lcStream.free;
	end;
end;

function wideStringfromStream(acStream: TStream): wideString;
var
	liLen: integer;
	lsText: string;
begin
	result := '';
	if assigned(acStream) then
	begin
		acStream.position := 0;
		if (acStream.Size mod 2) = 1 then
		begin
			setLength(
				lsText,
				acStream.Size);
			acStream.read(
				pointer(lsText)^,
				acStream.Size);
			lsText := lsText + ' ';
			acStream.position := 0;
			acStream.write(
				pointer(lsText)^,
				length(lsText));
			acStream.position := 0;
		end;
		liLen := acStream.Size;
		setLength(
			result,
			(liLen div 2));
		acStream.read(
			pointer(result)^,
			liLen);
	end;
end;

function wideStringtoStream(const asText: wideString): TStream;
var
	liLen: integer;
begin
	result := TMemoryStream.Create;
	liLen := length(asText);
	if liLen > 0 then
	begin
		result.position := 0;
		result.write(
			pointer(asText)^,
			liLen * 2);
	end;
	result.position := 0;
end;

function StringtoStream(const asText: string): TStream;
var
	liLen: integer;
begin
	result := TMemoryStream.Create;
	liLen := length(asText);
	if liLen > 0 then
	begin
		result.position := 0;
		result.write(
			pointer(asText)^,
			liLen);
	end;
	result.position := 0;
end;

function internalEncodeBase64(
	PlainBuf: PBYTE;
	PlainSize: DWORD): wideString;
var
	pi, pie: PBYTE;
	po: PWideChar;
	x: integer;

const
	kBase64Table: array [0 .. 63] of WideChar = ('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V',
		'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '0',
		'1', '2', '3', '4', '5', '6', '7', '8', '9', '+', '/');
begin
	setLength(
		result,
		PlainSize * 2); // InputSize * 2);
	pi := PlainBuf;
	pie := pi;
	Inc(
		pie,
		PlainSize);
	po := PWideChar(result);

	while Cardinal(pi) < Cardinal(pie) do // bufferIndex < PlainSize do
	begin
		x := (pi^ shr 2) and $3F;
		po^ := kBase64Table[x];
		Inc(po);
		if Cardinal(pi) = Cardinal(pie) - 1 then // bufferIndex = PlainSize) then
		begin
			x := (pi^ shl 4) and $30;
			po^ := kBase64Table[x];
			Inc(po);
			break;
		end;
		x := (pi^ shl 4) and $30;

		Inc(pi);
		x := x + (pi^ shr 4) and $0F;
		po^ := kBase64Table[x];
		Inc(po);
		if Cardinal(pi) = Cardinal(pie) - 1 then // bufferIndex = PlainSize) then
		begin
			x := (pi^ shl 2) and $3C;
			po^ := kBase64Table[x];
			Inc(po);
			break;
		end;
		x := (pi^ shl 2) and $3C;

		Inc(pi);
		x := x + (ord(pi^) shr 6) and $03;

		po^ := kBase64Table[x];
		Inc(po);
		x := pi^ and $3F;
		po^ := kBase64Table[x];
		Inc(po);

		Inc(pi);
	end;

	if ((PlainSize mod 3) <> 0) then // complete last block
	begin
		x := 3 - (PlainSize mod 3);
		while x > 0 do
		begin
			po^ := '=';
			Inc(po);
			dec(x);
		end;
	end;

	setLength(
		result,
		po - PBYTE(result));
end;

function encodeBase64Data(const asData: wideString): wideString;

var
	lpData: pointer;
	liLen: Cardinal;
begin
	result := '';
	liLen := length(asData) * 2;
	if liLen > 0 then
	begin
		getMem(
			lpData,
			liLen);
		try
			ZeroMemory(
				lpData,
				liLen);
			CopyMemory(
				lpData,
				PWideChar(asData),
				liLen);
			result := internalEncodeBase64(
				lpData,
				liLen);
		finally
			freeMem(lpData);
		end;
	end;
end;

function internalDecodeBase64(
	CodeText: wideString;
	var PlainSize: DWORD): PBYTE;

const
	kBase64String: wideString = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/';

	function DecodeBase64Quartet(
		Buffer: PWideChar;
		BufSize: DWORD;
		pOutByte: PBYTE;
		out NumDone: integer): integer;

	var
		curBuffer, endBuffer: PWideChar;
		abyte: array [0 .. 3] of Byte;
		i, ip: integer;
	begin
		curBuffer := Buffer;
		endBuffer := Buffer + BufSize;
		NumDone := 0;
		i := 0;

		while (i < 4) do
		begin
			if curBuffer = endBuffer then
				break;

			ip := pos(curBuffer^, kBase64String) - 1;
			Inc(curBuffer);
			if (ip < 0) then // must be at eof
			begin
				if ((i = 1) or ((i = 2) and (((curBuffer - 1)^ <> '=') or (curBuffer^ <> '='))) or ((i = 3) and ((curBuffer - 1)^ <> '='))) then
					NumDone := 5;
				// Used as error condition
				break;
			end
			else
				abyte[i] := ip; // chr (ip);
			Inc(i);
		end;

		if (NumDone <> 5) then
		begin
			if (i > 1) then
			begin
				pOutByte^ := (ord(abyte[0]) shl 2) + (ord(abyte[1]) shr 4);
				NumDone := 1;
				if (i > 2) then
				begin
					PBYTE(Cardinal(pOutByte) + 1)^ := ((ord(abyte[1]) and $0F) shl 4) + (ord(abyte[2]) shr 2);
					NumDone := 2;
					if (i = 4) then
					begin
						PBYTE(Cardinal(pOutByte) + 2)^ := ((ord(abyte[2]) and $03) shl 6) + ord(abyte[3]);
						NumDone := 3;
					end;
				end;
			end;
		end;
		result := curBuffer - Buffer;
	end;

var
	InputBuffer: PWideChar;
	InputSize, InputDone, NumDone: integer;
	OutputBuffer, OutputPointer: PBYTE;
begin
	InputBuffer := PWideChar(CodeText);
	InputSize := length(CodeText);

	getMem(
		result,
		InputSize);
	OutputBuffer := PBYTE(result);
	OutputPointer := OutputBuffer;
	InputDone := 0;

	repeat
	begin
		Inc(
			InputDone,
			DecodeBase64Quartet(InputBuffer + InputDone, InputSize - InputDone, OutputPointer, NumDone));
		Inc(
			OutputPointer,
			NumDone);
	end
	until (NumDone <> 3);

	if NumDone = 5 then
	begin
		PlainSize := 0;
		freeMem(result);
		result := nil;
	end
	else
	begin
		PlainSize := Cardinal(OutputPointer) - Cardinal(OutputBuffer);
		ReallocMem(
			result,
			PlainSize); // will be fast, downsizing...
	end;
end;

function decodeBase64Data(const asEncodedData: wideString): wideString;

var
	lpData: pointer;
	liLen: Cardinal;
begin
	lpData := internalDecodeBase64(
		asEncodedData,
		liLen);
	try
		setLength(
			result,
			liLen div 2);
		ZeroMemory(
			PWideChar(result),
			liLen div 2);
		CopyMemory(
			PWideChar(result),
			lpData,
			liLen);
	finally
		freeMem(lpData);
	end;
end;

function ReadVersionInfo(
	const sProgram: string;
	Major, Minor, Release, Build: pWord): boolean;

var
	Info: PVSFixedFileInfo;
	InfoSize: Cardinal;
	nHwnd: DWORD;
	BufferSize: DWORD;
	Buffer: pointer;
begin
	BufferSize := GetFileVersionInfoSize(
		pchar(sProgram),
		nHwnd);
	{ Get buffer size }

	result := true;

	if BufferSize <> 0 then
	begin { if zero, there is no version info }
		getMem(
			Buffer,
			BufferSize); { allocate buffer memory }
		try
			if GetFileVersionInfo(pchar(sProgram), nHwnd, BufferSize, Buffer) then
			begin
				{ got version info }
				if VerQueryValue(Buffer, '\', pointer(Info), InfoSize) then
				begin { got root block version information }
					if assigned(Major) then
						Major^ := HiWord(Info^.dwFileVersionMS); { extract major version }
					if assigned(Minor) then
						Minor^ := LoWord(Info^.dwFileVersionMS); { extract minor version }
					if assigned(Release) then
						Release^ := HiWord(Info^.dwFileVersionLS); { extract release version }
					if assigned(Build) then
						Build^ := LoWord(Info^.dwFileVersionLS); { extract build version }
				end
				else
					result := false; { no root block version info }
			end
			else
				result := false; { couldn't extract version info }

		finally
			freeMem(
				Buffer,
				BufferSize); { release buffer memory }
		end;
	end
	else
		result := false; { no version info at all in the file }
end;

function GetVersion(
	const FileName: string;
	var v: array of word): boolean;

var
	dwZero, dwLen, dwBytes: DWORD;
	lpData, lpBuffer: pointer;
	pv: PVSFixedFileInfo;
	ok: longbool;
	i: integer;
	St: string;
begin
	pv := nil;
	i := low(v);
	if (high(v) >= i + 3) then
	begin
		v[i] := 0;
		v[i + 1] := 0;
		v[i + 2] := 0;
		v[i + 3] := 0;
		lpBuffer := nil;
		dwBytes := 0;
		dwLen := GetFileVersionInfoSize(
			pchar(FileName),
			dwZero);
		if (dwLen > 0) then
		begin
			getMem(
				lpData,
				dwLen);
			// pointer to buffer to receive file-version info.
			ok := GetFileVersionInfo(
				pchar(FileName),
				0,
				dwLen,
				lpData);
			if (ok) then
			begin
				St := '\';
				ok := VerQueryValue(
					lpData,
					pchar(St),
					lpBuffer,
					dwBytes);
				if (ok) then
				begin
					pv := PVSFixedFileInfo(lpBuffer);
					v[i] := (pv.dwFileVersionMS shr 16) and $FFFF;
					v[i + 1] := (pv.dwFileVersionMS and $FFFF);
					v[i + 2] := (pv.dwFileVersionLS shr 16) and $FFFF;
					v[i + 3] := (pv.dwFileVersionLS and $FFFF);
				end;
			end;
			freeMem(lpData);
		end;
	end;
	result := (pv <> nil);
end;

function WideReadToken(
	var St: wideString;
	const Sep: wideString): wideString;

var
	liPosSep: integer;
begin
	liPosSep := pos(
		Sep,
		St);
	if (liPosSep > 0) then
	begin
		result := Copy(
			St,
			1,
			liPosSep - 1);
		Delete(
			St,
			1,
			liPosSep + length(Sep) - 1);
	end
	else
	begin
		result := St;
		St := '';
	end;
end;

function WideExtractValue(
	St: wideString;
	const Name: wideString;
	const Sep: wideString): wideString;

var
	s, s1: wideString;
begin
	result := '';

	while (St <> '') do
	begin
		s := WideReadToken(
			St,
			Sep);
		if (s <> '') then
		begin
			s1 := WideReadToken(
				s,
				'=');
			if (WideSameText(s1, name)) then
			begin
				result := s;
				break;
			end;
		end;
	end;
end;

function WideStartsText(const ASubText, AText: string): boolean;
begin
	result := WideSameText(
		Copy(AText, 1, length(ASubText)),
		ASubText);
end;

function IsString(
	v: string;
	default: string): string;
begin
	if ('' = v) then
	begin
		if ('' = default) then
			result := ''
		else
			result := default;
	end
	else
		result := v;
end;

function ToBoolean(w: wordbool): boolean;
begin
	if (false = w) then
		result := false
	else
		result := true;
end;

end.
