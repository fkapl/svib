import numpy as np
from PIL import Image

import colorcorrect.algorithm as cca
from colorcorrect.util import from_pil, to_pil


def cc(pil_image):
    slope = 14
    limit = 1200
    return to_pil(cca.automatic_color_equalization(from_pil(pil_image), slope, limit))

def colorcorrect(img_path, output_path):
    img = Image.open(img_path)
    cc_img = cc(img).convert('RGB')
    cc_img.save(output_path)
    return np.array(cc_img)

def load(img_path):
    return np.array(Image.open(img_path).convert('RGB'))

CMAP = np.array([
    [0, 0, 0],
    [255, 0, 0],
    [0, 255, 0],
    [0, 0, 255],
    [255, 255, 0],
    [255, 0, 255],
    [0, 255, 255],
    [255, 255, 255]    
])

PALIMG = Image.new('P', (16,16))
PALIMG.putpalette(CMAP.flatten().tolist() * 4)

def collect_object_masks(masks, max_num_objects, mask_out_path):
    mask_list = [np.array(Image.open(m)).astype(bool) for m in masks]
    for _ in range(len(mask_list), max_num_objects+1):
        mask_list.append(np.zeros_like(mask_list[0], dtype=np.bool))
    mask_list.insert(0, np.zeros_like(mask_list[0], dtype=np.bool))
    mask = np.array(mask_list, dtype=np.bool)
    mask = np.moveaxis(mask, 0, -1)
    mask[..., 0] = ~mask[..., 1:].any(-1)

    final = mask.argmax(-1).astype(np.uint8)

    final_mask = Image.fromarray(final).convert('L')
    final_mask.load()
    im = final_mask.im.convert('P', 0, PALIMG.im)
    final_mask = final_mask._new(im)
    # final_out = np.array([[CMAP[v] for v in c] for c in final]).astype(np.uint8)
    # final_mask = Image.fromarray(final_out)
    final_mask.save(mask_out_path)
    return mask
