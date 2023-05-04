AddPackage --foreign dma # DragonFly BSD mail transport agent

local smtp_server=smtp.gmail.com

cat >> "$(GetPackageOriginalFile dma /etc/dma/auth.conf)" <<EOF
#
$EMAIL|$smtp_server:$EMAIL_PASSWORD
EOF

cat > "$(CreateFile /etc/dma/dma.conf)" <<EOF
# \$DragonFly: src/etc/dma/dma.conf,v 1.2 2008/02/04 10:11:41 matthias Exp $
#
SMARTHOST $smtp_server
PORT 587
AUTHPATH /etc/dma/auth.conf
SECURETRANSFER
STARTTLS
EOF