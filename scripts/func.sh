# prerequisites {{{
function check {
    if hash "$1" 2>/dev/null; then
        type -P "$1"
    else
        echo >&2 "I require $1 but I did not find it. Aborting."
        exit 1
    fi
}
export -f check

# }}}

# os {{{
function check_os {
    case "$OSTYPE" in
        "darwin"*) os="darwin" ;;
        "linux-gnu") os="linux" ;;
        *)
        read -p "This has not been tested on $OSTYPE. Do you want to stop (y/n)? " -n 1 -r choice
        if [[ $choice =~ ^[Yy]$ ]]; then
            echo >&2 "Aborting."
            exit 1 || return 1
        fi
    esac
    echo
}
# }}}
# gnupg functions {{{
function setup_gnupg {
    chmod 700 gnupg/.gnupg # directory gnupg/.gnupg must have 700 permissions
}

function setup_pinentry {
    if [[ "$os" == "darwin" ]]; then
        pinentry=$(check pinentry-mac)
    else
        pinentry=$(check pinentry)
    fi
    local file=gnupg/.gnupg/gpg-agent
    local lines=()
    while IFS= read -r line; do
        lines+=( "${line//"<placeholder>"/$pinentry}" )
    done < "$file.tmpl"
    printf "%s\n" "${lines[@]}" > "$file.conf"
}
# }}}

