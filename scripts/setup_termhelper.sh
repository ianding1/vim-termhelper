_termhelper_abspath() {
    if [[ "$1" = /* ]] ; then
        echo "$1"
    else
        echo "$(pwd)/$1"
    fi
}

_termhelper_json_escape() {
    echo $1
}

_termhelper_send() {
    local json_start="\e]51;"
    local json_end="\x07"
    echo "${json_start}[\"call\",\"Tapi_TermHelper\",$1]${json_end}"
}

termhelper_drop () {
    local name=$(_termhelper_abspath $1)
    local arg=$(_termhelper_json_escape "$name")
    _termhelper_send "[\"drop\",\"${arg}\"]"
}

termhelper_new () {
    local name=$(_termhelper_abspath $1)
    local arg=$(_termhelper_json_escape "$name")
    _termhelper_send "[\"new\",\"${arg}\"]"
}

termhelper_vnew () {
    local name=$(_termhelper_abspath $1)
    local arg=$(_termhelper_json_escape "$name")
    _termhelper_send "[\"vnew\",\"${arg}\"]"
}

termhelper_preview () {
    local name=$(_termhelper_abspath $1)
    local arg=$(_termhelper_json_escape "$name")
    _termhelper_send "[\"preview\",\"${arg}\"]"
}

termhelper_other () {
    local name=$(_termhelper_abspath $1)
    local arg=$(_termhelper_json_escape "$name")
    _termhelper_send "[\"other\",\"${arg}\"]"
}

if ((!TERMHELPER_NO_ALIAS)) ; then
    alias other='termhelper_other'
    alias drop='termhelper_drop'
    alias new='termhelper_new'
    alias vnew='termhelper_vnew'
    alias prv='termhelper_preview'
fi
