ranseq -l 5000000 > s1.fasta
mutator s1.fasta > s2.fasta
phylonium s1.fasta s2.fasta
bash acc.sh > acc.dat
bash var.sh > var.dat
taxi O16:H48 neidb
neighbors -t 2605619 -L complete -o -l neidb |
    tail -n +2 |
    awk '{print $2}' > o16h48.txt
wc -l o16h48.txt
datasets summary genome accession \
           --inputfile o16h48.txt \
           --as-json-lines > o16h48.json
dataformat tsv genome \
             --inputfile o16h48_stable.json \
             --fields 'acc*','*atypical*','*notes'
datasets download genome accession \
           --inputfile o16h48.txt \
           --dehydrated
unzip ncbi_dataset.zip
datasets rehydrate --directory .
ls ncbi_*/*/*/*.fna
mkdir all
bash rename.sh
ls all/
phylonium all/* > o16h48.dis
nj o16h48.dis |
    midRoot |
    land > o16h48.nwk
plotTree o16h48.nwk
neighbors -t 562 -L complete -o -l neidb |
    tail -n +2 |
    awk '{print $2}' > eco.txt
wc -l eco.txt
datasets summary genome accession \
           --inputfile eco.txt \
           --as-json-lines > eco.json
dataformat tsv genome \
             --inputfile eco_stable.json \
             --fields 'acc*','*atypical*','*notes' |
    tail -n +2 |
    grep -v fail |
    grep -v true |
    cut -f 1 > eco.txt
wc -l eco.txt
pickle 1 eco.nwk |
    grep -c -v '^#'
fintac -t 2605619 eco.nwk
pickle 6446 eco.nwk |
    grep -v 2605619
pickle -t 6445 eco.nwk |
    plotTree
pickle 6446 eco.nwk |
    grep -v 2605619 |
    grep -v '^#' |
    sed 's/^[^_]*_//' > extra.txt
datasets download genome accession \
           --inputfile extra.txt \
           --dehydrated \
           --filename extra.zip
unzip -d extra -o extra.zip
datasets rehydrate --directory extra
ectyper -i extra/ncbi_dataset/data/*/*.fna
cut -f 1,6,7 ectyper*/output.tsv
