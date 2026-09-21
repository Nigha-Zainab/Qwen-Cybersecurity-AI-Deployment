# Deployment Commands

This directory contains the commands used during the Qwen Cybersecurity AI deployment.

## 1. Clone llama.cpp

```bash
git clone https://github.com/ggerganov/llama.cpp.git
cd llama.cpp

## 2. Build llama.cpp

```bash
cmake --build build --config Release -j2

## 3. Check NVIDIA GPUs

```bash
nvidia-smi

## 4. Verify the Model

```bash
sha256sum /kaggle/working/models/Qwen3.8-27B-Uncensored-Cyber-IQ4_XS.gguf

## 5. Run the Model

```bash
./build/bin/llama-cli \
-m /kaggle/working/models/Qwen3.8-27B-Uncensored-Cyber-IQ4_XS.gguf \
-ngl 999 \
-sm layer \
-ts 1,1 \
-c 8192 \
-fa on


## 6. Main Parameters

| Parameter | Description |
|---|---|
| `-m` | Specifies the GGUF model file |
| `-ngl 999` | Enables GPU layer offloading |
| `-sm layer` | Uses layer-based model splitting |
| `-ts 1,1` | Uses a two-GPU split configuration |
| `-c 8192` | Sets the context size |
| `-fa on` | Enables Flash Attention |

## 7. Cybersecurity Testing

The deployed model was tested using cybersecurity-focused scenarios related to:

- SIEM analysis
- EDR analysis
- SOC analysis
- Authentication anomalies
- Security monitoring

### Example SOC Scenario

```text
20 failed login attempts
followed by
1 successful login
## 8. Performance Observation

An observed inference speed of approximately:

15.3 tokens/second

was recorded during interactive testing.

This result is specific to the tested Kaggle environment and configuration.

## 9. Model Location

The model was stored at:

```text
/kaggle/working/models/Qwen3.8-27B-Uncensored-Cyber-IQ4_XS.gguf

## 10. Deployment Sequence

The general deployment workflow was:

```text
1. Start Kaggle GPU environment
        ↓
2. Verify NVIDIA GPUs
        ↓
3. Clone llama.cpp
        ↓
4. Build llama.cpp with CUDA
        ↓
5. Download GGUF model
        ↓
6. Verify SHA256 checksum
        ↓
7. Configure GPU offloading
        ↓
8. Run llama-cli
        ↓
9. Perform cybersecurity inference tests
        ↓
10. Record performance results

---

## Notes

These commands document the commands used during the project deployment and testing.

The project was performed in a Kaggle cloud-hosted Linux environment, and the Kaggle working directory is ephemeral.
