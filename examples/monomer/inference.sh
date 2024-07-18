#!/bin/bash
export LD_LIBRARY_PATH=$CONDA_PREFIX/lib:$LD_LIBRARY_PATH
export LIBRARY_PATH=$CONDA_PREFIX/lib:$LIBRARY_PATH

export FASTA_DIR=./examples/monomer/fasta_dir
export OUTPUT_DIR=./examples/monomer/output/precomputed_msa
export PRECOMPUTED_ALIGNMENT_DIR=./examples/monomer/alignments
export MMCIF_DIR=/rxrx/data/valence/alphafold/pdb_mmcif/mmcif_files    # UPDATE with path to your mmcifs directory 

python3 run_pretrained_openfold.py $FASTA_DIR \
  $MMCIF_DIR \
  --output_dir $OUTPUT_DIR \
  --config_preset model_1_ptm \
  --model_device "cuda:0"  \
  --data_random_seed 42 \
  --use_precomputed_alignments $PRECOMPUTED_ALIGNMENT_DIR
