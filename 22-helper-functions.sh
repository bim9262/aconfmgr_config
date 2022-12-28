AddPackage augeas
AconfNeedProgram augtool augeas n
function aug() { augtool --root="$output_dir/files" "$@" ; }

function set_variable() {
    local variable="$1"
    local separator="$2"
    local value="$3"
    local file="$4"

    sed -ri 's/(^[^#]*'"$variable"'\s*'"$separator"'\s*).*/\1'"$value"'/g' "$file"

}

function GetExistingFile(){
    local file="$1"
    f="$(CreateFile $file)"
    if [ -r "$file" ]; then
        cat "$file" > "$f"
    else
        sudo cat "$file" > "$f"
    fi
    echo "$f"
}

function CopyDirTo() {
    local src_dir="$1"
	local dst_dir="$2"
    local mode="${3:-}"
	local owner="${4:-}"
	local group="${5:-}"
    
    for f in $(find "$config_dir"/files/"$src_dir" -mindepth 1 -printf "%P\n"); do
        echo CopyFileTo "$src_dir"/"$f" "$dst_dir"/"$f" "$mode" "$owner" "$group"
        CopyFileTo "$src_dir"/"$f" "$dst_dir"/"$f" "$mode" "$owner" "$group"
    done
}