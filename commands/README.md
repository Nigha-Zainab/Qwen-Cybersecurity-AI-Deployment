# Deployment Commands

This directory contains the commands used during the deployment, configuration, verification, and testing of the Qwen Cybersecurity AI model.

The deployment was performed in a Kaggle cloud-hosted Linux environment using two NVIDIA Tesla T4 GPUs, CUDA, and `llama.cpp`.

---

## 1. Environment Preparation

Update the package lists:

```bash
apt-get update
```

Install the required build tools:

```bash
apt-get install -y git cmake build-essential
```

---

## 2. Check NVIDIA GPUs

Verify that the NVIDIA GPUs are available:

```bash
nvidia-smi
```

The deployment environment used two NVIDIA Tesla T4 GPUs.

The detected devices were:

```text
CUDA0: Tesla T4
CUDA1: Tesla T4
```

Each GPU provided approximately 15 GB of GPU memory.

---

## 3. Clone llama.cpp

Clone the `llama.cpp` repository:

```bash
git clone --depth 1 https://github.com/ggml-org/llama.cpp.git /kaggle/working/llama.cpp
```

Move into the `llama.cpp` directory:

```bash
cd /kaggle/working/llama.cpp
```

---

## 4. Configure llama.cpp with CUDA

Configure the build with CUDA support:

```bash
cmake -B build \
  -DGGML_CUDA=ON \
  -DGGML_CUDA_NO_VMM=ON \
  -DCMAKE_CUDA_ARCHITECTURES=75 \
  -DCMAKE_BUILD_TYPE=Release
```

The CUDA architecture value `75` corresponds to the NVIDIA Tesla T4 GPU architecture used in the deployment.

---

## 5. Build llama.cpp

Build `llama.cpp` using the configured build:

```bash
cmake --build build --config Release -j2
```

The build produces the required `llama-cli` executable used for model inference.

---

## 6. List Available llama.cpp Devices

Verify that `llama.cpp` can detect the available CUDA devices:

```bash
./build/bin/llama-cli --list-devices
```

Expected devices:

```text
CUDA0: Tesla T4
CUDA1: Tesla T4
```

---

## 7. Model File

The deployed model was the following GGUF file:

```text
Qwen3.8-27B-Uncensored-Cyber-IQ4_XS.gguf
```

The model was stored in:

```text
/kaggle/working/models/Qwen3.8-27B-Uncensored-Cyber-IQ4_XS.gguf
```

Model format:

```text
GGUF
```

Quantization:

```text
IQ4_XS
```

Approximate model size:

```text
15 GB
```

---

## 8. Verify Model Integrity

Calculate the SHA-256 checksum of the downloaded model:

```bash
sha256sum /kaggle/working/models/Qwen3.8-27B-Uncensored-Cyber-IQ4_XS.gguf
```

The checksum recorded during the deployment was:

```text
d11d28b9b253fb7fc9de277a46af5bbd790c000d6bfdfe5648fd7b62ec2560b7
```

This checksum can be used to verify that the model file matches the tested model artifact.

---

## 9. Run the Model on Two GPUs

The model was configured for multi-GPU inference using the two Tesla T4 GPUs.

Run:

```bash
./build/bin/llama-cli \
  -m /kaggle/working/models/Qwen3.8-27B-Uncensored-Cyber-IQ4_XS.gguf \
  -ngl 999 \
  -sm layer \
  -ts 1,1 \
  -c 8192 \
  -fa on
```

### Main inference parameters

| Parameter | Description |
|---|---|
| `-m` | Specifies the GGUF model file |
| `-ngl 999` | Enables GPU layer offloading |
| `-sm layer` | Uses layer-based model splitting |
| `-ts 1,1` | Splits the model across the two GPUs |
| `-c 8192` | Sets the context size to 8192 tokens |
| `-fa on` | Enables Flash Attention |

---

## 10. Alternative Context Size

The deployment report also documented testing with a 4096-token context configuration.

Example:

```bash
./build/bin/llama-cli \
  -m /kaggle/working/models/Qwen3.8-27B-Uncensored-Cyber-IQ4_XS.gguf \
  -ngl 999 \
  -sm layer \
  -ts 1,1 \
  -c 4096 \
  -fa on
```

The context size can affect memory requirements and inference behavior.

---

## 11. Cybersecurity Functional Testing

The deployed model was tested using cybersecurity-focused scenarios.

The main test categories were:

- SIEM analysis
- EDR analysis
- SOC incident analysis
- Authentication anomalies
- Security monitoring

---

### SIEM Test

The SIEM test evaluated whether the model could identify relevant security log sources and explain their use in security monitoring.

The model identified sources including:

- Windows Event Logs
- Firewall logs
- Endpoint/agent logs

**Result:** PASS

---

### EDR Test

The EDR test evaluated endpoint detection and response concepts.

The model discussed:

- Endpoint monitoring
- Endpoint telemetry
- Threat detection
- Incident response

**Result:** PASS

---

### SOC Incident Test

The SOC scenario involved:

```text
20 failed login attempts
followed by
1 successful login
from the same IP address
```

The model identified the pattern as potentially consistent with:

```text
Brute-force or password-guessing activity
```

The model recommended examining:

- Authentication logs
- Source IP address
- Target account
- Event timestamps
- Login endpoint
- Session activity
- Account privileges
- Post-authentication behavior

**Result:** PASS

---

## 12. Performance Observation

The deployment included interactive inference performance observations.

Observed generation speeds were approximately:

| Test | Generation Speed |
|---|---:|
| SIEM | 15.3 tokens/sec |
| EDR | 15.3 tokens/sec |
| SOC | 15.1 tokens/sec |

The approximate overall observed generation speed was:

```text
~15.3 tokens/second
```

These measurements are individual observations from the tested Kaggle environment and configuration. They are not intended to represent a formal benchmark.

---

## 13. Deployment Sequence

The general deployment workflow was:

```text
1. Start Kaggle GPU environment
        ↓
2. Verify NVIDIA GPUs
        ↓
3. Install required build tools
        ↓
4. Clone llama.cpp
        ↓
5. Configure llama.cpp with CUDA
        ↓
6. Build llama.cpp
        ↓
7. Verify available CUDA devices
        ↓
8. Place/download the GGUF model
        ↓
9. Verify SHA-256 checksum
        ↓
10. Configure multi-GPU inference
        ↓
11. Run llama-cli
        ↓
12. Perform cybersecurity inference tests
        ↓
13. Record performance observations
```

---

## 14. Quick Command Reference

### GPU verification

```bash
nvidia-smi
```

### Clone llama.cpp

```bash
git clone --depth 1 https://github.com/ggml-org/llama.cpp.git /kaggle/working/llama.cpp
```

### Enter llama.cpp

```bash
cd /kaggle/working/llama.cpp
```

### Configure CUDA build

```bash
cmake -B build \
  -DGGML_CUDA=ON \
  -DGGML_CUDA_NO_VMM=ON \
  -DCMAKE_CUDA_ARCHITECTURES=75 \
  -DCMAKE_BUILD_TYPE=Release
```

### Build

```bash
cmake --build build --config Release -j2
```

### List devices

```bash
./build/bin/llama-cli --list-devices
```

### Verify model checksum

```bash
sha256sum /kaggle/working/models/Qwen3.8-27B-Uncensored-Cyber-IQ4_XS.gguf
```

### Run model

```bash
./build/bin/llama-cli \
  -m /kaggle/working/models/Qwen3.8-27B-Uncensored-Cyber-IQ4_XS.gguf \
  -ngl 999 \
  -sm layer \
  -ts 1,1 \
  -c 8192 \
  -fa on
```

---

## 15. Important Notes

- The deployment was performed in a Kaggle cloud-hosted Linux environment.
- The runtime used two NVIDIA Tesla T4 GPUs.
- The model was deployed in GGUF IQ4_XS format.
- The model requires substantial GPU memory, and the available memory can vary between runtime sessions.
- Kaggle working storage and runtime environments are temporary.
- Increasing the context size can increase memory requirements.
- AI-generated cybersecurity analysis should be validated before being used for operational security decisions.
- Sensitive organizational information should not be entered into a temporary cloud environment unless the use of that environment is authorized.
- The cybersecurity tests were performed for authorized evaluation purposes.

---

## 16. Reproducibility

The commands in this document describe the deployment configuration used for the project.

For reproducibility, retain:

- Model filename
- Model SHA-256 checksum
- `llama.cpp` build configuration
- CUDA configuration
- GPU information
- Inference parameters
- Test prompts
- Performance observations
- Relevant screenshots and logs

---

## References

- llama.cpp: https://github.com/ggml-org/llama.cpp
- NVIDIA CUDA: https://developer.nvidia.com/cuda-toolkit
- Kaggle: https://www.kaggle.com/
- MITRE ATT&CK: https://attack.mitre.org/

---

## Author

**Nigha Zainab**

Information Security 

Technical Deployment & Validation

Roll No: UOC-ITF24-033

Instructor: Mr Nastalique Tariq
