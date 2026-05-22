# Update system
sudo apt update
sudo apt upgrade -y
# Install phylonium
sudo apt install -y phylonium
# Install ectyper
sudo apt install -y pipx
pipx install ectyper
# Install bc and zip
sudo apt install bc zip -y
# Install datasets & dataformat
wget https://ftp.ncbi.nlm.nih.gov/pub/datasets/command-line/v2/linux-amd64/datasets
chmod +x datasets
mv datasets ~/bin
https://ftp.ncbi.nlm.nih.gov/pub/datasets/command-line/v2/linux-amd64/dataformat
chmod +x dataformat
mv dataformat ~/bin
# Set up directory for executables
test -d bin || mkdir bin
# Install Biobox
git clone https://github.com/evolbioinf/biobox
cd biobox
bash scripts/setup.sh
make
ln -s $(pwd)/bin/* ~/bin
cd ../
# Install Neighbors
git clone https://github.com/evolbioinf/neighbors
cd neighbors
bash scripts/setup.sh
make
ln -s $(pwd)/bin/* ~/bin
cd ../
# Setup path
source ~/.profile
