# Bash script mplayer & find


## Install
### Create folder
1. cd ~
2. mkdir bin

### Create .bash_profile
1. nano .bash_profile
2. Paste in: PATH=$PATH:$HOME/bin 
2. Paste in: alias fplay='play.sh '
4. Save file

### Add bash script to $HOME/bin directory
cd ~/bin

## Search for files and play with mplayer
fplay your_search_string

### Result
[0] first_item
[1] second_item

Enter id for file to play: 1 

Will play the second_item file


