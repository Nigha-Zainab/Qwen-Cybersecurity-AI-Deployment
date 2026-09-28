# Qwen Cybersecurity AI Deployment

Technical deployment and initial evaluation of **Qwen3.8-27B-Uncensored-Cyber** using GGUF, llama.cpp, CUDA, and two NVIDIA Tesla T4 GPUs in a Kaggle cloud-hosted runtime.

## Project Overview

This project demonstrates the deployment and initial functional evaluation of a cybersecurity-focused large language model.

The deployment used:

- Qwen3.8-27B-Uncensored-Cyber
- GGUF format
- IQ4_XS quantization
- llama.cpp
- CUDA GPU acceleration
- 2 × NVIDIA Tesla T4 GPUs
- Kaggle cloud-hosted Linux runtime

The model was tested with cybersecurity-oriented questions covering:

- SIEM
- EDR
- SOC incident analysis

The deployment was completed successfully, including environment verification, CUDA-enabled llama.cpp compilation, GPU detection, model acquisition, SHA-256 integrity verification, model loading, and functional inference testing.

---

## System Environment

| Component | Configuration |
|---|---|
| Platform | Kaggle Cloud Runtime |
| GPU 0 | NVIDIA Tesla T4 — 15,360 MiB |
| GPU 1 | NVIDIA Tesla T4 — 15,360 MiB |
| Total GPU VRAM | Approximately 30 GB |
| System RAM | Approximately 31 GiB |
| CPU Architecture | x86_64 |
| Operating System | Linux |
| Python | 3.12.13 |
| CUDA Toolkit | 12.8.93 |
| NVIDIA Driver | 580.159.04 |
| GCC | 11.4.0 |
| llama.cpp | 0.4.1-dev |
| CUDA Architecture | 75 |

---

## Model Information

| Property | Value |
|---|---|
| Model | Qwen3.8-27B-Uncensored-Cyber |
| Parameter Class | 27B |
| File Format | GGUF |
| Quantization | IQ4_XS |
| Bits per Weight | 4.25 bpw |
| Approximate File Size | 15 GB |
| Modality | Text |

The approximately 15 GB model was used in GGUF format with IQ4_XS quantization.

The model file is **not included in this GitHub repository** because of its large size.

---

## Deployment Architecture

```text
Kaggle Cloud Runtime
        |
        +----------------------+
        |                      |
   Tesla T4 GPU 0        Tesla T4 GPU 1
        |                      |
        +----------+-----------+
                   |
              CUDA Backend
                   |
                llama.cpp
                   |
        Qwen3.8-27B GGUF Model
                   |
              User Prompt
                   |
       Generated Cybersecurity Response

The two Tesla T4 GPUs provide the available GPU resources for inference. llama.cpp uses the CUDA backend and layer-based model splitting to distribute the model across the two GPUs.

Deployment Procedure
1. Verify NVIDIA GPUs

First, verify that the Kaggle runtime provides both Tesla T4 GPUs.

nvidia-smi

The deployment environment detected:

GPU 0: NVIDIA Tesla T4
GPU 1: NVIDIA Tesla T4
2. Install Required Build Tools

Install Git, CMake, and the required build tools.

apt-get update
apt-get install -y git cmake build-essential
3. Clone llama.cpp

Clone the llama.cpp source repository.

git clone --depth 1 https://github.com/ggml-org/llama.cpp.git /kaggle/working/llama.cpp

Move into the llama.cpp directory:

cd /kaggle/working/llama.cpp
4. Configure llama.cpp for CUDA

Configure llama.cpp with CUDA support.

cmake -B build \
  -DGGML_CUDA=ON \
  -DGGML_CUDA_NO_VMM=ON \
  -DCMAKE_CUDA_ARCHITECTURES=75 \
  -DCMAKE_BUILD_TYPE=Release

The configuration detected the CUDA toolkit, NVIDIA CUDA compiler, CUDA architecture 75, NCCL, and CUDA backend.

5. Compile llama.cpp

Build llama.cpp using:

cmake --build build --config Release -j2

The compilation produced the required llama.cpp command-line and server binaries.

6. Detect Available llama.cpp Devices

Run:

./build/bin/llama-cli --list-devices

Expected devices:

CUDA0: Tesla T4
CUDA1: Tesla T4

This confirms that llama.cpp can detect both CUDA devices.

Model Acquisition

The selected model file is:

Qwen3.8-27B-Uncensored-Cyber-IQ4_XS.gguf

The model was approximately 15 GB.

The model should be stored outside the Git repository or downloaded into the Kaggle working directory.

Example location:

/kaggle/working/models/Qwen3.8-27B-Uncensored-Cyber-IQ4_XS.gguf
Model Integrity Verification

A SHA-256 digest was recorded for the downloaded model file.

d11d28b9b253fb7fc9de277a46af5bbd790c000d6bfdfe5648fd7b62ec2560b7

To calculate a SHA-256 hash:

sha256sum /kaggle/working/models/Qwen3.8-27B-Uncensored-Cyber-IQ4_XS.gguf

The recorded digest can then be compared with the calculated digest to verify model-file integrity.

Inference Configuration

The main llama.cpp configuration used during testing was:

-ngl 999
-sm layer
-ts 1,1
-c 4096
-fa on
Parameter Explanation
Option	Purpose
-ngl 999	Attempts to offload as many model layers as possible to GPU
-sm layer	Uses layer-based model splitting
-ts 1,1	Distributes the model across the two GPUs
-c 4096	Sets the context size used during testing
-fa on	Enables Flash Attention

A moderate context size was used for the initial tests to reduce unnecessary memory pressure during deployment validation.

Running the Model

Example command:

./build/bin/llama-cli \
  -m /kaggle/working/models/Qwen3.8-27B-Uncensored-Cyber-IQ4_XS.gguf \
  -ngl 999 \
  -sm layer \
  -ts 1,1 \
  -c 4096 \
  -fa on \
  -p "Your cybersecurity question here"

Example cybersecurity prompt:

Explain what a SIEM is in simple terms and give three common data sources used by a SOC.
Functional Testing

Three cybersecurity-oriented prompts were used to verify the deployed model.

Test Case 1 — SIEM Knowledge
Prompt
Explain what a SIEM is in simple terms and give three common data sources used by a SOC.
Observed Result

The model explained SIEM functionality and identified:

Windows Event Logs
Firewall logs
Endpoint/agent logs
Test Result
PASS
Test Case 2 — EDR Knowledge
Prompt
What is EDR in cybersecurity? Explain in 3 simple points.
Observed Result

The model explained EDR as Endpoint Detection and Response and discussed:

Endpoint monitoring
Telemetry collection
Detection
Response actions
Test Result
PASS
Test Case 3 — SOC Incident Analysis
Prompt
A SOC analyst notices 20 failed login attempts followed by one successful login from the same IP address. Explain what this could indicate and what the analyst should check next.
Observed Result

The model identified the pattern as potentially consistent with brute-force or password-guessing activity.

It recommended checking:

Authentication logs
Source IP address
Target account
Timestamps
Login endpoint
Session activity
Account privileges
Post-authentication behavior
Test Result
PASS
Performance Evaluation

The following values were observed during the individual llama.cpp test runs.

These values are observations from the deployment tests, not a formal benchmark.

Test Run	Prompt Processing	Generation
SIEM	~95.9 tokens/sec	~15.3 tokens/sec
EDR	~87.7 tokens/sec	~15.3 tokens/sec
SOC Incident Analysis	~111.0 tokens/sec	~15.1 tokens/sec

The observed generation speed was approximately:

15 tokens/sec

Actual performance can vary depending on:

Prompt length
Context size
GPU state
Kaggle runtime conditions
Model configuration
Security and Privacy Considerations
Sensitive organizational information should not be entered into a temporary cloud runtime unless permitted by the applicable policy.
AI-generated cybersecurity recommendations should be reviewed and validated before operational use.
Cybersecurity testing should only be performed against systems, networks, accounts, and files for which authorization exists.
Model files, prompts, and generated outputs should be handled according to the sensitivity of the information involved.
A temporary Kaggle runtime should not be treated as a permanent secure storage location.
Limitations

The deployment has several limitations:

The approximately 15 GB model requires substantial GPU memory.
Increasing context size increases memory requirements.
Kaggle working storage and runtime sessions are temporary.
A session reset can remove downloaded and compiled artifacts.
GPU availability and runtime performance may vary between sessions.
The functional evaluation used a small number of cybersecurity prompts rather than a standardized benchmark.
The model can generate technically incorrect or over-broad statements.
Model responses require human verification before operational use.
The final nvidia-smi check was performed after stopping inference and therefore showed idle GPUs. It does not prove simultaneous GPU utilization during generation.
Future Evaluation

Future evaluation can include:

Testing sanitized Windows and Linux log-analysis datasets.
Evaluating structured SOC incident-report generation.
Comparing performance across different context sizes.
Recording GPU memory and utilization during active inference.
Measuring response accuracy against trusted cybersecurity references.
Evaluating hallucination and factual-error rates.
Testing tool-use or agentic workflows only inside authorized laboratory environments.
Retaining deployment configuration and screenshots to support reproducibility.
Repository Structure
Qwen-Cybersecurity-AI-Deployment/
│
├── README.md
├── LICENSE
├── .gitignore
├── run_model.sh
├── testing.md
│
├── commands/
│   └── README.md
│
├── docs/
│   └── README.md
│
├── report/
│   └── Qwen_Cybersecurity_AI_Deployment_Report_By_Nigha.pdf
│
└── screenshots/
Project Files
README.md

Main project documentation and deployment overview.

run_model.sh

Shell script for running the deployed model configuration.

testing.md

Cybersecurity testing scenarios and test information.

commands/

Contains deployment and command documentation.

docs/

Contains supporting project documentation.

report/

Contains the technical deployment and evaluation report.

screenshots/

Contains screenshots documenting the deployment and testing process.

Reproducibility

The project documentation records the following important deployment information:

Hardware configuration
CUDA configuration
llama.cpp build process
GPU device detection
Model filename
Model SHA-256 digest
Inference parameters
Cybersecurity test prompts
Observed performance

This information can be used to reproduce the deployment in a compatible Kaggle environment.

Conclusion

The Qwen3.8-27B-Uncensored-Cyber model was successfully deployed using GGUF and llama.cpp within a Kaggle cloud-hosted runtime equipped with two NVIDIA Tesla T4 GPUs.

The CUDA-enabled llama.cpp build detected both GPUs, the approximately 15 GB quantized model was loaded successfully, and cybersecurity-oriented inference tests completed successfully.

The three functional tests demonstrated responses in:

SIEM knowledge
EDR knowledge
SOC incident analysis

The deployment establishes a working environment for further evaluation of cybersecurity AI capabilities, including SOC assistance, security-log analysis, incident reasoning, and report generation.

AI-generated cybersecurity guidance should be treated as analyst assistance and validated against authoritative technical sources before operational decisions are made.

References
llama.cpp
NVIDIA CUDA documentation
Kaggle documentation
MITRE ATT&CK
Qwen3.8-27B-Uncensored-Cyber GGUF model documentation
Author

Nigha Zainab
Information Security


Project Type: Technical Deployment & Validation

Environment: Kaggle Notebook / Linux
