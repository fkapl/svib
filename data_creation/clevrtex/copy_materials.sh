#!usr/bin/bash

# Paths to the source and destination folders
SOURCE_FOLDER="/fsx/ubuntu/clevrtex-generation/clevrtex-gen/data_new/clevrtexv2_materials"
DESTINATION_FOLDER="/fsx/ubuntu/svib/data_creation/clevrtex/data/materials_final"

# List of files to copy (space-separated)
#FILES=("polyhaven_brick_floor.blend" "polyhaven_white_sandstone_blocks_02.blend" "polyhaven_forrest_ground_01.blend" "polyhaven_denim_fabric.blend" "poly_haven_stony_dirt_path.blend" "polyhaven_rusty_metal.blend" "polyhaven_roof_07.blend" "polyhaven_wood_floor_deck.blend")
FILES=("ambientcg_tiles032.blend" "polyhaven_fabric_pattern_07.blend" "polyhaven_leather_red_02.blend" "polyhaven_rocky_gravel.blend")

# Ensure the destination folder exists
#mkdir -p "$DESTINATION_FOLDER"

# Loop through each file in the list
for FILE_NAME in "${FILES[@]}"; do
    # Construct source and destination file paths
    SOURCE_FILE="$SOURCE_FOLDER/$FILE_NAME"
    DESTINATION_FILE="$DESTINATION_FOLDER/$FILE_NAME"

    # Check if the source file exists
    if [[ -f "$SOURCE_FILE" ]]; then
        if [[ -f "$DESTINATION_FILE" ]]; then
            echo "File already exists: $DESTINATION_FILE"
        else
            # Copy the file to the destination folder
            echo "SOURCE FILE: $SOURCE_FILE"
            echo "DESTINATION FILE: $DESTINATION_FILE"
            cp "$SOURCE_FILE" "$DESTINATION_FILE"
        fi
    else
        echo "File not found: $SOURCE_FILE"
    fi
done