# PMS.CEGID.NEXO
Nexo retailer v3.0 implemetation for CEGID Y2 systems

This is a DLL which can be used to install a NEXO Retailer driver inside a CEGID Y2 system.

This DLL requires the following components to be registered as COM components on the PC:
- PMS.COMMON (https://github.com/pmespace/PMS.COMMON)
- PMS.NEXO (https://github.com/pmespace/PMS.NEXO)
- PMS.NEXOSale (https://github.com/pmespace/PMS.NEXOSale)
When compiling them they are registered as COM objects.
To deploy the PMS.CEGID.NEXO driver it is necessary to register these components on the target PC. For that copy ALL dll available in the PMS.NEXOSale release directory (NewtonSoft.Json.dll must be copied) and register the aboce dll using REGASM <PMS.xxx>.
When these dll are registered on the PC the driver can be instantiated inside a Y2 system.

An install project (using InnoSetuo) will soon be added demonstrating how to install the driver on an empty PC.
