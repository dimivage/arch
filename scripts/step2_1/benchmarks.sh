./build/ARM/gem5.opt -d spec_results/specmcf_ddr3_1600 configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --mem-type=DDR3_2133_8x8 -c spec_cpu2006/429.mcf/src/specmcf -o "spec_cpu2006/429.mcf/data/inp.in" -I 100000000

./build/ARM/gem5.opt -d spec_results/specmcf_ddr3_2133 configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --mem-type=DDR3_1600_8x8 -c spec_cpu2006/429.mcf/src/specmcf -o "spec_cpu2006/429.mcf/data/inp.in" -I 100000000

./build/ARM/gem5.opt -d spec_results/spechmmer configs/example/se.py --cpu-type=MinorCPU --caches --l2cache -c spec_cpu2006/456.hmmer/src/spechmmer -o "--fixed 0 --mean 325 --num 45000 --sd 200 --seed 0 spec_cpu2006/456.hmmer/data/bombesin.hmm" -I 100000000

./build/ARM/gem5.opt -d spec_results/spechmmer_1Ghz configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --cpu-clock=1GHz -c spec_cpu2006/456.hmmer/src/spechmmer -o "--fixed 0 --mean 325 --num 45000 --sd 200 --seed 0 spec_cpu2006/456.hmmer/data/bombesin.hmm" -I 100000000

./build/ARM/gem5.opt -d spec_results/spechmmer_3Ghz configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --cpu-clock=3GHz -c spec_cpu2006/456.hmmer/src/spechmmer -o "--fixed 0 --mean 325 --num 45000 --sd 200 --seed 0 spec_cpu2006/456.hmmer/data/bombesin.hmm" -I 100000000

./build/ARM/gem5.opt -d spec_results/spechmmer_ddr3_1600 configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --mem-type=DDR3_2133_8x8 -c spec_cpu2006/456.hmmer/src/spechmmer -o "--fixed 0 --mean 325 --num 45000 --sd 200 --seed 0 spec_cpu2006/456.hmmer/data/bombesin.hmm" -I 100000000

./build/ARM/gem5.opt -d spec_results/spechmmer_ddr3_2133 configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --mem-type=DDR3_1600_8x8 -c spec_cpu2006/456.hmmer/src/spechmmer -o "--fixed 0 --mean 325 --num 45000 --sd 200 --seed 0 spec_cpu2006/456.hmmer/data/bombesin.hmm" -I 100000000

./build/ARM/gem5.opt -d spec_results/specsjeng_ddr3_1600 configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --mem-type=DDR3_2133_8x8 -c spec_cpu2006/458.sjeng/src/specsjeng -o "spec_cpu2006/458.sjeng/data/test.txt" -I 100000000

./build/ARM/gem5.opt -d spec_results/specsjeng_ddr3_2133 configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --mem-type=DDR3_1600_8x8 -c spec_cpu2006/458.sjeng/src/specsjeng -o "spec_cpu2006/458.sjeng/data/test.txt" -I 100000000

./build/ARM/gem5.opt -d spec_results/speclibm_ddr3_1600 configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --mem-type=DDR3_2133_8x8 -c spec_cpu2006/470.lbm/src/speclibm -o "20 spec_cpu2006/470.lbm/data/lbm.in 0 1 spec_cpu2006/470.lbm/data/100_100_130_cf_a.of" -I 100000000

./build/ARM/gem5.opt -d spec_results/speclibm_ddr3_2133 configs/example/se.py --cpu-type=MinorCPU --caches --l2cache --mem-type=DDR3_1600_8x8 -c spec_cpu2006/470.lbm/src/speclibm -o "20 spec_cpu2006/470.lbm/data/lbm.in 0 1 spec_cpu2006/470.lbm/data/100_100_130_cf_a.of" -I 100000000

