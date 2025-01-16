#!/bin/bash

# Δημιουργία αρχείου CSV
output_file="results_spechmmer.xlsx"
echo "Benchmark,L1I_Size,L1D_Size,L2_Size,L1_Assoc,L2_Assoc,Cacheline_Size,CPI,Sim_Seconds" > $output_file

# Εξαγωγή δεδομένων από όλα τα αποτελέσματα
for stats_file in results_spechmmer/*/stats.txt; do
  benchmark=$(echo $stats_file | awk -F'/' '{print $2}')
  L1I_Size=$(echo $stats_file | grep -oP "(?<=L1I_)\d+kB" | head -1)
  L1D_Size=$(echo $stats_file | grep -oP "(?<=L1D_)\d+kB" | head -1)
  L2_Size=$(echo $stats_file | grep -oP "(?<=L2_)\d+[kM]B" | head -1)
  L1_Assoc=$(echo $stats_file | grep -oP "(?<=L1Assoc_)\d+" | head -1)
  L2_Assoc=$(echo $stats_file | grep -oP "(?<=L2Assoc_)\d+" | head -1)
  Cacheline_Size=$(echo $stats_file | grep -oP "(?<=Cacheline_)\d+" | head -1)


  sim_ticks=$(grep "sim_ticks" $stats_file | awk '{print $2}')
  sim_insts=$(grep "sim_insts" $stats_file | awk '{print $2}')
  sim_seconds=$(grep "sim_seconds" $stats_file | awk '{print $2}')

  # Υπολογισμός CPI
  if [[ -n $sim_ticks && -n $sim_insts && $sim_insts -ne 0 ]]; then
    CPI=$(echo "scale=5; $sim_ticks / $sim_insts" | bc)
  else
    CPI="N/A"
  fi

  # Προσθήκη αποτελεσμάτων στο CSV
  echo "$benchmark,$L1I_Size,$L1D_Size,$L2_Size,$L1_Assoc,$L2_Assoc,$Cacheline_Size,$CPI,$sim_seconds" >> $output_file
done

