#!/bin/bash
#SBATCH --job-name=render_images
#SBATCH --output=slurm_log/create_data_job_%j.out     # Standard output log
#SBATCH --error=slurm_log/create_data_job_%j.err      # Standard error log
#SBATCH --partition=ml.p4d.24xlarge                  # Partition name (adjust if necessary)
#SBATCH --gres=gpu:1                     # Request 1 GPU
#SBATCH --ntasks=1                       # Number of tasks (processes)
#SBATCH --cpus-per-task=6              # Number of CPU cores per task
#SBATCH --mem=100G                        # Total memory per node

# Load necessary modules
source ~/svib/containers/miniconda3/bin/activate
conda activate image_gen

echo "Output path: $2"
echo "Bind path: $3"

# Run your Python script
PYTHONPATH="/fsx/ubuntu/svib/containers/miniconda3/envs/image_gen/bin/python" \
PYTHONHOME="/fsx/ubuntu/svib/containers/miniconda3/envs/image_gen" \
/fsx/ubuntu/svib/containers/blender/blender --background \
    --python-use-system-env --python create_data.py -- \
    --num_samples 3000 \
    --no_target \
    --use_gpu 1 \
    --save_path "$2" \
    --min_objects 3 \
    --max_objects 6 \
    --bind_path "$3" \
    --material_dir ./data/materials_final \
    --start_idx $1
