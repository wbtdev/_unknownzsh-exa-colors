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
