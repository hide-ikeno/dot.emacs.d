### -*- mode: sh; coding: euc-jp -*- ###
### 
### File .zshrc
###   Setup file for zsh
###   Originaly written by ippei@cms.mtl.kyoto-u.ac.jp (2004-04-28)
###   Last modified: <2006/03/17 20:59:27 Fri> by Hidekazu Ikeno

# ���
# cd -[tab] �ǥǥ��쥯�ȥꥹ���å���ƤӽФ���
# <1-20> �ѥ�����ޥå�
#   ESC C-h �Ƕ��ڤ�ʸ���ޤǤΥХå����ڡ���
# killall���ޥ��
# ***/ �����󥯤�é��
# C-x g �磻��ɥ�����Ÿ����̤�ߤ�
#    a=aiueo
#    echo $a[1]

# �Ŀ�Ū�����Х���ɤ˻Ȥ��� C-�����Х����
# C-o, C-q, C-s
# C-t ��ʸ�����줫���ϻȤ����꤬�ɤ��ʤ��ΤǤ���ʤ�
# C-c, C-g ��������Υ��ޥ�ɤ��ä��Ƥ��ޤ��Τ򲿤Ȥ�����
# C-i �� TAB �������饯
# C-w ����
# C-v �ü�ʸ�����֤���C-v C-i �ʤ饿��ʸ����C-v C-j �ʤ����ʸ�����֤���
# C-x �ϥ��ޥ�ɤ�Ĵ�٤롣(C-x g �ߤ�����)
#### C-j or C-m �ɤ��餫���ɤ������櫓�ǤϤʤ���skkinput �� C-j ��Ȥ�

############################################################
## �Ķ��ѿ��ϼ�� ~/.zshenv �˵���
# ~/.zshrc �˵��Ҥ���Τϡ����󥿥饯�ƥ��֥�����Ȥ��Ƥ�����
# if [[ -r $HOME/.zshenv ]]; then
#     source $HOME/.zshenv
# fi

hosts=( localhost `hostname` )
#printers=( lw ph clw )
umask 002
#cdpath=( ~ )                    # cd �Υ������ѥ�

#### zsh-completion
fpath=( ~/.zsh/functions $fpath[@] )       # zsh�ؿ��Υ������ѥ�
if [[ -d "$HOME/.zsh/cache" ]]; then
    zstyle ':completion:*' use-cache yes
    zstyle ':completion:*' cache-path $HOME/.zsh/cache
fi

# �����ȥǥ��쥯�ȥ�˸��䤬�ʤ����Τ� cdpath ��Υǥ��쥯�ȥ�����
zstyle ':completion:*:cd:*' tag-order local-directories path-directories
# cf. zstyle ':completion:*:path-directories' hidden true
# cf. cdpath ��Υǥ��쥯�ȥ���䴰���䤫�鳰���

## �䴰�����羮ʸ������̤��ʤ�
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

#### history
HISTFILE="$HOME/.zsh_history"      # ����ե�����
HISTSIZE=10000                  # ��������¸����� $HISTFILE �κ��祵������
SAVEHIST=10000                  # ��¸�������������

#### option, limit, bindkey
setopt extended_history         # ���ޥ�ɤγ��ϻ���ȷв���֤���Ͽ
setopt hist_ignore_dups         # ľ���Υ��ޥ�ɤ�Ʊ��ʤ����Ͽ���ʤ�
setopt hist_ignore_all_dups     # ��Ͽ�ѥ��ޥ�ɹԤϸŤ�������
setopt hist_reduce_blanks       # ;ʬ�ʶ���ϵͤ����Ͽ(������㤤��Ͽ���ɤ�)
#setopt append_history          # zsh ��λ��������˥ե�����˵�Ͽ(�ǥե����)
#setopt inc_append_history      # Ʊ�塢���������ޥ�ɤ����Ϥ��������ǵ�Ͽ
setopt share_history            # �ҥ��ȥ�ζ�ͭ��(append�ϤȰۤʤ���ɤ߹������ס���������ꤹ��� append �Ϥ�����)
setopt hist_no_store            # history���ޥ�ɤ���Ͽ���ʤ�
setopt hist_ignore_space        # ���ޥ�ɹ���Ƭ������λ���Ͽ���ʤ�(ľ��ʤ�иƤ٤�)


setopt list_packed              # �䴰����ꥹ�Ȥ�ͤ��ɽ��
setopt list_types               # �䴰����˥ե�����μ����ɽ������
setopt print_eight_bit          # �䴰����ꥹ�Ȥ����ܸ��Ŭ��ɽ��
#setopt menu_complete           # 1���ܤ�TAB ���䴰�����������ɽ����������������
setopt no_clobber               # ��񤭥�����쥯�Ȥζػ�
setopt no_unset                 # ̤����ѿ��λ��Ѥζػ�
setopt no_hup                   # logout���˥Хå����饦��ɥ���֤� kill ���ʤ�
setopt no_beep                  # ���ޥ�����ϥ��顼��BEEP���Ĥ餵�ʤ�

setopt extended_glob            # ��ĥ�����
setopt numeric_glob_sort        # ��������ͤȲ�ᤷ�ƾ��祽���Ȥǽ���
setopt auto_cd                  # ��1�������ǥ��쥯�ȥ���� cd ���䴰
setopt correct                  # ���ڥ�ߥ��䴰
setopt no_checkjobs             # exit ���˥Хå����饦��ɥ���֤��ǧ���ʤ�
#setopt ignore_eof              # C-d��logout���ʤ�(C-d���䴰�ǻȤ�����)
setopt auto_pushd               # cd -[TAB] �Ǥ���ޤǤ˰�ư�����ǥ��쥯�ȥ������ɽ��
setopt pushd_to_home            # �����ʤ�pushd��$HOME�����(ľ��dir�ؤ� cd - ��)
setopt pushd_ignore_dups        # �ǥ��쥯�ȥꥹ���å��˽�ʣ����ʪ�ϸŤ�������
#setopt pushd_silent   # pushd, popd ���٤˥ǥ��쥯�ȥꥹ���å�����Ȥ�ɽ�����ʤ�
setopt interactive_comments     # ���ޥ��������Υ����Ȥ�ǧ���
#setopt rm_star_silent          # rm * ���������ɤ���ʹ�����˼¹�
#setopt rm_star_wait            # rm * �λ��� 10�ôֲ��⤷�ʤ�
#setopt chase_links             # �����Υѥ����Ѵ����Ƥ���¹ԡ�
# setopt sun_keyboard_hack      # SUN�����ܡ��ɤǤ��ѽ� typo ` �򥫥С�����


#limit   coredumpsize    0       # �����ե�������Ǥ��ʤ��褦�ˤ���

stty    erase   '^H'
stty    intr    '^C'
stty    susp    '^Z'

#### bindkey
# bindkey "�����Ƥ�������" �¹Ԥ����뵡ǽ��̾��
bindkey -e    # emacs �������Х����(�Ķ��ѿ� EDITOR ��ȿ�Ǥ��뤬�����ä���ͥ��)
bindkey '^I'    complete-word   # complete on tab, leave expansion to _expand

bindkey '^P' history-beginning-search-backward # ��Ƭ�ޥå��Υҥ��ȥꥵ����
bindkey '^N' history-beginning-search-forward # ��Ƭ�ޥå��Υҥ��ȥꥵ����

# tcsh����Ƭ�ޥå��Υҥ��ȥꥵ����(�������뤬����)
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# run-help ���ƤФ줿����zsh ���������ޥ�ɤξ��ϳ������� zsh �Υޥ˥奢��ɽ��
[ -n "`alias run-help`" ] && unalias run-help
autoload run-help

#### completion
#
#_cache_hosts=($HOST localhost)

if [ -f ~/.rhosts ]; then                 
    _cache_hosts=($HOST localhost `awk '{print $1}' ~/.rhosts`)
else
    _cache_hosts=($HOST localhost)
fi
autoload -U compinit
compinit

#compdef _tex platex             # platex �� .tex ��



############################################################
# tcsh ��̣��ñ����
#tcsh-backward-delete-word () {
    #local WORDCHARS="${WORDCHARS:s#/#}"
    #zle backward-delete-word
#}
#zle -N tcsh-backward-delete-word # �ؿ��� widget ���Ѥ���
#bindkey '^W' tcsh-backward-delete-word # bindkey �ǳ����Ƥ�

# ñ��ñ�̤ǤΥХå����ڡ���
export WORDCHARS='*?_.[]~=&;!#$%^(){}<>'
# M-h : default run-help
bindkey "^[h" backward-kill-word
bindkey "^[?" run-help

# redo
#     M-h �Υǥե���� run-help �������餷��
#     $ bindkey G backward-kill-word
#     "^W" backward-kill-word
#     "^[^H" backward-kill-word
#     "^[^?" backward-kill-word

############################################################
## �ץ��ץ�����
autoload -U colors; colors      # ${fg[red]}�����Υ��顼�񼰤�ͭ����

setopt prompt_subst				# ESC���������פ�ͭ���ˤ���

if [[ $COLORTERM == 1 ]]; then
    if [[ $UID == 0 ]] ; then 
		PSCOLOR='01;01;31'
    else
		PSCOLOR='01;01;32'		# ��������
    fi
    # ���ץ��ץ�
    RPROMPT=$'%{\e[${PSCOLOR}m%}[%{\e[36m%}%~%{\e[${PSCOLOR}m%}]%{\e[00m%}'
    PS1=$'%{\e[${PSCOLOR}m%}%n@%m${WINDOW:+"[$WINDOW]"} %{\e[34m%}$ '
fi
# 1���ܤ� $'...' �� ��\e]2;��kterm �Υ����ȥ��\a��
# 2���ܤ� $'...' �� ��\e]1;�֥�������Υ����ȥ��\a��
# 3���ܤ� $'...' ���ץ��ץ�

# \e �� ESC ������()���֤�ɬ�פ����뤫��
# emacs �Ǥ� C-q ESC, vi �Ǥ� C-v ESC �����Ϥ���
#	\e[00m 	������֤�
#	\e[01m 	����	(0�Ͼ�ά��ǽ�äݤ�)
#	\e[04m	��������饤��
#	\e[05m	blink(����)
#	\e[07m	ȿž
#	\e[3?m	ʸ�����򤫤���
#	\e[4?m	�طʿ��򤫤���
#		?= 0:��, 1:��, 2:��, 3:��, 4:��, 5:��, 6:��, 7:��


############################################################
## alias & function

#### PAGER
#alias less="$PAGER"
alias les="less"	# for typo

#### man
if [[ -x `which jman` ]]; then
    alias man="jman"
fi

#### gnuplot with rlwrap
if [[ -x `which rlwrap` ]]; then
    alias gnuplot="rlwrap -a -c gnuplot"
fi

#### emacs
#if [ -x $HOME/bin/select-emacs ]; then
#    alias emacs='$HOME/bin/select-emacs'
#    alias emasc='$HOME/bin/select-emacs'
#fi

#### ps
if [[ $ARCHI == "irix" ]]; then
    alias psa='ps -ef'
else; 
    alias psa='ps auxw'
fi
function pst() {				# CPU ����Ψ�ι⤤������8��
    psa | head -n 1
    psa | sort -r -n +2 | grep -v "ps -auxww" | grep -v grep | head -n 8
}
function psm() {				# ������ͭΨ�ι⤤������8��
    psa | head -n 1
    psa | sort -r -n +3 | grep -v "ps -auxww" | grep -v grep | head -n 8
}
function psg() {
    psa | head -n 1
    psa | grep $* | grep -v "ps -auxww" | grep -v grep
}

#### ls
#### dircolor
# if [[ -x `which dircolors` ]] && [[ -e $HOME/.dir_colors ]]; then
#     eval `dircolors $HOME/.dir_colors` # ��������
# fi

# BSD LSCOLORS
export LSCOLORS=ExgxFxdxcxegefabagacad
# Linux LS_COLORS
export LS_COLORS='di=1;;40:ln=36;40:so=1;;40:pi=33;40:ex=32;40:bd=34;46:cd=34;45:su=0;41:sg=0;46:tw=0;42:ow=0;43:'
export ZLS_COLORS=$LS_COLORS
# �����Υ����륳�ޥ�ɤν��Ϥ˿����դ�
export CLICOLOR=true
# �䴰����˿����դ���
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

#### Aliases
alias ls="ls -aF"
alias lscolor='ls -aF'
alias kls='ls'
# alias sl='ls'
alias sls='ls'
alias l='ls'

#### command
alias cp='cp -iv'
#alias du='du -k'
#alias mv='mv -iv'
alias xcalc='xcalc &'
alias xterm='xterm &'
alias bell="echo '\a'"

#### switch keymaps
alias asdf="xmodmap .Xmodmap-dvorak"
alias aoeu="xmodmap .Xmodmap-qwerty"

#### switch compiler
alias usegnu="CC=gcc CXX=g++ FC=g77"
alias useintel="CC=icc CXX=icpc FC=ifort F90=ifort"
alias usepgi="CC=pgcc CXX=pgCC FC=pgf77 F90=pgf90"
# ��˥Хå����饦��ɤǼ¹�
function gv() { command gv $* & }
function gimp() { command gimp $* & }
function mozzila() { command mozilla $* & }
function xdvi() { command xdvi $* & }
function xpdf() { command xpdf $* & }
function evince() { command evince $* & }
function okular() { command okular $* & }
function acroread() { command acroread $* & }
function display() { command display $* & }
function mpg321() { command mpg321 -s $* | esdcat & }

# �Хå����åץե���������
function bak() {
	for i in $@ ; do
	  	if [[ -e $i.bak ]] || [[ -d $i.bak ]]; then
		  	echo "$i.bak already exist"
		else
		  	command cp -ir $i $i.bak
		fi
	done
}

# ����Ȣ�μ���
function rm() {
    if [[ -d ~/.trash ]]; then
		DATE=`date "+%y%m%d-%H%M%S"`
		mkdir ~/.trash/$DATE
		for i in $@; do
        # �оݤ� ~/.trash/ �ʲ��ʥե�����ʤ�� /bin/rm ��ƤӽФ�������
			if [[ -e $i ]]; then
				rmcommand="mv $i ~/.trash/$DATE/"
				#echo "$rmcommand"
				eval "$rmcommand"
				unset rmcommand
			else 
				echo "$i : not found"
 			fi
		done
		unset DATE
    else
		/bin/rm $@
	fi
}

#function emacs() {
#    gnuclient "$@" 2> /dev/null || command emacs "$@" 2> /dev/null &
#}

#### time
REPORTTIME=8                    # CPU��8�ðʾ�Ȥä����� time ��ɽ��
TIMEFMT="\
    The name of this job.             :%J
    CPU seconds spent in user mode.   :%U
    CPU seconds spent in kernel mode. :%S
    Elapsed time in seconds.          :%E
    The  CPU percentage.              :%P"

#### ������δƻ�
# log ���ޥ�ɤǤ����򸫤뤳�Ȥ��Ǥ���
watch=(notme) # (all:������notme:��ʬ�ʳ����桼��̾,@�ۥ���̾��%ü��̾(��󡨶�����ڤꡢ�Ҥ��ƽ񤯤�AND���)
LOGCHECK=60                     # �����å��ֳ�[��]
WATCHFMT="%(a:${fg[blue]}Hello %n [%m] [%t]:${fg[red]}Bye %n [%m] [%t])"
# ���Ǥϡ�a (�����󤫥������Ȥ�)�Ǿ��ʬ�����Ƥ���
# %(a:���Υ�å�����:���Υ�å�����)
# a,l,n,m,M �����ѤǤ��롣
# ���Ȥ����ü�ʸ��
# %n    �桼��̾
# %a    ������/�������Ȥ˱����ơ�logged on��/��logged off��
# %l    ���Ѥ��Ƥ���ü��̾
# %M    Ĺ���ۥ���̾
# %m    û���ۥ���̾
# %S��%s        ���δ֤�ȿž
# %U��%u        ���δ֤򥢥�����饤��
# %B��%b        ���δ֤�����
# %t,%@ 12����ɽ���λ���
# %T    24����ɽ���λ���
# %w    ����(���� ��)
# %W    ����(��/��/ǯ)
# %D    ����(ǯ-��-��)

############################################################
## �ۥ��Ȱ�¸������
# if [ $ARCHI = "cygwin"  ]; then
#     zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'	# �䴰�����羮ʸ������̤��ʤ�
# fi
if [[ $ARCHI == "irix" ]] || [[ $ARCHI == "osf1" ]]; then
    if [[ TERM == "Eterm" ]]; then
        export TERM="vt102"
    else
        export TERM="xterm"
    fi
    alias ls="ls -F"
fi

############################################################
## �Ŀ;����ޤ�����
#if [ -e ~/.zshrc_private ]; then
#    source ~/.zshrc_private
#fi

#### end of file ###########################################
