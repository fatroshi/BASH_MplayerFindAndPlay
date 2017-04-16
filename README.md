# Bash script mplayer & find

## Search for files and play with mplayer
bash play.sh your_search_string

[0] first_found_item
[1] second_found_item

Enter id for file to play: 1 

Will play the second_found_item file

##Install
#Create folder
1. cd ~
2. mkdir bin

# Create .bash_profile
1. nano .bash_profile
2. Paste in: PATH=$PATH:$HOME/bin 
3. alias fplay='play.sh '
4. Save file

# Add bash script to $HOME/bin directory
cd ~/bin

