AddPackage pass # Stores, retrieves, generates, and synchronizes passwords securely
AconfNeedProgram pass pass n 

# Account names
local lastpass_account_email=bmalyn_linux/bim9262_gmail_linux
local lastpass_account_root=bmalyn_linux/root_linux
local lastpass_account_bmalyn=bmalyn_linux/bmalyn_linux

#Used to send mail
EMAIL=$(pass show $lastpass_account_email | awk '/login/ {print $NF}')
EMAIL_PASSWORD=$(pass show $lastpass_account_email | head -n 1)

#Used to send mail
local root_salt=$(pass show $lastpass_account_root | awk '/salt/ {print $NF}')
local root_password=$(pass show $lastpass_account_root | head -n 1)
ROOT_HASHED_PASSWORD=$(openssl passwd -6 -salt $root_salt  $root_password)
local bmalyn_salt=$(pass show $lastpass_account_bmalyn | awk '/salt/ {print $NF}')
local bmalyn_password=$(pass show $lastpass_account_bmalyn | head -n 1)
BMALYN_HASHED_PASSWORD=$(openssl passwd -6 -salt $bmalyn_salt  $bmalyn_password)
