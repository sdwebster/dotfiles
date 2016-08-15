
# Meta aliases
alias prof="vim ~/.bash_profile"
alias reprof=". ~/.bash_profile"
alias vprof="vim ~/.vimrc"
alias tprof="vim ~/.tmux.conf"
alias subl="open -a Sublime\ Text\ 2"

## Clear terminal window (without actually deleting the old buffer)
alias rebuff="clear && printf '\e[3J'"

# Navigational aliases
alias de="cd ~/Desktop"
alias ds="cd ~/Documents"

# Files
mkcd () {
  mkdir "$1"
  cd "$1"
}

cdl () {
  cd "$1"
  ls
}

# dvorak home row synonym for ls: [a]ll files, [e]very one
alias ae="ls -a"
# [a]ll files visible to common [u]ser (e.g. in Finder)
alias au="ls"

### Scala
# Run sbt with Java 7 (useful for Coursera course)
alias sbt7="sbt -java-home `/usr/libexec/java_home -v 1.7`"


