cd ~/Downloads
wget https://repo.anaconda.com/archive/Anaconda3-2024.10-1-Linux-x86_64.sh
sh Anaconda3-2024.10-1-Linux-x86_64

# Change to root user
echo Changing to root user...
sudo -i -u root
conda install -c conda-forge control slycot
