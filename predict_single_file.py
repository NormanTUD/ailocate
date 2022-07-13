import sys
from pprint import pprint

def dier(msg):
    pprint(msg)
    sys.exit(1)

if len(sys.argv) == 1:
    print("No image file given")
    sys.exit(1)

import torch

# Model
model = torch.hub.load('ultralytics/yolov5', 'yolov5s')  # or yolov5n - yolov5x6, custom

# Images
img = sys.argv[1]  # or file, Path, PIL, OpenCV, numpy, list

# Inference
results = model(img)

# Results
from pprint import pprint
pprint(results.pandas().xyxy[0])
