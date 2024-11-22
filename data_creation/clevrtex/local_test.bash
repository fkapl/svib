#!/usr/bin/env bash
#PYTHONPATH="/fsx/ubuntu/svib/containers/miniconda3/envs/image_gen/bin/python" \
#PYTHONHOME="/fsx/ubuntu/svib/containers/miniconda3/envs/image_gen" \
#/fsx/ubuntu/svib/containers/blender/blender --background \
#    --python-use-system-env --python create_data.py -- \
#    --num_samples 8 \
#    --no_target \
#    --use_gpu 1 \
#    --test_scan \
#    --save_path output_sweep

# something about mask colors does not work!!!
PYTHONPATH="/fsx/ubuntu/svib/containers/miniconda3/envs/image_gen/bin/python" \
PYTHONHOME="/fsx/ubuntu/svib/containers/miniconda3/envs/image_gen" \
/fsx/ubuntu/svib/containers/blender/blender --background \
    --python-use-system-env --python create_data.py -- \
    --num_samples 1 \
    --no_target \
    --use_gpu 1 \
    --save_path output_test \
    --min_objects 3 \
    --max_objects 6 \
    --test_scan \
    --bind_path precomputed_binds/train_binds_alpha_0.60.json \
    --material_dir ./data/materials_final