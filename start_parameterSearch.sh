#!/bin/bash

# EDIT these paths to your directories, respectively:

# MaskRCNN folder (delete the word "#" from the beginning of the line and set the path if you already have
# a MaskRCNN folder - in this case, move the word "rem" from between the beginning of the last 2 lines):
# PATHTOINSERT="/home/biomag/path/Mask_RCNN-2.1"

# working directory where you downloaded the code and will have the output under ~\kaggle_workflow\outputs\postprocessing:
ROOT_DIR="."

# directory of your images to segment:
# for validation images are ine ~\kaggle_workflow\inputs\validation\images
# -----------------------------------------------------------------------------


# --- DO NOT EDIT from here ---
# run_workflow_parameterSearch4postProc.sh $ROOT_DIR $PATHTOINSERT
source run_workflow_parameterSearch4postProc.sh $ROOT_DIR