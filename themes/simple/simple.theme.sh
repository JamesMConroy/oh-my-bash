#! bash oh-my-bash.module

# prompt themeing

#added TITLEBAR for updating the tab and window titles with the pwd
case $TERM in
	xterm*)
	TITLEBAR="\[\033]0;\w\007\]"
	;;
	*)
	TITLEBAR=""
	;;
esac

function _omb_theme_PROMPT_COMMAND() {
	PS1="${TITLEBAR}${orange}${reset_color}${green}\w${bold_blue}\[\$(scm_prompt_info)\]${normal} "
}

# scm themeing
SCM_THEME_PROMPT_DIRTY=" ✗"
SCM_THEME_PROMPT_CLEAN=" ✓"
SCM_THEME_PROMPT_PREFIX="("
SCM_THEME_PROMPT_SUFFIX=")"

_omb_util_add_prompt_command _omb_theme_PROMPT_COMMAND
