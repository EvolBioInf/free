# [`free`](https://owncloud.gwdg.de/index.php/s/7bxqzoXQP4iva7K)

## Description
Companion site for the book chapter "Fast Phylogeny Reconstruction
from Genomes of Closely Related Microbes" from the forthcoming third
edition of [*Bacterial
Pangenomics*](https://link.springer.com/book/10.1007/978-1-0716-1099-2).

## Authors
Bernhard Haubold, Fabian Klötzl, and Beatriz Vieira Mourato

## Setup Computer
### Ubuntu
Run
```
bash scripts/setup.sh
```
### Other Systems
We currently only provide a setup script for Ubuntu. However, that
setup script (`scripts/setup.sh`) should give you a good idea of
what's required on other systems. You can also start from our [Ubuntu
docker](https://hub.docker.com/r/haubold/mix), on which we have tested
the code in this repository.

## Get the Data
Run
```
make data
```
to download the example data into the directory `data`.

## Make the Scripts
Run
```
make
```
This generates the directory `tutorial` with the scripts and data for
following the tutorial in our chapter.

## License
[GNU General Public License](https://www.gnu.org/licenses/gpl.html)
