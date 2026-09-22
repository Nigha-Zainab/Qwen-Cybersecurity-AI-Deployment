# Cybersecurity Model Testing

## 1. Testing Overview

The deployed Qwen cybersecurity model was tested using practical cybersecurity scenarios to evaluate its ability to provide security-focused analysis.

The testing was performed in the Kaggle GPU environment using the locally deployed GGUF model.

## 2. Test Environment

| Component | Configuration |
|---|---|
| Platform | Kaggle |
| Operating System | Linux |
| GPU | 2 × NVIDIA Tesla T4 |
| Model | Qwen 27B Cybersecurity GGUF |
| Quantization | IQ4_XS |
| Inference Engine | llama.cpp |
| Context Size | 8192 tokens |

## 3. Test Scenarios

The model was tested with the following cybersecurity topics:

- SIEM
- EDR
- SOC analysis
- Authentication anomalies
- Security monitoring

## 4. SOC Authentication Scenario

### Scenario

```text
20 failed login attempts
followed by
1 successful login
