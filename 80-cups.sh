AddPackage cups # The CUPS Printing System - daemon package
AddPackage cups-pdf # PDF printer for cups

AddPackage --foreign brother-hl2270dw # Brother HL-2270DW CUPS Driver

CopyFile /etc/cups/classes.conf 600
CopyFile /etc/cups/ppd/Brother_HL-2270DW_series.ppd 640 '' cups
CopyFile /etc/cups/printers.conf 600

SystemdEnable cups /usr/lib/systemd/system/cups.path
SystemdEnable cups /usr/lib/systemd/system/cups.service
SystemdEnable cups /usr/lib/systemd/system/cups.socket