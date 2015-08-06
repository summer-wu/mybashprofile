# Copy and self modified from ys.zsh-theme, the one of default themes in master repository
# Clean, simple, compatible and meaningful.
# Tested on Linux, Unix and Windows under ANSI colors.
# It is recommended to use with a dark background and the font Inconsolata.
# Colors: black, red, green, yellow, *blue, magenta, cyan, and white.
# http://xiaofan.at
# 2 Jul 2015 - Xiaofan

# Machine name.
function box_name {
    [ -f ~/.box-name ] && cat ~/.box-name || echo $HOST
}

# Directory info.
local current_dir='${PWD/#$HOME/~}'

# VCS
YS_VCS_PROMPT_PREFIX1="%{$fg[white]%}on%{$reset_color%} "
YS_VCS_PROMPT_PREFIX2=":%{$fg[cyan]%}"
YS_VCS_PROMPT_SUFFIX="%{$reset_color%} "
YS_VCS_PROMPT_DIRTY=" %{$fg[red]%}✗"
YS_VCS_PROMPT_CLEAN=" %{$fg[green]%}✔︎"

# Git info.
local git_info='$(git_prompt_info)' #这个变量只是为了在PROMPT="${git_info}"赋值时，把这个字符串放进去。所以用单引号
local git_last_commit_string='$(f_git_last_commit)' #这个变量只是为了在PROMPT="${git_info}"赋值时，把这个字符串放进去
ZSH_THEME_GIT_PROMPT_PREFIX="${YS_VCS_PROMPT_PREFIX1}git${YS_VCS_PROMPT_PREFIX2}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$YS_VCS_PROMPT_SUFFIX"
ZSH_THEME_GIT_PROMPT_DIRTY="$YS_VCS_PROMPT_DIRTY"
ZSH_THEME_GIT_PROMPT_CLEAN="$YS_VCS_PROMPT_CLEAN"

#PROMPT是一个variable，parameter在shell中包括variable、expansion等。变量里面不能再保存变量。eval PROMPT时，只能对PROMPT这个变量执行parameter expansion，所以substring expansion只能对PROMPT这个变量执行，这显然不是我要的。我要的是对commit信息截取前20字符，所以可以调用function。
function f_git_last_commit(){
	local git_last_commit="$(git log --pretty=format:"%h \"%s\"" -1 2> /dev/null)" #这个变量是expansion之后的真实字符串
	if [ ${#git_last_commit} -gt 30 ];    #  ${#git_last_commit} 这个变量字符串的长度
	then echo ${git_last_commit:0:30}"\n";
	else echo  ${git_last_commit};
	fi
}




# HG info
local hg_info='$(ys_hg_prompt_info)'
ys_hg_prompt_info() {
	# make sure this is a hg dir
	if [ -d '.hg' ]; then
		echo -n "${YS_VCS_PROMPT_PREFIX1}hg${YS_VCS_PROMPT_PREFIX2}"
		echo -n $(hg branch 2>/dev/null)
		if [ -n "$(hg status 2>/dev/null)" ]; then
			echo -n "$YS_VCS_PROMPT_DIRTY"
		else
			echo -n "$YS_VCS_PROMPT_CLEAN"
		fi
		echo -n "$YS_VCS_PROMPT_SUFFIX"
	fi
}

# Prompt format: \n # TIME USER at MACHINE in [DIRECTORY] on git:BRANCH STATE \n $ 
PROMPT="
%{$fg[cyan]%}%n \
%{$fg[white]%}at \
%{$fg[green]%}$(box_name) \
%{$fg[white]%}in \
%{$terminfo[bold]$fg[yellow]%}[${current_dir}]%{$reset_color%} \
${hg_info} \
${git_info} \
${git_last_commit_string}
%{$fg[red]%}%* \
%{$terminfo[bold]$fg[white]%}$ %{$reset_color%}"

if [[ "$USER" == "root" ]]; then
PROMPT="
%{$fg[cyan]%}%n \
%{$fg[white]%}at \
%{$fg[green]%}$(box_name) \
%{$fg[white]%}in \
%{$terminfo[bold]$fg[yellow]%}[${current_dir}]%{$reset_color%} \
${hg_info} \
${git_info} \
${git_last_commit_string}
%{$fg[red]%}%* \
%{$terminfo[bold]$fg[white]%}# %{$reset_color%}"
fi
