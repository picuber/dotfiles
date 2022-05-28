#Source: https://github.com/mattmc3/zsh_unplugged

# Parameters:
#   $1: repo name (Format: gituser/plugin)
function plug_clone() {
    if [[ ! ${+1} ]]; then
        return -1
    fi

    if [[ ! -d $ZPLUGINDIR/${1:t} ]]; then
        echo "Cloning $1"
        git clone -q --depth 1 --recursive --shallow-submodules https://github.com/$1 $ZPLUGINDIR/${1:t}
    fi

}

# Parameters:
#   $1: directory to add
function fpath_add() {
    case " $fpath " in
      *" $1 "*) ;; # already there
      *) fpath+="$1";;
    esac
}

# Parameters:
#   $1: repo name (Format: gituser/plugin)
function load_initfiles() {
    local plugin_dir initfile initfiles
    plugin_dir=$ZPLUGINDIR/${1:t}
    initfile=$plugin_dir/${1:t}.plugin.zsh

    if [[ ! -e $initfile ]]; then
        initfiles=($plugin_dir/*.plugin.{z,}sh(N) $plugin_dir/*.{z,}sh{-theme,}(N))
        [[ ${#initfiles[@]} -gt 0 ]] || { echo >&2 "Plugin has no init file '$1'." && return -1 }
        ln -sf "${initfiles[1]}" "$initfile"
    fi

    source $initfile
}


# Parameters:
#   $1: repo name
function plug() {
    if [[ ! ${+1} ]]; then
        return -1
    fi

    plug_clone $1
    fpath_add $ZPLUGINDIR/${1:t}
}

# Parameters:
#   $1: repo name
function pluginit() {
    if [[ ! ${+1} ]]; then
        return -1
    fi

    plug_clone $1
    load_initfiles $1
    fpath_add $ZPLUGINDIR/${1:t}
}

function plug_done() {
    unset -f plug_clone fpath_add load_initfiles plug pluginit plug_done
}
