for m in 0.0001 0.0002 0.0005 0.001 0.002 \
                  0.005 0.01 0.02 0.05 0.1 0.2 0.5; do
    ranseq -l 5000000 > s1.fasta
    ranseq -l 5000000 > s1.fasta
    mutator -m $m s1.fasta > s2.fasta
    d=$(phylonium s*.fasta 2>/dev/null |
              tail -n 1 |
              awk '{print $2}')
    printf "%f\t%f\to\n" $m $d
    printf "%f\t%f\te\n" $m $m
done
