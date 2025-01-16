#!/bin/bash

benchmarks_dir="spec_cpu2006"

L1I_SIZES=("16kB" "32kB" "64kB")
L1D_SIZES=("16kB" "32kB" "64kB")
L1_ASSOC=("1" "2" "4")
L2_SIZES=("256kB" "512kB" "1MB")
L2_ASSOC=("2" "4")
CACHELINE_SIZES=("64" "128")

mkdir -p results_spechmmer

  for L1I_SIZE in "${L1I_SIZES[@]}"; do
    for L1D_SIZE in "${L1D_SIZES[@]}"; do
      for L1_ASSOCIATIVITY in "${L1_ASSOC[@]}"; do
        for L2_SIZE in "${L2_SIZES[@]}"; do
          for L2_ASSOCIATIVITY in "${L2_ASSOC[@]}"; do
            for CACHELINE_SIZE in "${CACHELINE_SIZES[@]}"; do
              # Δημιουργία του ονόματος του φακέλου για κάθε παραμετροποίηση

              result_dir_1="results_spechmmer/spechmmer_L1I_${L1I_SIZE}_L1D_${L1D_SIZE}_L1Assoc_${L1_ASSOCIATIVITY}_L2_${L2_SIZE}_L2Assoc_${L2_ASSOCIATIVITY}_Cacheline_${CACHELINE_SIZE}"
	      mkdir -p $result_dir_1

	       ./build/ARM/gem5.opt -d $result_dir_1 configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --l1i_size=$L1I_SIZE --l1d_size=$L1D_SIZE --l1i_assoc=$L1_ASSOCIATIVITY --l1d_assoc=$L1_ASSOCIATIVITY --l2_size=$L2_SIZE --l2_assoc=$L2_ASSOCIATIVITY --cacheline_size=$CACHELINE_SIZE -c spec_cpu2006/456.hmmer/src/spechmmer -o "--fixed 0 --mean 325 --num 45000 --sd 200 --seed 0 spec_cpu2006/456.hmmer/data/bombesin.hmm" -I 100000000

            done
          done
        done
      done
    done
  done

