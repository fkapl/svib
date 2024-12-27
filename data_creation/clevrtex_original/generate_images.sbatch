#!/bin/bash -x
#SBATCH --job-name=render_images
#SBATCH --output=slurm_log/generate_images_%A_%a.out     # Standard output log
#SBATCH --error=slurm_log/generate_images_%A_%a.err      # Standard error log
#SBATCH --partition=ml.p4de.24xlarge                  # Partition name (adjust if necessary)
#SBATCH --gres=gpu:1                     # Request 1 GPU
#SBATCH --ntasks=1                       # Number of tasks (processes)
#SBATCH --cpus-per-task=6              # Number of CPU cores per task
#SBATCH --mem=100G                        # Total memory per node
#SBATCH --array=0-15            # 16 jobs indexed from 0 to 15

# Example usage: current settings use 16 jobs/gpus just adapt above
# sbatch generate_images.sbatch ./output precomputed_binds/train_binds_alpha_0.60.json train_val_test_easy [--min_objects N] [--max_objects N] [--num_images N]

# Load necessary modules
## Similar to source conda
eval "$(micromamba shell hook --shell bash)"
micromamba activate clevrtex

# Capture required positional args
OUTPUT_PATH="$1"
BIND_PATH="$2"
VARIANT="$3"
# Default values (e.g. for train_val_test_easy)
MIN_OBJECTS=3
MAX_OBJECTS=6
NUM_IMAGES=48000

# Remove these three arguments from the list before parsing the rest
shift 3

# Parse additional arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        --min_objects)
            MIN_OBJECTS="$2"
            shift 2
            ;;
        --max_objects)
            MAX_OBJECTS="$2"
            shift 2
            ;;
        --num_images)
            NUM_IMAGES="$2"
            shift 2
            ;;
        *)
            echo "Unknown parameter: $1"
            exit 1
            ;;
    esac
done

echo "Output path: $OUTPUT_PATH"
echo "Bind path: $BIND_PATH"
echo "Variant: $VARIANT"
echo "Min objects: $MIN_OBJECTS"
echo "Max objects: $MAX_OBJECTS"
echo "Num images: $NUM_IMAGES"

# Run your Python script
# echo "PYTHONPATH=~/micromamba/envs/clevrtex/bin/python \
# PYTHONHOME=~/micromamba/envs/clevrtex \
# /fsx/backup/ubuntu/clevrtex-generation/containers/blender/blender --background \
#      --python-use-system-env --python generate.py -- \
#      --render_tile_size 512 \
#      --width 128 --height 128 \
#         --start_idx 0 \
#         --filename_prefix '' \
#         --variant $VARIANT \
#         --output_dir $OUTPUT_PATH \
#         --properties_json ./data/full.json \
#         --shape_dir ./data/shapes \
#         --material_dir ./data/materials \
#         --bind_path $BIND_PATH \
#         --num_images $NUM_IMAGES \
#         --min_objects $MIN_OBJECTS \
#         --max_objects $MAX_OBJECTS \
#         --render_max_bounces 8 \
#         --gpu"

PYTHONPATH=~/micromamba/envs/clevrtex/bin/python \
PYTHONHOME=~/micromamba/envs/clevrtex \
/fsx/backup/ubuntu/clevrtex-generation/containers/blender/blender --background \
     --python-use-system-env --python generate.py -- \
     --render_tile_size 512 \
     --width 128 --height 128 \
        --start_idx 0 \
        --filename_prefix '' \
        --variant $VARIANT \
        --output_dir $OUTPUT_PATH \
        --properties_json ./data/full.json \
        --shape_dir ./data/shapes \
        --material_dir ./data/materials \
        --bind_path $BIND_PATH \
        --num_images $NUM_IMAGES \
        --min_objects $MIN_OBJECTS \
        --max_objects $MAX_OBJECTS \
        --render_max_bounces 8 \
        --gpu