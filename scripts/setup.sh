# Update system
sudo apt update
sudo apt upgrade -y
# Install phylonium
sudo apt install -y phylonium
# Install ectyper
wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh
bash miniconda.sh -b -p $HOME/miniconda
echo ". $HOME/miniconda/etc/profile.d/conda.sh" >> ~/.bashrc
source ~/.bashrc
conda install -c bioconda ectyper
# Install bc, wget, and zip
sudo apt install bc wget zip -y
# Set up directory for executables
test -d ~/bin || mkdir ~/bin
# Install datasets & dataformat
wget https://ftp.ncbi.nlm.nih.gov/pub/datasets/command-line/v2/linux-amd64/datasets
chmod +x datasets
mv datasets ~/bin
wget https://ftp.ncbi.nlm.nih.gov/pub/datasets/command-line/v2/linux-amd64/dataformat
chmod +x dataformat
mv dataformat ~/bin
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
