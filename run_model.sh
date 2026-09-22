#!/bin/bash

MODEL="/kaggle/working/models/Qwen3.8-27B-Uncensored-Cyber-IQ4_XS.gguf"

./build/bin/llama-cli \
-m "$MODEL" \
-ngl 999 \
-sm layer \
-ts 1,1 \
-c 8192 \
-fa on
