for m in 0.0001 0.0002 0.0005 0.001 0.002 \
                  0.005 0.01 0.02 0.05 0.1 0.2 0.5; do
    ranseq -l 5000000 > s1.fasta
    ranseq -l 5000000 > s1.fasta
    cutSeq -r 1-4500000 s1.fasta |
        mutator -m $m > s2.fasta
    cutSeq -r 4501000-5000000 s1.fasta |
        tail -n +2 >> s2.fasta
    d=$(phylonium s*.fasta 2>/dev/null |
              tail -n 1 |
              awk '{print $2}')
    printf "%f\t%f\to\n" $m $d
    e=$(echo "$m * 0.9" | bc -l)
    printf "%f\t%f\te\n" $m $e
done
