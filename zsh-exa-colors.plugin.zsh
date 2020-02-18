if (( ! $+commands[exa] )); then
  echo "exa is not installed. Please install with Homebrew or Cargo."
  return 1
fi

exals() {
  ls=exa
  if [[ ! -d .git || "$PWD" = "$HOME" ]]; then
      # Normal
      $ls "$@"
      return
  fi
  $ls --git "$@"
}

ls=exals

alias ls="$ls"
# Order by modified, show group and links
alias l="$ls -a -lgmH"
# Include extended info
alias la="l -@"
# Include the header
alias ll="l -h"
# 1 per line, dirs first
alias l1="$ls -1 --group-directories-first"
# Include dotfiles
alias la1="l1 -a"
# Only show dot-directories
alias lad="$ls -Dl .*"
# Only show dot-files
alias lsa="$ls -al .*(.)"
# Sort by extension
alias le="$ls -a -lgH -s extension --group-directories-first"
# Sort by modified, show modified time
alias lm="$ls -a -lghH -s modified -m"
# Sort by modified, show accessed and created times
alias lu="$ls -a -lghH -s modified -uU"
# Tree view
alias lt="$ls -T"
# Tree view with recursion
alias llt="$ls -a -lgHh -R -T"
alias tree="llt"
# Recursion limited to two levels
alias lr="$ls -a -lgHh -R -L 2"
# Recursion, no limit
alias lrr="$ls -a -lgHh -R"
# Only show symlinks
alias lsl="$ls -a -lh *(N@)"
# Display only executables
alias lsx="$ls -a -lh *(*)"
# Display world-{readable,writable,executable} files
alias lsw="$ls -a -ldh *(R,W,X.^ND/)"
# Display the ten biggest files
alias lsbig="$ls -a -lh *(.OL[1,10])"
# Only show directories
alias lsd="$ls -a -D"
# Only show empty directories
alias lse="$ls -a -dD *(/^F)"
# Display the ten newest files
alias lsnew="$ls -a -lh *(D.om[1,10])"
# Display the ten oldest files
alias lsold="$ls -a -lh *(D.Om[1,10])"
# Display the ten smallest files
alias lssmall="$ls -a -rlh -s=size *(.oL[1,10])"
# Display the ten newest directories and ten newest .directories
alias lsnewdir="$ls -a -hdDl *(/om[1,10]) .*(D/om[1,10])"
# Display the ten oldest directories and ten oldest .directories
alias lsolddir="$ls -a -hdDl *(/Om[1,10]) .*(D/Om[1,10])"

# replace bright aixterm colour codes w/ bold ANSI codes
export EXA_COLORS="${LS_COLORS//=9/=1;3}"

# Normal file
EXA_COLORS+="fi=0:"
# Directory
EXA_COLORS+="di=34:"
# Executable file
EXA_COLORS+="ex=31:"
# Named pipe
EXA_COLORS+="pi=32;40:"
# Socket
EXA_COLORS+="so=33;40:"
# Block device
EXA_COLORS+="bd=36;40:"
# Character device
EXA_COLORS+="cd=36;40:"
# Symlink
EXA_COLORS+="ln=35:"
# Arrow to broken symlink
EXA_COLORS+="or=1;31:"

## PERMISSIONS

# User +r bit
EXA_COLORS+="ur=33:"
# User +w bit
EXA_COLORS+="uw=31:"
# User +x bit (files)
EXA_COLORS+="ux=1;4;32:"
# User +x bit (file types)
EXA_COLORS+="ue=1;32:"
# Group +r bit
EXA_COLORS+="gr=33:"
# Group +w bit
EXA_COLORS+="gw=31:"
# Group +x bit
EXA_COLORS+="gx=32:"
# Others +r bit
EXA_COLORS+="tr=33:"
# Others +w bit
EXA_COLORS+="tw=31:"
# Others +x bit
EXA_COLORS+="tx=32:"
# Higher bits (files)
EXA_COLORS+="su=36:"
# Higher bits (other types)
EXA_COLORS+="sf=36:"
# Extended attribute marker
EXA_COLORS+="xa=1;37:"

## FILE SIZES

# Size numbers
EXA_COLORS+="sn=36:"
# Size unit
EXA_COLORS+="sb=1;36:"
# Major device ID
EXA_COLORS+="df=1;36:"
# Minor device ID
EXA_COLORS+="ds=36:"

## OWNERS AND GROUPS

# A user that's you
EXA_COLORS+="uu=32:"
# A user that's not
EXA_COLORS+="un=33:"
# A group with you in it
EXA_COLORS+="gu=32:"
# A group without you
EXA_COLORS+="gn=33:"

## HARD LINKS

# Number of links
EXA_COLORS+="lc=1;37:"
# A multi-link file
EXA_COLORS+="lm=37:"

## GIT

# New
EXA_COLORS+="ga=1;32:"
# Modified
EXA_COLORS+="gm=1;33:"
# Deleted
EXA_COLORS+="gd=1;31:"
# Renamed
EXA_COLORS+="gv=36:"
# Type change
EXA_COLORS+="gt=36:"

## DETAILS AND METADATA

# Punctuation
EXA_COLORS+="xx=0:"
# Timestamp
EXA_COLORS+="da=39:"
# File inode
EXA_COLORS+="in=37:"
# Number of blocks
EXA_COLORS+="bl=36:"
# Table header row
EXA_COLORS+="hd=4;37:"
# Symlink path
EXA_COLORS+="lp=35:"
# Control character
EXA_COLORS+="cc=1;31:"

## OVERLAYS

# Broken link path
EXA_COLORS+="bO=35;40:"

## EXTENSIONS

EXA_COLORS+="*.DS_Store=30:"
EXA_COLORS+="*.backup=01;37:"
EXA_COLORS+="*.zwc=01;30:"
# EXA_COLORS+="=:"
