#!/bin/bash
export LD_LIBRARY_PATH=$CONDA_PREFIX/lib:$LD_LIBRARY_PATH
export LIBRARY_PATH=$CONDA_PREFIX/lib:$LIBRARY_PATH

export FASTA_DIR=./examples/multimer/fasta_dir
export OUTPUT_DIR=./examples/multimer/output
export PRECOMPUTED_ALIGNMENT_DIR=./examples/multimer/alignments
export MMCIF_DIR=/rxrx/data/valence/alphafold/pdb_mmcif/mmcif_files

python3 run_pretrained_openfold.py $FASTA_DIR \
  $MMCIF_DIR \
  --output_dir $OUTPUT_DIR \
  --config_preset "model_1_multimer_v3" \
  --model_device "cuda:0"  \
  --data_random_seed 42 \
  --use_precomputed_alignments $PRECOMPUTED_ALIGNMENT_DIR
