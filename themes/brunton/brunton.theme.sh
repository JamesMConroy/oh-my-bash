#! bash oh-my-bash.module

SCM_THEME_PROMPT_PREFIX=""
SCM_THEME_PROMPT_SUFFIX=""

SCM_THEME_PROMPT_DIRTY=" ${bold_red}✗${normal}"
SCM_THEME_PROMPT_CLEAN=" ${bold_green}✓${normal}"
SCM_GIT_CHAR="${bold_green}±${normal}"
SCM_SVN_CHAR="${bold_cyan}⑆${normal}"
SCM_HG_CHAR="${bold_red}☿${normal}"

is_vim_shell() {
	if [ ! -z "$VIMRUNTIME" ]
	then
		echo "[${cyan}vim shell${normal}]"
	fi
}

scm_prompt() {
	CHAR=$(scm_char)
	if [ $CHAR = $SCM_NONE_CHAR ]
	then
		return
	else
		echo " $(scm_char) (${white}$(scm_prompt_info)${normal})"
	fi
}

_omb_theme_PROMPT_COMMAND() {
  PS1="${white}${background_blue} \u${normal}${background_blue}@${red}${background_blue}\h $(clock_prompt) ${reset_color}${normal} $(battery_charge)\n${bold_black}${background_white} \w ${normal}$(scm_prompt)$(is_vim_shell)\n${white}>${normal} "
}

THEME_CLOCK_COLOR=${THEME_CLOCK_COLOR:-"$blue$background_white"}
THEME_CLOCK_FORMAT=${THEME_CLOCK_FORMAT:-" %H:%M:%S"}

_omb_util_add_prompt_command _omb_theme_PROMPT_COMMAND
