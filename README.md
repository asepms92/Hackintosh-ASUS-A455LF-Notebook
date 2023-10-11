# Hackintosh ASUS A455LF Notebook

[![Build Status](https://github.com/asepms92/Hackintosh-ASUS-A455LF-Notebook/workflows/CI/badge.svg?branch=master)](https://github.com/asepms92/Hackintosh-ASUS-A455LF-Notebook/actions)
[![Brand](https://img.shields.io/badge/A455LF-WX039D-yellow?style=flat&logo=asus)](https://www.asus.com/)
[![macOS](https://img.shields.io/badge/macOS-Monterey_v12.7-red?style=flat&logo=apple)](https://www.apple.com/macos/monterey/)
[![Clover](https://img.shields.io/badge/Clover-r5155-brightgreen?style=flat&logo=icq)](https://github.com/CloverHackyColor/CloverBootloader)
[![OpenCore](https://img.shields.io/badge/OpenCore-v0.9.6-blue?style=flat&logo=okta)](https://github.com/acidanthera/OpenCorePkg)

Running Single/Dual/Triple/Multi-Boot macOS and other OS's on ASUS A455LF-WX039D Series with Clover/OpenCore Legacy or UEFI

<img src="/Images/screenshot0.png?raw=true" alt="Clover Bootloader" align="center">
<img src="/Images/Sept-MacBook-Monterey.png?raw=true" alt="macOS Monterey" align="center">
 
### How to Get it?

 - Open Terminal with Command : $ `git clone https://github.com/asepms92/Hackintosh-ASUS-A455LF-Notebook.git`
 - Or [Download](https://github.com/asepms92/Hackintosh-ASUS-A455LF-Notebook/archive/refs/heads/master.zip) with Specific Folder Only
 - Then copy to EFI Partition USB Installer/HDD/SSD
 
--------------------------------------------------------------------------------------------
 
### Specs :

 - [x] <b>BIOS</b> : v302 (2019/06/04) American Megatrends Inc,
 - [x] <b>Motherboard</b> : X455L
 - [x] <b>Model Laptop/Notebook</b> : Asus A455LF-WX039D Series
 - [x] <b>Processor</b> : Intel Core i5-5200U (4) @ 2.2GHz up to 2.7Ghz Broadwell
 - [x] <b>Graphics</b> : Intel HD Graphics 5500 + Nvidia Geforce 930M
 - [x] <b>RAM</b> : 12 GB 1600 MHz DDR3L (Samsung)
 - [x] <b>SSD</b> : Samsung 870 EVO 500GB (GUID Partition Table) Disk 0
 - [x] <b>HDD</b> : HGST HTS545050A7E680 500GB (GUID Partition Table) with HDD Caddy on Disk 1
 - [x] <b>Audio</b> : Conexant CX20751/2
 - [x] <b>Touchpad</b> : FocalTech PS/2
 - [x] <b>Wifi + BT</b> : ~~Qualcomm Atheros QCA9565/AR9565 Wireless Network Adapter + AR3012 (Azurewave Tech)~~ Replaced by Broadcom BCM4352/BCM94352HMB Wireless Network Adapter + BCM20702A0 (DW 1550)
 - [x] <b>Ethernet</b>: Realtek RTL8111GU/8168GU/8411GU PCI Express Gigabit Ethernet
 - [x] <b>Others</b>: USB3.0 + USB2.0 ports WebCam, ports HDMI/VGA, DVD ROM Matshita, Alcor Micro USB Card Reader, etc.

--------------------------------------------------------------------------------------------

### BIOS Configuration

Bios Config | Setting 
:---:| :---:
Security -> Secure Boot | Disabled
Intel Virtualization    | Enabled OK / Disabled if you have issues
VT-d | Disabled / Enabled OK or boot-args "dart=0" for older Clover
Graphics Configuration -> DVMT Pre-Allocation | 64M / Default 32M (need pre-alloc patches in Device Properties section)
USB Configuration -> XHCI Pre-Boot Mode | Enabled (XHC Only) / Smart Auto (XHC + EHC)
SATA Mode | AHCI
Boot -> Launch CSM | Enabled or Disabled for Resolution Boot OC
 
--------------------------------------------------------------------------------------------
 
### What's Working?

 - [x] QE/CI Intel HD Graphics 5500 with VRAM 4095 MB (Cosmetic), Nvidia Geforce 930M (Disable)
 - [x] Audio Conexant CX20751/2 with layout-id 21 + Internal Microphone (SSDT-CX207512.aml + AppleALC.kext)
 - [x] Display brightness PNLF and Fn Keys (Device PNLF taken from MacBook ACPI dump + ASUS DSDT Patches FN Keys + AsusSMC.kext)
 - [x] ~~Qualcomm Atheros AR9565 Wifi (HS80211Family.kext + AirPortAtheros40.kext)~~ Broadcom BCM4352/BCM94352HMB (AirportBrcmFixup.kext + AirPortBrcmNIC_Injector.kext)
 - [x] LAN Ethernet Realtek RTL8111GU/8168GU/8411GU (RealtekRTL8111.kext)
 - [x] ~~Bluetooth AR3012 (Ath3kBT.kext + Ath3kBTInjector.kext)~~ BCM20702A0 (BrcmFirmwareData.kext + BrcmPatchRAM3.kext)
 - [x] FocalTech TouchPad PS/2 (ApplePS2SmartTouchpad.kext)
 - [x] Battery Indicator (DSDT RehabMan Battery Laptop Patch for ASUS + SMCBatteryManager.kext)
 - [x] Airdrop fully supported to Big Sur (BrcmFirmwareData.kext + BrcmPatchRAM3.kext + BrcmBluetoothInjector.kext)
 - [x] Handoff + Continuity (Set to true "ExtendBTFeatureFlags" Quirks section in config.plist Clover/OC)
 - [x] TRIM support (Set to true "ThirdPartyDrives" Quirks section in config.plist Clover/OC)
 - [x] USB2.0 Ports + USB3.0 Ports + Power/Speed (Disable XhciPortLimit + USBMap.kext/SSDT-UIAC.aml)
 - [x] Native Power Management CPU (Combination from [ssdtPRGen.sh](https://github.com/Piker-Alpha/ssdtPRGen.sh) Pike R. Alpha and [ssdt_data](https://github.com/acidanthera/CPUFriend/blob/master/Instructions.md#data-combination) PMheart + CPUFriend.kext + CPUFriendDataProvider.kext)
 - [x] WebCam OOB
 - [x] HDMI, Etc.
 
--------------------------------------------------------------------------------------------
 
### Not Working?

 - Nvidia Geforce 930M (Optimus Tech) not supported by hackintosh.

--------------------------------------------------------------------------------------------

### Bugs?

 - Airdrop from Hackintosh to iPhone doesn't work, but iPhone to Hackintosh work, because  Apple has been actively working on the Bluetooth stack (bluetoothd) in macOS Monterey, see [issues](https://github.com/acidanthera/bugtracker/issues/1821).
 - This laptop just have single antenna connector, lol. For pairing bluetooth in chipset DW1550 need dual antenna connectors, so maybe work sometimes not work.

--------------------------------------------------------------------------------------------

### Not Tested?
 
 - Sidecar
 - Universal Control
 
--------------------------------------------------------------------------------------------
 
### Notes

1. Don't use my patch [DSDT.aml & SSDT.aml](https://github.com/asepms92/Hackintosh-ASUS-A455LF-Notebook/tree/master/CLOVER/EFI/CLOVER/ACPI/patched) if you have different <b>ACPI Tables / BIOS Version & Model / Freq CPU PM</b>.
2. Don't install Monterey if you have chipset Atheros, because Apple fully dropped for Atheros on Monterey.
3. I haven't idea for battery, when rename method battery and landing to [SSDT-BATT.aml](https://github.com/asepms92/Hackintosh-ASUS-A455LF-Notebook/tree/master/OC/EFI/OC/ACPI), the indicator only show to 1%.
4. Config OC for Catalina and older, set (MinDate = -1) & (MinVersion = -1) in 'UEFI' -> 'APFS' section, and take from [release page](https://github.com/asepms92/Hackintosh-ASUS-A455LF-Notebook/releases/download/v0.0.1/OpenCore_v0.7.7.zip).

<img src="/Images/set-config-oc-for-catalina-and-older.png?raw=true" alt="Set config OC Catalina and older" align="center">

5. For 10.11-11 you need BrcmBluetoothInjector.kext, for 12 (Monterey) you need BluetoolFixup.kext, choose one and not both.
6. You need regenerate serial number for your mac, use [Clover](https://mackie100projects.altervista.org/download-clover-configurator/)[/OC](https://mackie100projects.altervista.org/download-opencore-configurator/) Configurator or [macserial](https://github.com/asepms92/Hackintosh-ASUS-A455LF-Notebook/tree/master/OC/Utilities/macserial) from OC.
7. And many more [apps](https://github.com/asepms92/Hackintosh-ASUS-A455LF-Notebook/tree/master/Tools/Apps).

--------------------------------------------------------------------------------------------
 
### Special Thanks and Credits to :

- [Apple](https://www.apple.com)
- [Clover](https://github.com/CloverHackyColor)
- [Acidanthera](https://github.com/acidanthera)
- [Rehabman](https://github.com/RehabMan)
- [Mieze](https://github.com/Mieze)
- [EmlyDinesh](https://github.com/EMlyDinEsHMG)
- [AnV](https://github.com/andyvand)
- [Pike R. Alpha](https://github.com/Piker-Alpha)
- [InsanelyMac](https://www.insanelymac.com)
- [Olarila](http://olarila.com)
- [OSXLatitude](https://osxlatitude.com)
- And Other Developers
