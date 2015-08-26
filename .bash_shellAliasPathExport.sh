# To the extent possible under law, the author(s) have dedicated all 
# copyright and related and neighboring rights to this software to the 
# public domain worldwide. This software is distributed without any warranty. 
# You should have received a copy of the CC0 Public Domain Dedication along 
# with this software. 
# If not, see <http://creativecommons.org/publicdomain/zero/1.0/>. 
#??
# base-files version 4.0-9

# ~/.bashrc: executed by bash(1) for interactive shells.

# The latest version as installed by the Cygwin Setup program can
# always be found at /etc/defaults/etc/skel/.bashrc

# Modifying /etc/skel/.bashrc directly will prevent
# setup from updating it.

# The copy in your home directory (~/.bashrc) is yours, please
# feel free to customise it to create a shell
# environment to your liking.  If you feel a change
# would be benifitial to all, please feel free to send
# a patch to the cygwin mailing list.

# User dependent .bashrc file

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

# Shell Options
#
# See man bash for more options...
#
# Don't wait for job termination notification
# set -o notify
#
# Don't use ^D to exit
# set -o ignoreeof
#
# Use case-insensitive filename globbing
# shopt -s nocaseglob
#
# Make bash append rather than overwrite the history on disk
# shopt -s histappend
#
# When changing directory small typos can be ignored by bash
# for example, cd /vr/lgo/apaache would find /var/log/apache
# shopt -s cdspell

# Completion options
#
# These completion tuning parameters change the default behavior of bash_completion:
#
# Define to access remotely checked-out files over passwordless ssh for CVS
# COMP_CVS_REMOTE=1
#
# Define to avoid stripping description in --option=description of './configure --help'
# COMP_CONFIGURE_HINTS=1
#
# Define to avoid flattening internal contents of tar files
# COMP_TAR_INTERNAL_PATHS=1
#
# Uncomment to turn on programmable completion enhancements.
# Any completions you add in ~/.bash_completion are sourced last.
# [[ -f /etc/bash_completion ]] && . /etc/bash_completion

# History Options
#
# Don't put duplicate lines in the history.
# export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
#
# Ignore some controlling instructions
# HISTIGNORE is a colon-delimited list of patterns which should be excluded.
# The '&' is a special pattern which suppresses duplicate entries.
# export HISTIGNORE=$'[ \t]*:&:[fb]g:exit'
# export HISTIGNORE=$'[ \t]*:&:[fb]g:exit:ls' # Ignore the ls command as well
#
# Whenever displaying the prompt, write the previous line to disk
# export PROMPT_COMMAND="history -a"

# Aliases
#
# Some people use a different file for aliases
# if [ -f "${HOME}/.bash_aliases" ]; then
#   source "${HOME}/.bash_aliases"
# fi
#
# Some example alias instructions
# If these are enabled they will be used instead of any instructions
# they may mask.  For example, alias rm='rm -i' will mask the rm
# application.  To override the alias instruction use a \ before, ie
# \rm will call the real rm not the alias.
#
# Interactive operation...
# alias rm='rm -i'
# alias cp='cp -i'
# alias mv='mv -i'
#
# Default to human readable figures
# alias df='df -h'
# alias du='du -h'
#
# Misc :)
# alias less='less -r'                          # raw control characters
# alias whence='type -a'                        # where, of a sort
# alias grep='grep --color'                     # show differences in colour
# alias egrep='egrep --color=auto'              # show differences in colour
# alias fgrep='fgrep --color=auto'              # show differences in colour
#
# Some shortcuts for different directory listings
# alias ls='ls -hF --color=tty'                 # classify files in colour
# alias dir='ls --color=auto --format=vertical'
# alias vdir='ls --color=auto --format=long'
# alias ll='ls -l'                              # long list
# alias la='ls -A'                              # all but . and ..
# alias l='ls -CF'                              #

# Umask
#
# /etc/profile sets 022, removing write perms to group + others.
# Set a more restrictive umask: i.e. no exec perms for others:
# umask 027
# Paranoid: neither group nor others have any perms:
# umask 077

# Functions
#
# Some people use a different file for functions
# if [ -f "${HOME}/.bash_functions" ]; then
#   source "${HOME}/.bash_functions"
# fi
#
# Some example functions:
#
# a) function settitle
# settitle () 
# { 
#   echo -ne "\e]2;$@\a\e]1;$@\a"; 
# }
# 
# b) function cd_func
# This function defines a 'cd' replacement function capable of keeping, 
# displaying and accessing history of visited directories, up to 10 entries.
# To use it, uncomment it, source this file and try 'cd --'.
# acd_func 1.0.5, 10-nov-2004
# Petar Marinov, http:/geocities.com/h2428, this is public domain
# cd_func ()
# {
#   local x2 the_new_dir adir index
#   local -i cnt
# 
#   if [[ $1 ==  "--" ]]; then
#     dirs -v
#     return 0
#   fi
# 
#   the_new_dir=$1
#   [[ -z $1 ]] && the_new_dir=$HOME
# 
#   if [[ ${the_new_dir:0:1} == '-' ]]; then
#     #
#     # Extract dir N from dirs
#     index=${the_new_dir:1}
#     [[ -z $index ]] && index=1
#     adir=$(dirs +$index)
#     [[ -z $adir ]] && return 1
#     the_new_dir=$adir
#   fi
# 
#   #
#   # '~' has to be substituted by ${HOME}
#   [[ ${the_new_dir:0:1} == '~' ]] && the_new_dir="${HOME}${the_new_dir:1}"
# 
#   #
#   # Now change to the new dir and add to the top of the stack
#   pushd "${the_new_dir}" > /dev/null
#   [[ $? -ne 0 ]] && return 1
#   the_new_dir=$(pwd)
# 
#   #
#   # Trim down everything beyond 11th entry
#   popd -n +11 2>/dev/null 1>/dev/null
# 
#   #
#   # Remove any other occurence of this dir, skipping the top of the stack
#   for ((cnt=1; cnt <= 10; cnt++)); do
#     x2=$(dirs +${cnt} 2>/dev/null)
#     [[ $? -ne 0 ]] && return 0
#     [[ ${x2:0:1} == '~' ]] && x2="${HOME}${x2:1}"
#     if [[ "${x2}" == "${the_new_dir}" ]]; then
#       popd -n +$cnt 2>/dev/null 1>/dev/null
#       cnt=cnt-1
#     fi
#   done
# 
#   return 0
# }
# 
# alias cd=cd_func






function f_useColor(){ #设置有颜色的PS1
    use_color=true

	# Set colorful PS1 only on colorful terminals.
	# dircolors --print-database uses its own built-in database
	# instead of using /etc/DIR_COLORS.  Try to use the external file
	# first to take advantage of user additions.  Use internal bash
	# globbing instead of external grep binary.
	safe_term=${TERM//[^[:alnum:]]/?}   # sanitize TERM
	match_lhs=""
	[[ -f ~/.dir_colors   ]] && match_lhs="${match_lhs}$(<~/.dir_colors)"
	[[ -f /etc/DIR_COLORS ]] && match_lhs="${match_lhs}$(</etc/DIR_COLORS)"
	[[ -z ${match_lhs}    ]] \
	        && type -P dircolors >/dev/null \
	        && match_lhs=$(dircolors --print-database)
	[[ $'\n'${match_lhs} == *$'\n'"TERM "${safe_term}* ]] && use_color=true

	if ${use_color} ; then
	        # Enable colors for ls, etc.  Prefer ~/.dir_colors #64489
	        if type -P dircolors >/dev/null ; then
	                if [[ -f ~/.dir_colors ]] ; then
	                        eval $(dircolors -b ~/.dir_colors)
	                elif [[ -f /etc/DIR_COLORS ]] ; then
	                        eval $(dircolors -b /etc/DIR_COLORS)
	                fi
	        fi

	        if [[ ${EUID} == 0 ]] ; then
	                PS1='\[\033[01;31m\]\u@\h\[\033[01;34m\] \W \$\[\033[00m\] '
	        else
	                PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] '
	        fi

	        #alias ls='ls --color=auto'
	        #alias grep='grep --colour=auto'
	else
	        if [[ ${EUID} == 0 ]] ; then
	                # show root@ when we don't have colors
	                PS1='\u@\h \W \$ '
	        else
	                PS1='\u@\h \w \$ '
	        fi
	fi
	# Try to keep environment pollution down, EPA loves us.
	unset use_color safe_term match_lhs
}

function f_alias(){
	#自己添加的alias
	alias ls='ls -FG ' #show-control-chars,-@显示扩展属性，-F目录后面加上斜线，-G启用颜色 
	alias la='ls -hAFG'                              #do not list implied . and .. 
	alias ll='ls -lhfG'                              # long list
	alias l.='ls -dhAFG .*'              #只显示本目录下的entry，不显示下一层目录

	alias rm='rm -i'
	alias cp='cp -i'
	alias mv='mv -i'
	#
	# Default to human readable figures
	alias df='df -h'
	alias du='du -h'
	#
	# Misc :)
	alias less='less -r -i -N'                          # raw control characters
	# alias whence='type -a'                        # where, of a sort
	alias grep='grep -ni --color'                     # show differences in colour
	alias egrep='egrep --color=auto'              # show differences in colour
	alias fgrep='fgrep --color=auto'              # show differences in colour
	alias vir='vim -R'		#vim -r是恢复，vim -R是只读
	alias ipaddress='ifconfig|grep inet.*netmask' #简化查找
	#http://hi.baidu.com/5217/blog/item/b67e60d0e85fd088a0ec9cd9.html 防止乱码

	alias ios-sim6='ios-sim --devicetypeid iPhone-6 launch' #ios-sim6在模拟器上运行这个app
	#free
	alias free='python /Applications/Utilities/free.py'
	
	#下面这些都来自于https://github.com/mathiasbynens/dotfiles/blob/3a47ebe1faf72222b1915853a3ce093ac8908853/.aliases
	## IP addresses来自于
	alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
	alias localip="ipconfig getifaddr en0"
	alias ips="ifconfig -a | /usr/bin/grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"
	## Show/hide hidden files in Finder
	alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
	alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

	## Hide/show all desktop icons (useful when presenting)
	alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
	alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"
	
	#来自https://github.com/justone/dockviz ,/var/run/docker.sock是在boot2docker中的，需要root权限才可以看到。
    alias dockviz="docker run --rm -v /var/run/docker.sock:/var/run/docker.sock nate/dockviz"
	alias dockviz-image="dockviz images -d | dot -Tpng -o images.png"
	alias chrome-disable-web-security="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --disable-web-security"
	
	#自己用shell脚本写的whereis
	alias whereis="~/.local/bin/whereis.sh"
}

function f_export(){
	export EDITOR=/usr/bin/vim #/usr/bin/nano
	export CHEATCOLOR=true
	export NODE_PATH=/usr/local/lib/node_modules
}

function f_plugins(){
	#bashmarks
	source ~/.local/bin/bashmarks.sh
	#thefuck https://github.com/nvbn/thefuck
	eval "$(thefuck-alias)"
	#boot2docker设置shell环境变量
	eval '$(boot2docker shellinit)'  &> /dev/null;
	#20150701为了使用cocoapods注释掉下面两行
	#export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
	#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
	
	#autojump
    [[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh
    #从dotfiles抄来的
    source ~/.functions
}
#如果当前的进程是bash才设置PS1、导入bash_completion.$$是当前进程PID,$?上一条进程的返回值
ps $$|grep "bash" >/dev/null 2>&1
if [ $? = 0 ]; then
	export PS1="[\u@\h \W] \$"
	f_useColor;	unset f_useColor
	if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
	fi
fi

f_alias
f_export
f_plugins



