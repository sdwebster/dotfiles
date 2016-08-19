
# Meta aliases
alias prof="vim ~/.bash_profile"
alias reprof=". ~/.bash_profile"
alias vprof="vim ~/.vimrc"
alias tprof="vim ~/.tmux.conf"
alias subl="open -a Sublime\ Text\ 2"

## Clear terminal window (without actually deleting the old buffer)
alias rebuff="clear && printf '\e[3J'"

## Navigational aliases for general OS X
alias de="cd ~/Desktop"
alias ds="cd ~/Documents"
alias dwl="cd ~/Downloads"

# View & grab the latest from your Downloads & Desktop
alias lsd="ls -tr $HOME/Downloads" # sorted most- to least-recently modified
alias cldl="cp \"$HOME/Downloads/$(lsd | tail -1)\"" # copy last download, e.g. $ cldl .
alias mldl="mv \"$HOME/Downloads/$(lsd | tail -1)\"" # move last download, e.g. $ mldl .

alias lsdk="ls -tr $HOME/Desktop" # sorted most- to least-recently modified
alias cldk="cp \"$HOME/Desktop/$(lsdk | tail -1)\""
alias mldk="mv \"$HOME/Desktop/$(lsdk | tail -1)\""

## Find the dimensions of an image (check out "$ man sips" for more awesome)
alias pic-dimensions="sips -g pixelHeight -g pixelWidth" # e.g. $ pic-dimensions site-logo.png

## Lock screen w/o logout
alias lockscreen='/System/Library/CoreServices/"Menu Extras"/User.menu/Contents/Resources/CGSession -suspend'

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


