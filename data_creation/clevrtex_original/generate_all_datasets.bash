#!/bin/bash

# Different training versions

# Super easy with 80% of all combinations
sbatch generate_images.sbatch ./output precomputed_binds/train_binds_alpha_0.80.json train_val_test_super_easy

# Super hard with 10% of all combinations
sbatch generate_images.sbatch ./output precomputed_binds/train_binds_alpha_0.10.json train_val_test_super_hard

# Testing num objects cood versions
sbatch generate_images.sbatch ./output precomputed_binds/train_binds_alpha_0.80.json test_super_easy_obj_cood --min_objects 7 --max_objects 10 --num_images 4800
sbatch generate_images.sbatch ./output precomputed_binds/train_binds_alpha_0.10.json test_super_hard_obj_cood --min_objects 7 --max_objects 10 --num_images 4800
