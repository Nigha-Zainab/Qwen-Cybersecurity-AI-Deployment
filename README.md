# Qwen Cybersecurity AI Deployment

## Multi-GPU Cybersecurity AI Inference using llama.cpp, CUDA and NVIDIA Tesla T4 GPUs

![CUDA](https://img.shields.io/badge/CUDA-12.8-green)
![llama.cpp](https://img.shields.io/badge/llama.cpp-0.4.1--dev-orange)
![GPU](https://img.shields.io/badge/GPU-2x%20NVIDIA%20Tesla%20T4-purple)
![Model](https://img.shields.io/badge/Model-Qwen%2027B-red)
![Format](https://img.shields.io/badge/Format-GGUF-yellow)

---

## Project Overview

This project documents the deployment and testing of a 27B-parameter cybersecurity-focused Qwen model in GGUF format using llama.cpp, CUDA acceleration, and two NVIDIA Tesla T4 GPUs.

The deployment was performed in a Kaggle cloud-hosted Linux environment.

The project focuses on:

- Linux-based AI deployment
- CUDA configuration
- NVIDIA GPU detection
- llama.cpp compilation
- GGUF model deployment
- Multi-GPU inference
- Model integrity verification
- Cybersecurity-focused inference testing
- Performance observation
- Technical documentation

---

## Objectives

The main objectives of this project were to:

1. Build llama.cpp with CUDA support.
2. Configure the environment for NVIDIA Tesla T4 GPUs.
3. Deploy a 27B cybersecurity-focused GGUF model.
4. Test inference using GPU acceleration.
5. Explore multi-GPU model execution.
6. Verify the downloaded model using SHA256.
7. Test the model with practical cybersecurity scenarios.
8. Document the deployment workflow.


---

## Architecture

```text
                  Kaggle Linux Environment
                           |
                           |
                    CUDA 12.8 Toolkit
                           |
                           |
                       llama.cpp
                           |
              +------------+------------+
              |                         |
       NVIDIA Tesla T4           NVIDIA Tesla T4
        ~14.9 GB VRAM             ~14.9 GB VRAM
              |                         |
              +------------+------------+
                           |
                           |
                Qwen 27B Cyber Model
                  GGUF IQ4_XS
                           |
                           |
                    llama-cli
                           |
                           |
              Cybersecurity Inference
                           |
          +----------------+----------------+
          |                |                |
         SIEM             EDR          SOC Analysis
       Analysis         Analysis        Scenarios
---

## Model

### Model Used

**Qwen3.8-27B-Uncensored-Cyber-IQ4_XS.gguf**

| Property | Value |
|---|---|
| Model | Qwen3.8-27B-Uncensored-Cyber |
| Format | GGUF |
| Quantization | IQ4_XS |
| Approximate Size | 14.96 GB |
| Quantization Rate | ~4.25 bpw |

The model was downloaded and tested in the Kaggle environment.

Local model path used during testing:

```text
/kaggle/working/models/Qwen3.8-27B-Uncensored-Cyber-IQ4_XS.gguf

---

## Deployment

### 1. Clone llama.cpp

```bash
git clone https://github.com/ggerganov/llama.cpp.git
cd llama.cpp

---

## Cybersecurity Testing

After deployment, the model was tested with practical cybersecurity scenarios.

### Test 1 — SIEM Analysis

The model was asked to explain SIEM concepts and security monitoring workflows.

The test covered:

- Security event monitoring
- Log analysis
- Alert generation
- Security event correlation
- SOC monitoring workflows

The model generated a structured cybersecurity-oriented response.

---

### Test 2 — EDR Analysis

The model was tested with an Endpoint Detection and Response (EDR) scenario.

The test focused on:

- Endpoint telemetry
- Suspicious activity
- Detection concepts
- Investigation workflow
- Analyst reasoning

---

### Test 3 — SOC Analyst Scenario

A simulated authentication scenario was provided:

```text
20 failed login attempts
followed by
1 successful login

---

## Performance Results

During interactive inference testing, an observed generation speed of approximately:

**15.3 tokens/second**

was recorded in the tested configuration.

This is an observed result from the Kaggle environment and should not be treated as a universal benchmark.

Performance can vary depending on:

- Prompt length
- Context size
- GPU utilization
- Model configuration
- Quantization
- CUDA environment
- System load

The project focused primarily on successful deployment and cybersecurity inference testing rather than formal benchmarking.

---

## Troubleshooting

Several practical issues were encountered during the deployment process.

### CUDA Build Issue

The initial CUDA build encountered a linking/configuration issue related to the CUDA driver library.

The build configuration was adjusted and llama.cpp was successfully compiled afterward.

### Kaggle Runtime Reset

Kaggle working storage is temporary.

After restarting the Kaggle session, files stored in `/kaggle/working` were no longer available. This meant the deployment steps had to be repeated:

```text
Clone
→ Build
→ Download Model
→ Verify Model
→ Run Inference
---

## Repository Structure

```text
Qwen-Cybersecurity-AI-Deployment/
│
├── README.md
├── .gitignore
│
├── docs/
│   └── README.md
│
├── report/
│
├── screenshots/
│
├── commands/
│   └── README.md
│
└── results/
    └── README.md
