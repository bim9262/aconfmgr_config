GetExistingFile /etc/group > /dev/null
GetExistingFile /etc/gshadow > /dev/null
GetExistingFile /etc/passwd > /dev/null
GetExistingFile /etc/shadow > /dev/null

cat <<EOF | aug
set '/files/etc/group/audio/user[1]' brltty
set '/files/etc/group/audio/user[2]' bmalyn
set '/files/etc/group/bmalyn/gid' $BMALYN_GID
set '/files/etc/group/bmalyn/password' x
set '/files/etc/group/docker/user[1]' bmalyn
set '/files/etc/group/docker/user[1]' bmalyn
set '/files/etc/group/realtime/user[1]' bmalyn

set '/files/etc/gshadow/audio/member[1]' brltty
set '/files/etc/gshadow/audio/member[2]' bmalyn
set '/files/etc/gshadow/bmalyn/password' !
set '/files/etc/gshadow/docker/member[1]' bmalyn
set '/files/etc/gshadow/docker/member[1]' bmalyn
set '/files/etc/gshadow/realtime/member[1]' bmalyn

set '/files/etc/passwd/bmalyn/password' x
set '/files/etc/passwd/bmalyn/uid' $BMALYN_UID
set '/files/etc/passwd/bmalyn/gid' $BMALYN_GID
set '/files/etc/passwd/bmalyn/home' $BMALYN_HOME

set '/files/etc/shadow/root/password' "$ROOT_HASHED_PASSWORD"
set '/files/etc/shadow/bmalyn/password' "$BMALYN_HASHED_PASSWORD"

save
EOF
