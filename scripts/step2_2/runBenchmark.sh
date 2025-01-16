#!/bin/bash

benchmarks_dir="spec_cpu2006"

L1I_SIZES=("32kB" "64kB")
L1D_SIZES=("32kB" "64kB")
L1_ASSOC=("2" "4")
L2_SIZES=("512kB" "1MB" "4MB")
L2_ASSOC=("2" "4")
CACHELINE_SIZES=("64" "128")

mkdir -p results

  for L1I_SIZE in "${L1I_SIZES[@]}"; do
    for L1D_SIZE in "${L1D_SIZES[@]}"; do
      for L1_ASSOCIATIVITY in "${L1_ASSOC[@]}"; do
        for L2_SIZE in "${L2_SIZES[@]}"; do
          for L2_ASSOCIATIVITY in "${L2_ASSOC[@]}"; do
            for CACHELINE_SIZE in "${CACHELINE_SIZES[@]}"; do
              result_dir_1="results/specbzip_L1I_${L1I_SIZE}_L1D_${L1D_SIZE}_L1Assoc_${L1_ASSOCIATIVITY}_L2_${L2_SIZE}_L2Assoc_${L2_ASSOCIATIVITY}_Cacheline_${CACHELINE_SIZE}"
	      mkdir -p $result_dir_1
	      result_dir_2="results/specmcf_L1I_${L1I_SIZE}_L1D_${L1D_SIZE}_L1Assoc_${L1_ASSOCIATIVITY}_L2_${L2_SIZE}_L2Assoc_${L2_ASSOCIATIVITY}_Cacheline_${CACHELINE_SIZE}"
 	      mkdir -p $result_dir_2
	      result_dir_3="results/specsjeng_L1I_${L1I_SIZE}_L1D_${L1D_SIZE}_L1Assoc_${L1_ASSOCIATIVITY}_L2_${L2_SIZE}_L2Assoc_${L2_ASSOCIATIVITY}_Cacheline_${CACHELINE_SIZE}"
	      mkdir -p $result_dir_3
	      result_dir_4="results/speclibm_L1I_${L1I_SIZE}_L1D_${L1D_SIZE}_L1Assoc_${L1_ASSOCIATIVITY}_L2_${L2_SIZE}_L2Assoc_${L2_ASSOCIATIVITY}_Cacheline_${CACHELINE_SIZE}"
              mkdir -p $result_dir_4

              ./build/ARM/gem5.opt -d $result_dir_1 configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --l1i_size=$L1I_SIZE --l1d_size=$L1D_SIZE --l1i_assoc=$L1_ASSOCIATIVITY --l1d_assoc=$L1_ASSOCIATIVITY --l2_size=$L2_SIZE --l2_assoc=$L2_ASSOCIATIVITY --cacheline_size=$CACHELINE_SIZE -c $benchmarks_dir/401.bzip2/src/specbzip -o "$benchmarks_dir/401.bzip2/data/input.program 10" -I 100000000

	      ./build/ARM/gem5.opt -d $result_dir_2 configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --l1i_size=$L1I_SIZE --l1d_size=$L1D_SIZE --l1i_assoc=$L1_ASSOCIATIVITY --l1d_assoc=$L1_ASSOCIATIVITY --l2_size=$L2_SIZE --l2_assoc=$L2_ASSOCIATIVITY --cacheline_size=$CACHELINE_SIZE -c $benchmarks_dir/429.mcf/src/specmcf -o "$benchmarks_dir/429.mcf/data/inp.in" -I 100000000

	      ./build/ARM/gem5.opt -d $result_dir_3 configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --l1i_size=$L1I_SIZE --l1d_size=$L1D_SIZE --l1i_assoc=$L1_ASSOCIATIVITY --l1d_assoc=$L1_ASSOCIATIVITY --l2_size=$L2_SIZE --l2_assoc=$L2_ASSOCIATIVITY --cacheline_size=$CACHELINE_SIZE -c $benchmarks_dir/458.sjeng/src/specsjeng -o "$benchmarks_dir/458.sjeng/data/test.txt"  -I 100000000

	      ./build/ARM/gem5.opt -d $result_dir_4 configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --l1i_size=$L1I_SIZE --l1d_size=$L1D_SIZE --l1i_assoc=$L1_ASSOCIATIVITY --l1d_assoc=$L1_ASSOCIATIVITY --l2_size=$L2_SIZE --l2_assoc=$L2_ASSOCIATIVITY --cacheline_size=$CACHELINE_SIZE -c $benchmarks_dir/470.lbm/src/speclibm -o "20 $benchmarks_dir/470.lbm/data/lbm.in 0 1 $benchmarks_dir/470.lbm/data/100_100_130_cf_a.of" -I 100000000

            done
          done
        done
      done
    done
  done

