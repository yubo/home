# bash_completion

if [ -n "${BASH_VERSION-}" -a -n "${PS1-}" -a -z "${BASH_COMPLETION_VERSINFO-}" ]; then
	_source_once						\
		/usr/share/bash-completion/bash_completion	\
		/opt/homebrew/etc/bash_completion		\
		/usr/local/Homebrew/etc/bash_completion
fi



if [ -z "${_BASH_COMPLETION_DIR-}" ]; then
	_BASH_COMPLETION_DIR=~/.config/bash_completion.d

	if [[ -d ${_BASH_COMPLETION_DIR} && -r $_BASH_COMPLETION_DIR && -x $_BASH_COMPLETION_DIR ]]; then
	    for i in $(LC_ALL=C command ls "$_BASH_COMPLETION_DIR"); do
		i=$_BASH_COMPLETION_DIR/$i
		[[ ${i##*/} != @(*~|*.bak|*.swp|\#*\#|*.dpkg*|*.rpm@(orig|new|save)|Makefile*) \
		    && -f $i && -r $i ]] && . "$i"
	    done
	fi
fi
