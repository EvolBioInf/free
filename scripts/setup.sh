# Update system
sudo apt update
sudo apt upgrade -y
# Install phylonium
sudo apt install -y phylonium
# Install ectyper
sudo apt install pipx
pipx install ectyper
# Set up directory for executables
test -d bin || mkdir bin
# Install Biobox
git clone https://github.com/evolbioinf/biobox
cd biobox
bash scripts/setup.sh
make
ln -s $(pwd)/bin ~/bin
cd ../
# Install Neighbors
git clone https://github.com/evolbioinf/neighbors
cd neighbors
bash scripts/setup.sh
make
ln -s $(pwd)/bin ~/bin
cd ../
