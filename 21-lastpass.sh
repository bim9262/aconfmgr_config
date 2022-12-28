AddPackage lastpass-cli # LastPass command line interface tool
AconfNeedProgram lpass lastpass-cli n 

lpass status || lpass login --trust bim9262@gmail.com

# Account names
local lastpass_account_email=bim9262_gmail_linux
local lastpass_account_root=root_linux
local lastpass_account_bmalyn=bmalyn_linux

#Used to send mail
EMAIL=$(lpass show --username $lastpass_account_email)
EMAIL_PASSWORD=$(lpass show --password $lastpass_account_email)

#Used to send mail
local root_salt=$(lpass show --username $lastpass_account_root)
local root_password=$(lpass show --password $lastpass_account_root)
ROOT_HASHED_PASSWORD=$(openssl passwd -6 -salt $root_salt  $root_password)
local bmalyn_salt=$(lpass show --username $lastpass_account_bmalyn)
local bmalyn_password=$(lpass show --password $lastpass_account_bmalyn)
BMALYN_HASHED_PASSWORD=$(openssl passwd -6 -salt $bmalyn_salt  $bmalyn_password)
