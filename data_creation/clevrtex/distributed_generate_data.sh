#!/bin/bash

# Example usage
# ./distributed_generate_data.sh /path/to/your/output/folder /path/to/your/binds.json
# ./distributed_generate_data.sh output precomputed_binds/train_binds_alpha_0.60.json

# Call the sbatch script to generate images with different starting idx

# Train_Val_TestID: Right now 3k images per 16 gpus = 48k images
# Test_COOD: 300 images per gpu = 4800 images
# Define the number of iterations and the stepsize
NUMBER_OF_GPUS=16
NUMBER_OF_IMAGES=300 # 3000 for train

# Loop from 1 to NUMBER_OF_ITERATIONS
for (( i=0; i<NUMBER_OF_GPUS; i++ ))
do
  # Calculate the argument as iteration number multiplied by stepsize
  ARGUMENT=$(( i * NUMBER_OF_IMAGES ))

  # Call the other script with the calculated argument
  sbatch render_images.sbatch "$ARGUMENT" "$1" "$2"

  # Optional: Print a message indicating progress
  echo "Iteration $i: Called render_images.sbatch with starting idx $ARGUMENT"
done