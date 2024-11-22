
SHAPES = ['Cone', 'Cube', 'Cylinder', 'Suzanne', 'Icosahedron', 'NewellTeapot', 'Sphere', 'Torus']

ROUND_SHAPES = ['Sphere', 'Cylinder', 'Cone', 'Icosahedron', 'Torus']

# Old sizes: work well for 2 objects but not for 3-10
#SIZES = [
#    1.,
#    1.5,
#    2.,
#]

SIZES = [
    0.9,
    0.6,
    0.4
]

SIZES_MAP = {
    '0.9': 'large',
    '0.6': 'medium',
    '0.4': 'small'
}

# OLD CLEVRTEX 1 materials
#MATERIALS = [
#        './data/materials/PoliigonBricksFlemishRed001.blend',
#        './data/materials/PoliigonBricksPaintedWhite001.blend',
#        './data/materials/PoliigonChainmailCopperRoundedThin001.blend',
#        './data/materials/PoliigonFabricDenim003.blend',
#        './data/materials/PoliigonFabricFleece001.blend',
#        './data/materials/PoliigonMetalSpottyDiscoloration001.blend',
#        './data/materials/PoliigonRoofTilesTerracotta004.blend',
#        './data/materials/PoliigonWoodFlooring061.blend',
#]

# NEW CLEVRTEX 2 materials
#MATERIALS = [
#        'data/materials_new/polyhaven_brick_floor.blend', #
#        'data/materials_new/polyhaven_white_sandstone_blocks_02.blend', #
#        #'data/materials_new/polyhaven_forest_ground_04.blend ', # Does not work?
#        'data/materials_new/polyhaven_forrest_ground_01.blend', #
#        'data/materials_new/polyhaven_denim_fabric.blend', #
#        'data/materials_new/poly_haven_stony_dirt_path.blend', #
#        'data/materials_new/polyhaven_rusty_metal.blend', #
#        'data/materials_new/polyhaven_roof_07.blend', #
#        'data/materials_new/polyhaven_wood_floor_deck.blend', #
#]
MATERIALS = [
    'data/materials_final/ambientcg_tiles032.blend', #
    'data/materials_final/polyhaven_denim_fabric.blend', #
    'data/materials_final/polyhaven_fabric_pattern_07.blend', #
    'data/materials_final/polyhaven_forrest_ground_01.blend', #
    'data/materials_final/polyhaven_leather_red_02.blend', #
    'data/materials_final/polyhaven_rocky_gravel.blend', #
    'data/materials_final/polyhaven_rusty_metal.blend', #
    'data/materials_final/polyhaven_white_sandstone_blocks_02.blend', #
]

MATERIALS_MAP = {
    'data/materials_final/ambientcg_tiles032.blend': 'green_tiles',
    'data/materials_final/polyhaven_denim_fabric.blend': 'blue_denim',
    'data/materials_final/polyhaven_fabric_pattern_07.blend': 'red_fabric',
    'data/materials_final/polyhaven_forrest_ground_01.blend': 'green_forest', #
    'data/materials_final/polyhaven_leather_red_02.blend': 'red_leather', #
    'data/materials_final/polyhaven_rocky_gravel.blend': 'rocky_gravel', #
    'data/materials_final/polyhaven_rusty_metal.blend': 'rusty_metal', #
    'data/materials_final/polyhaven_white_sandstone_blocks_02.blend': 'white_sandstone',
}

# cp ~/clevrtex-generation/clevrtex-gen/data_new/clevrtexv2_materials/... ~/svib/data_creation/clevrtex/data/materials_new/

SHIFT_AMOUNT = 2.0

# Check how mask colors work?
MASK_COLORS = [
    # Old colors
    (0, 0, 0, 0),
    (1, 0, 0, 1),
    (0, 1, 0, 1),
    (0, 0, 1, 1),
    # New colors
    (1, 1, 0, 1),
    (1, 0, 1, 1),
    (0, 1, 1, 1),
    (1, 1, 1, 1)
]