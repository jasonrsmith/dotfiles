alias ls='ls -a --color=always'
alias ll='ls -al'
export PS1='\h:\w\$ \[\033]0;\w\007'

function rename_screen_tab () { echo -ne "\x1bk$@\x1b\\"; return 0; }

#if [[ "$TERM" = screen* ]]; then
#  PROMPT_COMMAND='rename_screen_tab $PWD'
#fi

# auto-magically set name in screen tabs
function screenwrap() {
if [ "$1" = "-binonly" ]; then
    cmd=$(basename $2)
    shift 2
    title="$HOSTNAME:$cmd"
else
    cmd=$(basename $1)
    shift 1
    title="$HOSTNAME:$cmd $@"
fi
echo -ne "\033k${title}\033\\"
$cmd $@
}
if [ $TERM = "screen" ]; then
	alias weechat="screenwrap weechat-curses"
	alias weechat-curses="screenwrap weechat-curses"
	alias ssh="screenwrap ssh"
	alias lftp="screenwrap lftp"
	alias sftp="screenwrap sftp"
	alias su="screenwrap su"
	alias ftp="screenwrap ftp"
	alias scp="screenwrap -binonly scp"
	alias emacs="screenwrap -binonly emacs -u $LOGNAME"
	alias e="screenwrap -binonly emacs -u $LOGNAME"
	alias g='screenwrap gnus'
	alias mutt='screenwrap mutt'
	alias muttng='screenwrap muttng'
	alias mplayer="screenwrap -binonly mplayer"
	alias mc="screenwrap mc"
	alias man="screenwrap man"
	alias sudo="screenwrap sudo"
	alias alsamixer="screenwrap alsamixer"
	alias top='screenwrap top'
	alias htop='screenwrap htop'

	PROMPT_COMMAND='echo -ne "\x1bk$HOSTNAME:$PWD\x1b\\"'
fi

# setup for color ls
LS_COLORS='no=00:fi=00:di=01;34:ln=00;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:tw=01;34:ow=01;34:st=01;34:ex=32:*.tar=31:*.tgz=31:*.arj=31:*.taz=31:*.lzh=31:*.zip=31:*.z=31:*.Z=31:*.gz=31:*.bz2=31:*.bz=31:*.tbz2=31:*.tz=31:*.deb=31:*.rpm=31:*.jar=31:*.rar=31:*.ace=31:*.zoo=31:*.cpio=31:*.7z=31:*.rz=31:*.jpg=35:*.jpeg=35:*.gif=35:*.bmp=35:*.pbm=35:*.pgm=35:*.ppm=35:*.tga=35:*.xbm=35:*.xpm=35:*.tif=35:*.tiff=35:*.png=35:*.mng=35:*.pcx=35:*.mov=35:*.mpg=35:*.mpeg=35:*.m2v=35:*.mkv=35:*.ogm=35:*.mp4=35:*.m4v=35:*.mp4v=35:*.vob=35:*.qt=35:*.nuv=35:*.wmv=35:*.asf=35:*.rm=35:*.rmvb=35:*.flc=35:*.avi=35:*.fli=35:*.gl=35:*.dl=35:*.xcf=35:*.xwd=35:*.yuv=35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:';
export LS_COLORS

export FLEX_HOME="/c/Program Files (x86)/FlashDevelop/Tools/flexsdk"
export JAVA_HOME="/c/Program Files (x86)/Java/jdk1.7.0_02"
export NODE_HOME="/c/Program Files (x86)/nodejs"
export PATH=$NODE_HOME:$FLEX_HOME/bin:$JAVA_HOME/bin:/usr/local/apache-ant-1.8.2/bin:/usr/local/flex/bin:/c/Users/jsmith/npm/bin:/c/Users/jsmith/node/bin:/c/Users/jsmith/apache-ant-1.8.2/bin:/usr/local/tomcat/bin:$PATH
export JAVA_HOME="c:/Program Files (x86)/Java/jdk1.7.0_02"
export FLEX_HOME="c:/Program Files (x86)/FlashDevelop/Tools/flexsdk"
set -o vi
export EDITOR=vi
export CATALINA_OPTS="-Xms985m -Xmx985m -XX:MaxPermSize=384m -XX:MaxNewSize=128m -XX:-HeapDumpOnOutOfMemoryError -Xdebug -Xrunjdwp:transport=dt_socket,address=8000,server=y,suspend=n"
