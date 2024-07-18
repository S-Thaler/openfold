#!/bin/bash
export LD_LIBRARY_PATH=$CONDA_PREFIX/lib:$LD_LIBRARY_PATH
export LIBRARY_PATH=$CONDA_PREFIX/lib:$LIBRARY_PATH

export FASTA_DIR=./examples/monomer/fasta_dir
export OUTPUT_DIR=./examples/monomer/output/on-the-fly
export MMCIF_DIR=/rxrx/data/valence/alphafold/pdb_mmcif/mmcif_files    # UPDATE with path to your mmcifs directory
export BASE_DATA_DIR=/rxrx/data/valence/alphafold

python3 run_pretrained_openfold.py $FASTA_DIR \
  $MMCIF_DIR \
  --output_dir $OUTPUT_DIR \
  --config_preset model_1_ptm \
  --model_device "cuda:0" \
  --data_random_seed 42 \
  --uniref90_database_path $BASE_DATA_DIR/uniref90/uniref90.fasta \
  --mgnify_database_path $BASE_DATA_DIR/mgnify/mgy_clusters_2022_05.fa \
  --pdb70_database_path $BASE_DATA_DIR/pdb70/pdb70 \
  --uniref30_database_path $BASE_DATA_DIR/uniref30/UniRef30_2021_03 \
  --bfd_database_path $BASE_DATA_DIR/bfd/bfd_metaclust_clu_complete_id30_c90_final_seq.sorted_opt