#!/bin/bash

set -x

dataset_fn="../../../mistral-io-datasets-vi4io/datasets/job_codings_v3.csv"

crypted_jobids=( )
crypted_jobids=( ${crypted_jobids[@]} 5024292 )  # intensive 
crypted_jobids=( ${crypted_jobids[@]} 7488914 )  # problematic
crypted_jobids=( ${crypted_jobids[@]} 4296426 )  # 1 node, usage of two file systems

for cjobid in ${crypted_jobids[@]}; do
    output_similarities_fn="../../../mistral-io-datasets-vi4io/datasets/job_similarities_$cjobid.csv"
    progress_similarities_fn="../../../mistral-io-datasets-vi4io/datasets/progress_$cjobid.csv"
    cargo run --release -- find_similar --jobid $cjobid --dataset=$dataset_fn --output $output_similarities_fn --progress $progress_similarities_fn
done
