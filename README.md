# Hackintosh-ASUS-A455LF-Notebook

[![macOS](https://img.shields.io/badge/macOS-Big_Sur_11.6-red)](https://www.apple.com/macos/big-sur/)
[![OpenCore](https://img.shields.io/badge/OpenCore-0.7.7-blue)](https://github.com/acidanthera/OpenCorePkg)
[![Build Status](https://github.com/asepms92/Hackintosh-ASUS-A455LF-Notebook/workflows/CI/badge.svg?branch=master)](https://github.com/asepms92/Hackintosh-ASUS-A455LF-Notebook/actions)

My EFI Folder for ASUS-A455LF-WX039D Series with Clover/OpenCore Legacy or UEFI
 
<img src="/Images/Sept-MacBook-Images.png?raw=true" alt="macOS Big Sur" align="center">
 
### How to Get it?

- Open Terminal with Command: $ `git clone https://github.com/asepms92/Hackintosh-ASUS-A455LF-Notebook.git`
- Or Just [Clone/Download](https://github.com/asepms92/Hackintosh-ASUS-A455LF-Notebook/archive/refs/heads/master.zip) with Specific Folder Only
 
--------------------------------------------------------------------------------------------
 
### Specs :

- [x] <b>BIOS</b>: v302 (2019/06/04) American Megatrends Inc,
- [x] <b>Model Laptop/Notebook</b>: Asus A455LF-WX039D Series
- [x] <b>Processor</b>: Intel Core i5-5200U (4) @ 2.2GHz up to 2.7Ghz Broadwell
- [x] <b>Graphics</b>: Intel HD Graphics 5500 + Nvidia Geforce 930M
- [x] <b>RAM</b>: 8 GB 1600 MHz DDR3L
- [x] <b>HDD</b>: 500GB SATA HDD (GUID Partition Table) will be replaced to SSD
- [x] <b>Audio</b>: Conexant CX20751/2
- [x] <b>Wifi+BT</b>: Qualcomm Atheros QCA9565/AR9565 Wireless Network Adapter + AR3012 (Azurewave Tech)
- [x] <b>Ethernet</b>: Realtek RTL8111GU/8168GU/8411GU PCI Express Gigabit Ethernet
- [x] <b>Others</b>: USB3.0 + USB2.0 ports WebCam, FocalTech TouchPad PS/2, ports HDMI/VGA, Alcor Micro USB Card Reader, etc..

--------------------------------------------------------------------------------------------

### BIOS Configuration

Bios Config | Setting 
:---:| :---:
Security -> Secure Boot | Disabled
Intel Virtualization    | Enabled OK / Disabled if you have issues
VT-d | Disabled / Enabled with boot-args "dart=0"
Graphics Configuration -> DVMT Pre-Allocation | 64M / default 32M but need pre-alloc patches
USB Configuration -> XHCI Pre-Boot Mode | Smart Auto / Enabled
SATA Mode | AHCI
Boot -> Launch CSM | Enabled or Disabled for Resolution Boot OC
 
--------------------------------------------------------------------------------------------
 
### What's Working?

- [x] QE/CI Intel HD Graphics 5500 with VRAM 4000 MB (Cosmetic), Nvidia Geforce 930M (Disable)
- [x] Audio Conexant CX20751/2 with layout-id 21 + Internal Microphone (SSDT-CX207512.aml + Lilu.kext + AppleALC.kext)
- [x] Display brightness PNLF and Fn Keys (DSDT Patch Fix Graphics Broadwell from RehabMan Repo + ASUS DSDT Patches Brightness FN Key + AsusSMC.kext)
- [x] Qualcomm Atheros AR9565 Wifi (HS80211Family.kext)
- [x] LAN Ethernet Realtek RTL8111GU/8168GU/8411GU (RealtekRTL8111.kext)
- [x] Bluetooth AR3012 (Ath3kBT.kext +Ath3kBTInjector.kext)
- [x] FocalTech TouchPad PS/2 (ApplePS2SmartTouchpad.kext)
- [x] Battery Indicator (DSDT RehabMan Battery Laptop Patch for ASUS + SMCBatteryManager.kext)
- [x] WebCam OOB + Card Reader OOB
- [x] USB3.0 Port + Power/Speed (Disable XhciPortLimit + USBPorts.kext/SSDT-EC-UIAC.aml)
- [x] Native Power Management CPU (SSDT.aml combine from [ssdtPRGen.sh](https://github.com/Piker-Alpha/ssdtPRGen.sh) Pike R. Alpha and [ssdt_data](https://github.com/acidanthera/CPUFriend/blob/master/Instructions.md#data-combination) PMheart + CPUFriend.kext + CPUFriendDataProvider.kext)
- [x] Apple Graphics Power Management (Edit Info.plist VirtualSMC.kext) for Macbook Pro 12,1
- [x] HDMI, Etc..
 
--------------------------------------------------------------------------------------------
 
### Not Working?

- Nvidia Geforce 930M (Optimus Tech) not supported by hackintosh
- AirDrop, Handoff, Continuity, Because this chipset and module not supported

--------------------------------------------------------------------------------------------

### Not Tested?
 
--------------------------------------------------------------------------------------------
 
### Notes

1. Don't use my patch [DSDT.aml and SSDT.aml](https://github.com/asepms92/Hackintosh-ASUS-A455LF-Notebook/tree/master/CLOVER/EFI/CLOVER/ACPI/patched) if you have different <b>ACPI Tables/BIOS Version and Model/Freq CPU PM</b>

2. If you get errors from config.plist. You need regenerate serial number for your mac, Use Clover Configurator or [macserial](https://github.com/asepms92/Hackintosh-ASUS-A455LF-Notebook/tree/master/OC/Utilities/macserial) from OC

3. And many more [apps](https://github.com/asepms92/Hackintosh-ASUS-A455LF-Notebook/tree/master/Tools/Apps)
--------------------------------------------------------------------------------------------
 
### Special Thanks and Credits to :

- [Apple](https://www.apple.com)
- [Clover](https://github.com/CloverHackyColor/CloverBootloader)
- [Acidanthera](https://github.com/acidanthera)
- [Rehabman](https://github.com/RehabMan)
- [Mieze](https://github.com/Mieze)
- [Mirone](https://github.com/Mirone)
- [EmlyDinesh](https://github.com/EMlyDinEsHMG)
- [AnV](https://github.com/andyvand)
- [Piker R. Alpha](https://github.com/Piker-Alpha)
- [InsanelyMac](https://www.insanelymac.com)
- [Olarila](http://olarila.com)
- [OSXLatitude](https://osxlatitude.com)
- And Other Developers
