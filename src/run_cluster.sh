#!/bin/bash

label="debug"
dataset_fn="../../datasets/job_codings_v3.csv"
output_fn="../../debug/job_codings_clusters_$label.csv"
progress_fn="../../debug/progress_$label.csv"

set -x
rm $output_fn
rm $progress_fn
cargo run --release -- cluster --dataset=$dataset_fn --output $output_fn --progress $progress_fn --nrows 1000
