# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

export GOROOT='/usr/lib/golang'
export GOPATH=$HOME/go

PATH=$PATH:$HOME/.local/bin:$HOME/bin:$GOPATH/bin

export PATH
export EDITOR=nano

echo "Golang version:"
go version

echo "NodeJS version:"
node -v

echo "npm version:"
npm -v
