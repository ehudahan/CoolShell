#!/bin/csh -f

#
# Personal C shell customizations
# Read at start of execution of each C shell
#

# No core dumps
limit coredumpsize 0

# mask for file permissions -- disallows GROUP and OTHER write bits to be set
umask 007

setenv TERM xterm


# Site-wide C shell customizations  -- DO NOT DELETE!
if ( -e /cs/share/skel/cshrc.site ) source /cs/share/skel/cshrc.site

# Environment variables
setenv	PAGER		less		# use 'less' rather then 'more'
setenv	EDITOR		emacs      
setenv  PRINTER 	hs
setenv	BLOCKSIZE	1k
setenv MANPATH /usr/local/postgres/man:/usr/share/man:/usr/man:/usr/X11R6/man:/usr/lib/perl5/man:/usr/local/man:/cs/course/current/bioskill/perllib/lib/perl5/man:/cs/staff/tommy/local/man/:/cs/staff/tommy/perllib/lib/perl5/man:/cs/staff/tommy/perllib/local/man



if (-e ~/.classpath) source ~/.classpath # sets java's CLASSPATH 

# If non-interactive, exit
if (! $?prompt) exit 0

# If interactive, switch over to Enhanced C shell

if (! $?tcsh) then
	foreach dir ($path)
		if ($dir =~ .*) continue
		if (-x $dir/tcsh) then
			set tcshpath = $dir/tcsh
			break
		endif
	end
	if ($?tcshpath) then
		setenv SHELL $tcshpath
		exec tcsh $argv
	endif
endif

# -------------------------------------------------
# Interactive C shell customizations

# Fancy aliases
if (-e ~/.aliases) source ~/.aliases

# Shell variables
#set savehist=200	# on logout, save last 200 commands in ~/.history 
set history=500		# remember last 500 commands
set inputmode=insert	# or '=overwrite'
set notify		# notify at once when a background job terminates
set noclobber		# to overwrite a file, must use '>!', not '>'
set ignoreeof		# to logout, must use 'exit', not Ctl-D
set correct=cmd		# or '=all'. Try to correct typing errors
set autoexpand
set autolist		# so <tab> lists possible completions (like Ctl-D)
set listmax=500		# so autolistings don't clutter screen
set pushdtohome		# pushd without arguments does 'pushd ~'

# shell checks mail every 60 secs
set mail = (60 /cs/mail/$user /cs/spam/$user)

# Show a fortune cookie
if ( -x /usr/games/fortune ) then
   /usr/games/fortune
endif

bindkey -k up   history-search-backward
bindkey -k down history-search-forward


set prompt="%{\033[35m%}<%{\033[1m%}%h%{\033[0;35m%}\|%{\033[1m%}%?%{\033[0;35m%}>%{\033[1;36m%}%n%{\033[0;36m%}@%{\033[1;32m%}%m%{\033[0;32m%}:%{\033[1;33m%}%c2%{\033[33m%}%#%{\033[0m%} "


setenv CVSROOT /cs/openjail/cvs


bindkey -k up   history-search-backward
bindkey -k down history-search-forward
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5A' beginning-of-line
bindkey '^[[1;5B' end-of-line
bindkey '^B' beginning-of-line

set nobeep
setenv HOME /cs/usr/$user

#setenv LC_ALL C
setenv LC_ALL C.UTF-8
alias   grep    'grep --color'
alias mytime '/usr/bin/time -f "%E real,%U user,%S sys"'


#setenv PATH ${PATH}:$HOME/.local/bin

/sci/labs/morani/morani/icore-data/lab/
# setenv _CONDA_EXE "/sci/labs/morani/morani/icore-data/lab/Tools/Anaconda/bin/conda"
# setenv _CONDA_ROOT "/sci/labs/morani/morani/icore-data/lab/Tools/Anaconda"
setenv _CONDA_EXE "/Volumes/ehudda/lab/Tools/Anaconda/bin/conda"
setenv _CONDA_ROOT "/Volumes/ehudda/lab/Tools/Anaconda"
source $_CONDA_ROOT/etc/profile.d/conda.csh

# match to terminal window
echo 'Resize to your terminal window:'
resize
