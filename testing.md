# Cybersecurity AI Testing

This document describes the functional testing and performance observations performed after deploying the Qwen Cybersecurity AI model with `llama.cpp`, CUDA, and two NVIDIA Tesla T4 GPUs.

---

## 1. Testing Environment

The tests were performed in a Kaggle cloud-hosted Linux environment.

### Hardware

| Component | Configuration |
|---|---|
| GPU | 2 × NVIDIA Tesla T4 |
| GPU Memory | Approximately 15 GB per GPU |
| Total GPU Memory | Approximately 30 GB |
| CPU Architecture | x86_64 |
| RAM | Approximately 31 GiB |

### Software

| Component | Version / Configuration |
|---|---|
| Python | 3.12.13 |
| CUDA Toolkit | 12.8.93 |
| NVIDIA Driver | 580.159.04 |
| GCC | 11.4.0 |
| llama.cpp | 0.4.1-dev |
| CUDA Architecture | 75 |

---

## 2. Testing Objectives

The functional tests were designed to determine whether the deployed model could provide relevant cybersecurity-oriented responses in three areas:

1. SIEM analysis
2. EDR analysis
3. SOC incident analysis

The tests were intended as functional validation rather than a formal benchmark.

---

# 3. SIEM Analysis Test

## Test Objective

Evaluate whether the model can identify and explain common security log sources used in SIEM-related monitoring.

## Test Scenario

The model was prompted with a cybersecurity question related to SIEM analysis and security log sources.

## Expected Behavior

The model should identify relevant sources of security telemetry and explain their usefulness for monitoring and investigation.

## Observed Response

The model identified security-relevant sources including:

- Windows Event Logs
- Firewall logs
- Endpoint/agent logs

## Result

**PASS**

The response demonstrated that the deployed model could provide relevant SIEM-oriented information.

---

# 4. EDR Analysis Test

## Test Objective

Evaluate the model's ability to explain endpoint detection and response concepts.

## Test Scenario

The model was prompted with a cybersecurity question concerning EDR and endpoint security monitoring.

## Expected Behavior

The model should describe endpoint monitoring, telemetry, detection, and response concepts.

## Observed Response

The model discussed:

- Endpoint monitoring
- Endpoint telemetry
- Threat detection
- Incident response

## Result

**PASS**

The response demonstrated relevant understanding of EDR concepts.

---

# 5. SOC Incident Analysis Test

## Test Objective

Evaluate whether the model can recognize a potentially suspicious authentication pattern and suggest appropriate investigation steps.

## Test Scenario

The following authentication pattern was provided:

```text
20 failed login attempts
followed by
1 successful login
from the same IP address
```

## Expected Behavior

The model should recognize that the authentication pattern may indicate suspicious activity and recommend relevant investigation steps.

## Observed Response

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

## Result

**PASS**

The response provided relevant security investigation steps for the supplied authentication scenario.

---

# 6. Functional Test Summary

| Test | Security Area | Result |
|---|---|---|
| Test 1 | SIEM analysis | PASS |
| Test 2 | EDR analysis | PASS |
| Test 3 | SOC incident analysis | PASS |

All three documented functional tests produced relevant cybersecurity-oriented responses.

---

# 7. Performance Evaluation

Interactive inference performance was also recorded during the tests.

The measurements included prompt processing speed and generation speed.

| Test | Prompt Processing | Generation |
|---|---:|---:|
| SIEM | ~95.9 tokens/sec | ~15.3 tokens/sec |
| EDR | ~87.7 tokens/sec | ~15.3 tokens/sec |
| SOC | ~111.0 tokens/sec | ~15.1 tokens/sec |

The observed generation speed was approximately:

```text
~15.3 tokens/second
```

These values are individual observations from the tested Kaggle environment and configuration.

They should **not** be interpreted as a formal benchmark.

---

# 8. Performance Interpretation

The recorded tests showed generation speeds of approximately 15 tokens per second across the three interactive cybersecurity scenarios.

Prompt-processing performance varied between tests.

The differences can be affected by factors such as:

- Prompt length
- Context size
- Runtime conditions
- GPU availability
- Model configuration

The recorded values represent the specific deployment session documented in the project report.

---

# 9. Testing Limitations

The testing performed in this project has several limitations:

- Only three primary functional scenarios were evaluated.
- The tests were not designed as a formal benchmark.
- The cybersecurity prompts were limited in number.
- Model responses may contain inaccuracies or hallucinations.
- Performance can vary between Kaggle runtime sessions.
- GPU utilization was not continuously measured during every inference test.
- The final GPU state after inference should not be interpreted as proof of simultaneous GPU utilization throughout the complete inference process.

---

# 10. Security Considerations

The model should be treated as an AI-assisted cybersecurity analysis system rather than an authoritative security decision-making system.

AI-generated cybersecurity responses should be reviewed and validated before being used in operational environments.

Sensitive organizational information should not be entered into a temporary cloud-hosted environment unless its use is authorized.

Testing should only be performed against systems, logs, accounts, and data for which appropriate authorization exists.

---

# 11. Recommended Future Testing

Future evaluation can expand the testing methodology by including:

- Sanitized Windows log analysis
- Sanitized Linux log analysis
- Structured SOC incident reports
- Different prompt and context sizes
- Active GPU memory measurements
- Active GPU utilization measurements
- Trusted cybersecurity references for response validation
- Hallucination-rate evaluation
- Larger cybersecurity test sets
- Authorized agentic cybersecurity workflows

---

# 12. Conclusion

The documented functional tests demonstrated that the deployed model could generate relevant responses for SIEM, EDR, and SOC-oriented cybersecurity scenarios.

The observed generation performance was approximately 15.3 tokens per second under the tested configuration.

These results provide functional validation of the deployment, while the limited test set and runtime variability mean that additional evaluation would be required for a more comprehensive performance and reliability assessment.

---

## Author

**Nigha Zainab**

Information Security — 5th Semester

Technical Deployment & Validation
