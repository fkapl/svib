#!/bin/bash	

# CARE: script wont work with other python/blender/colorcorrect versions
# Can use option --test_scan to generate images with all shapes and a single material for all materials
#PYTHONPATH=~/clevrtex-generation/containers/miniconda3/envs/clevrtex/bin/python \
#PYTHONHOME=~/clevrtex-generation/containers/miniconda3/envs/clevrtex \

# switched to micromamba for environment management
PYTHONPATH=~/micromamba/envs/clevrtex/bin/python \
PYTHONHOME=~/micromamba/envs/clevrtex \
/fsx/backup/ubuntu/clevrtex-generation/containers/blender/blender --background \
     --python-use-system-env --python generate.py -- \
     --render_tile_size 512 \
     --width 128 --height 128 \
		 --start_idx 0 \
		 --filename_prefix '' \
		 --variant debug_new_cluster \
		 --output_dir ./output_test/ \
		 --properties_json ./data/full.json \
		 --shape_dir ./data/shapes \
		 --material_dir ./data/materials \
           --bind_path precomputed_binds/train_binds_alpha_0.60.json \
		 --num_images 1 \
           --min_objects 10 \
		 --max_objects 10 \
		 --gpu \
		 --render_max_bounces 8 \
