#!/bin/bash

# Qwen Cybersecurity AI - llama.cpp inference launcher

MODEL="/kaggle/working/models/Qwen3.8-27B-Uncensored-Cyber-IQ4_XS.gguf"
LLAMA_CLI="./build/bin/llama-cli"

# Check that llama-cli exists
if [ ! -f "$LLAMA_CLI" ]; then
    echo "Error: llama-cli was not found at $LLAMA_CLI"
    echo "Build llama.cpp before running this script."
    exit 1
fi

# Check that the model exists
if [ ! -f "$MODEL" ]; then
    echo "Error: Model file was not found:"
    echo "$MODEL"
    exit 1
fi

echo "Starting Qwen Cybersecurity AI..."
echo "Model: $MODEL"
echo "GPU configuration: 2 × Tesla T4"
echo "Context size: 8192"

"$LLAMA_CLI" \
    -m "$MODEL" \
    -ngl 999 \
    -sm layer \
    -ts 1,1 \
    -c 8192 \
    -fa on
