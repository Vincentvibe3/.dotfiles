
neofetch --off --disable memory cpu gpu packages --color_blocks off
printf "\033[0;35m  ______
 /_  __/__  _________ ___  __  ___  __
  / / / _ \\/ ___/ __ \`__ \\/ / / / |/_/
 / / /  __/ /  / / / / / / /_/ />  <
/_/  \\___/_/  /_/ /_/ /_/\\__,_/_/|_|


"

#powerlines
source ~/pureline/pureline ~/pureline.conf

#encrypt directory symmetrically
alias encrypt-dir="source ~/bin/encrypt-dir"


#decrypt directory
alias decrypt-tar="source ~/bin/decrypt-tar"

#exportkeys
alias export-gpg-key="source ~/bin/export-gpg-keys"

source ~/.env

#cursor
echo -e '\e[6 q'

