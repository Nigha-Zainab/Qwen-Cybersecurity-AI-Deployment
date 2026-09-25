# Qwen Cybersecurity AI Deployment Report

## Project Information

| Field | Details |
|---|---|
| Project Title | Local Qwen Cybersecurity AI Deployment |
| Student | Nigha Zainab |
| Program | Computer Science |
| Project Type | Cybersecurity AI / Local LLM Deployment |
| Platform | Kaggle |
| Inference Framework | llama.cpp |
| GPU Environment | 2 × NVIDIA Tesla T4 |
| Model | Qwen 27B Cybersecurity GGUF |
| Quantization | IQ4_XS |
| Deployment Status | Successfully Tested |

---

# 1. Executive Summary

This project documents the deployment and testing of a locally hosted Qwen cybersecurity-focused large language model using the llama.cpp inference framework.

The model was deployed in a Kaggle GPU environment equipped with two NVIDIA Tesla T4 GPUs. The GGUF model was configured for GPU offloading and multi-GPU inference.

The deployment workflow included environment preparation, llama.cpp compilation, model acquisition, SHA256 verification, GPU configuration, model execution, and cybersecurity-focused testing.

The model was tested using practical cybersecurity topics including SIEM, EDR, SOC analysis, authentication anomalies, and security monitoring.

An observed inference performance of approximately 15.3 tokens per second was recorded during interactive testing.

This report documents the deployment process, technical observations, testing activities, and limitations of the experimental environment.

---

# 2. Alert / Test Details

## 2.1 Test Objective

The objective of this project was to deploy a cybersecurity-focused local AI model and evaluate its ability to provide cybersecurity-related analysis in a controlled environment.

## 2.2 Environment

The deployment was performed using:

- Kaggle cloud-hosted Linux environment
- 2 × NVIDIA Tesla T4 GPUs
- CUDA-enabled llama.cpp
- Qwen 27B cybersecurity GGUF model
- IQ4_XS quantization
- 8192-token context configuration

## 2.3 Model

The model used during the project was:

```text
Qwen3.8-27B-Uncensored-Cyber-IQ4_XS.gguf

# 3. Deployment Timeline

| Stage | Activity |
|---|---|
| 1 | Started Kaggle GPU environment |
| 2 | Verified NVIDIA Tesla T4 GPUs |
| 3 | Cloned llama.cpp |
| 4 | Configured CUDA-enabled build |
| 5 | Built llama.cpp |
| 6 | Downloaded Qwen cybersecurity GGUF model |
| 7 | Verified SHA256 checksum |
| 8 | Configured multi-GPU inference |
| 9 | Started the model using llama-cli |
| 10 | Performed cybersecurity-focused testing |
| 11 | Recorded performance observations |
| 12 | Documented the deployment workflow in GitHub |

# 4. Technical Analysis

## 4.1 llama.cpp Deployment

llama.cpp was used as the inference framework for running the GGUF model.

The CUDA-enabled environment allowed the model to use the available NVIDIA GPUs.

The project used GPU layer offloading and a two-GPU configuration.

## 4.2 GPU Configuration

The environment contained two NVIDIA Tesla T4 GPUs.

GPU availability was verified using:

```bash
nvidia-smi

## 4.3 Model Verification

After downloading the model, its integrity was checked using SHA256.

The verification command was:

```bash
sha256sum /kaggle/working/models/Qwen3.8-27B-Uncensored-Cyber-IQ4_XS.gguf

## 4.4 Model Execution

The model was executed using `llama-cli` with GPU offloading and the configured two-GPU setup.

The execution command was:

```bash
./build/bin/llama-cli \
-m /kaggle/working/models/Qwen3.8-27B-Uncensored-Cyber-IQ4_XS.gguf \
-ngl 999 \
-sm layer \
-ts 1,1 \
-c 8192 \
-fa on

# 5. Cybersecurity Testing

## 5.1 SIEM Analysis

The model was tested with questions related to Security Information and Event Management (SIEM).

The test evaluated whether the model could provide a basic cybersecurity explanation of security event collection, correlation, and monitoring.

## 5.2 EDR Analysis

The model was also tested with Endpoint Detection and Response (EDR) related questions.

The test focused on the model's ability to explain endpoint monitoring and security detection concepts.

## 5.3 SOC Analysis

A SOC-oriented authentication scenario was used:

```text
20 failed login attempts
followed by
1 successful login

# 6. Performance Observation

During interactive testing, an inference speed of approximately:

```text
15.3 tokens/second

# 6. Performance Observation

During interactive testing, an inference speed of approximately:

```text
15.3 tokens/second

# 8. Recommendations

For future development and testing, the following improvements can be considered:

- Test a larger set of cybersecurity scenarios.
- Evaluate structured SOC alert analysis.
- Test log-analysis workflows using sanitized datasets.
- Compare responses across different cybersecurity models.
- Evaluate response consistency and accuracy.
- Integrate structured input formats for security events.
- Evaluate longer-context cybersecurity investigations.
- Test additional GPU configurations.
- Develop a controlled API or web interface for the model.
- Perform more systematic benchmarking.

# 9. Limitations

This project represents an experimental deployment and testing environment.

The following limitations apply:

- The deployment was performed in a temporary Kaggle environment.
- Kaggle working storage is ephemeral.
- The model was tested using a limited set of cybersecurity scenarios.
- No production SOC integration was performed.
- No real organizational security data was used.
- The observed performance is specific to the tested environment.
- Model responses were not treated as authoritative security decisions.
- The project does not represent a production-ready security monitoring platform.

# 10. Analyst / Project Notes

The project demonstrated the practical process of deploying a large cybersecurity-focused language model in a GPU-enabled environment.

The work involved Linux command-line operations, CUDA-enabled model deployment, GPU verification, model integrity verification, multi-GPU configuration, cybersecurity testing, and technical documentation.

The deployment also demonstrated how a local cybersecurity AI model can be evaluated in a controlled environment without directly connecting it to a production security infrastructure.

# 11. Repository Evidence

Supporting project evidence is maintained in the GitHub repository.

The repository contains:

- Deployment commands
- Model execution script
- Testing documentation
- Deployment documentation
- Screenshots
- Project README
- Report documentation

The approximately 15 GB model file is intentionally not included in the repository.

# 12. Conclusion

The project successfully demonstrated the deployment and interactive testing of a Qwen cybersecurity-focused GGUF model using llama.cpp in a two-GPU Kaggle environment.

The deployment workflow covered model preparation, GPU configuration, integrity verification, execution, cybersecurity testing, and performance observation.

The resulting documentation provides a reproducible record of the experimental deployment and establishes a foundation for future cybersecurity AI experimentation.
