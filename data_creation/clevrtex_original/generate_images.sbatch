#!/bin/bash
#SBATCH --job-name=render_images
#SBATCH --output=slurm_log/generate_images_%A_%a.out     # Standard output log
#SBATCH --error=slurm_log/generate_images_%A_%a.err      # Standard error log
#SBATCH --partition=ml.p4d.24xlarge                  # Partition name (adjust if necessary)
#SBATCH --gres=gpu:1                     # Request 1 GPU
#SBATCH --ntasks=1                       # Number of tasks (processes)
#SBATCH --cpus-per-task=6              # Number of CPU cores per task
#SBATCH --mem=100G                        # Total memory per node
#SBATCH --array=0-15            # 16 jobs indexed from 0 to 15

# Example usage: current settings use 16 jobs/gpus just adapt above
# sbatch generate_images.sbatch ./output precomputed_binds/train_binds_alpha_0.60.json train_val_test_easy

# Load necessary modules
source ~/clevrtex-generation/containers/miniconda3/bin/activate
conda activate clevrtex

echo "Output path: $1"
echo "Bind path: $2"
echo "Variant: $3"

# Run your Python script
PYTHONPATH=~/clevrtex-generation/containers/miniconda3/envs/clevrtex/bin/python \
PYTHONHOME=~/clevrtex-generation/containers/miniconda3/envs/clevrtex \
~/clevrtex-generation/containers/blender/blender --background \
     --python-use-system-env --python generate.py -- \
     --render_tile_size 512 \
     --width 128 --height 128 \
        --start_idx 0 \
        --filename_prefix '' \
        --variant $3 \
        --output_dir $1 \
        --properties_json ./data/full.json \
        --shape_dir ./data/shapes \
        --material_dir ./data/materials \
        --bind_path $2 \
        --num_images 48000 \
        --min_objects 3 \
        --max_objects 6 \
        --render_max_bounces 8 \
        --gpu