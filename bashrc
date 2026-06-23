__prompt_command() {
    local last_status=$?

    # --- Blue-Centric Catppuccin Palette ---
    local blue="\[\e[38;2;137;180;250m\]"       # #89B4FA
    local sky="\[\e[38;2;137;220;235m\]"        # #89DCEB
    local lavender="\[\e[38;2;180;190;254m\]"  # #B4BEFE

    local text="\[\e[38;2;205;214;244m\]"       # #CDD6F4
    local subtext="\[\e[38;2;186;194;222m\]"    # #BAC2DE
    local gray="\[\e[38;2;88;91;112m\]"         # #585B70

    local green="\[\e[38;2;166;227;161m\]"      # Success
    local red="\[\e[38;2;243;139;168m\]"        # Error

    local reset="\[\e[0m\]"

    # --- Git Module ---
    local git_segment=""

    if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
        local branch
        branch=$(git branch --show-current 2>/dev/null)

        [[ -z "$branch" ]] && branch="detached"

        if [[ -n "$(git status --porcelain 2>/dev/null)" ]]; then
            git_segment="${gray}  ${lavender}󰘬 ${branch} ${red}●${reset}"
        else
            git_segment="${gray}  ${lavender}󰘬 ${branch} ${sky}✓${reset}"
        fi
    fi

    # --- Prompt Symbol ---
    local prompt_symbol="❯"
    local prompt_color="${blue}"

    if [[ $last_status -ne 0 ]]; then
        prompt_symbol="󰅚"
        prompt_color="${red}"
    fi

    if [[ $EUID -eq 0 ]]; then
        prompt_symbol="#"
        prompt_color="${red}"
    fi

    # --- Layout ---
    PS1="\n"

    PS1+="${gray}╭─"
    PS1+="${blue}󰣇 ${USER}"
    PS1+="${gray}@"
    PS1+="${lavender}${HOSTNAME}"

    PS1+=" ${gray}in "
    PS1+="${sky}󰉋 \w"

    PS1+="${git_segment}"

    PS1+="${reset}\n"

    PS1+="${gray}╰─"
    PS1+="${prompt_color}${prompt_symbol}"
    PS1+=" ${reset}"
}

PROMPT_COMMAND=__prompt_command

fastfetch
