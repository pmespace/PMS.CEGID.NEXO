library PMS.CEGID.NEXO;

{ Remarque importante concernant la gestion de mémoire de DLL : ShareMem doit
 être la première unité de la clause USES de votre bibliothèque ET de votre projet
 (sélectionnez Projet-Voir source) si votre DLL exporte des procédures ou des
 fonctions qui passent des chaînes en tant que paramètres ou résultats de fonction.
 Cela s'applique à toutes les chaînes passées de et vers votre DLL --même celles
 qui sont imbriquées dans des enregistrements et classes. ShareMem est l'unité
 d'interface pour le gestionnaire de mémoire partagée BORLNDMM.DLL, qui doit
 être déployé avec vos DLL. Pour éviter d'utiliser BORLNDMM.DLL, passez les
 informations de chaînes avec des paramètres PChar ou ShortString. }

uses
  SysUtils,
  Classes,
  MC_PluginCATInterface in 'CPOS_Interface\MC_PluginCATInterface.pas',
  MC_PluginInterface in 'CPOS_Interface\MC_PluginInterface.pas',
  NEXO in 'NEXO.pas',
  NEXOCATParamsOut in 'NEXOCATParamsOut.pas',
  NEXOLib in 'NEXOLib.pas',
  NEXOPluginBase in 'NEXOPluginBase.pas',
  NEXOPluginLoader in 'NEXOPluginLoader.pas',
  NEXOTypes in 'NEXOTypes.pas',
  ED_EFTBinding in 'ED_EFTBinding.pas',
  MC_Binding in 'MC_Binding.pas',
  MC_UICallbackParamsIn in 'MC_UICallbackParamsIn.pas',
  PMS_NEXO_TLB in 'COM\PMS_NEXO_TLB.pas',
  PMS_NEXOSale_TLB in 'COM\PMS_NEXOSale_TLB.pas',
  Accessibility_TLB in 'COM\Accessibility_TLB.pas',
  mscorlib_TLB in 'COM\mscorlib_TLB.pas',
  PMS_Common_TLB in 'COM\PMS_Common_TLB.pas',
  System_TLB in 'COM\System_TLB.pas',
  System_Windows_Forms_TLB in 'COM\System_Windows_Forms_TLB.pas';

// DLL exports

function getPluginLoader(out zcErr: IMC_Error): IMC_PluginLoader; stdcall;
begin
	result := nil;
	try
		result := TNexoPluginLoader.create('');
	except
		on e: Exception do zcErr := TMC_Error.create(-1, e.message, 0);
	end;
end;

exports
	getPluginLoader;

end.
