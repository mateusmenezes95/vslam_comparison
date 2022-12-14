#!/bin/bash

# THIS_PKG_PATH=$(rospack find vslam_comparison)
THIS_PKG_PATH="/home/mateus/container_volumes/ros1_noetic/catkin_ws/src/vslam_comparison"
RESULTS_PATH=$THIS_PKG_PATH'/results'
EVALUATION_SCRIPT=$THIS_PKG_PATH'/scripts/evaluate_ate_scale.py'

TRAJECTORY='straight-line-trajectory'
DATA='orb-slam/mono'

for file in "${RESULTS_PATH}/${DATA}/${TRAJECTORY}"*.txt; do
    filename=$(basename $file)
    echo "Processing ${filename}...";

    # python2 $EVALUATION_SCRIPT --verbose \
    #     --plot "${RESULTS_PATH}/${DATA}/charts/${filename}.pdf" \
    #     --save_results "${RESULTS_PATH}/consolidated-results-hector-slam" \
    #     "${RESULTS_PATH}/ground-truth/${TRAJECTORY}.txt" ${file}

    python2 $EVALUATION_SCRIPT --verbose \
        --plot "${RESULTS_PATH}/${DATA}/charts/${filename}.pdf" \
        --save_results "${RESULTS_PATH}/consolidated-orb-slam3-mono" \
        --scale 5.1857 \
        "${RESULTS_PATH}/ground-truth/${TRAJECTORY}.txt" ${file}
done
