# Docker setup

This guide explains how to run the SEAVEA tutorials in a Docker container.

Docker provides a reproducible Linux-based environment for running the tutorial notebooks without manually recreating the full local Python setup.

This Docker image is called `seavealite`, representing a lightweight SEAVEA tutorial environment.

## What Docker provides

Docker builds an image from the repository configuration. That image contains the Python/Jupyter tutorial environment. When the image is run, Docker starts a container, which is a live running copy of that environment.

In this repository:

- the Docker image is the reusable tutorial environment: `seavealite`
- the Docker container is the running JupyterLab session created from that image

## Prerequisites

Install Docker:

- Windows: Docker Desktop with WSL 2 integration enabled
- Linux: Docker Engine
- macOS: Docker Desktop

Confirm Docker works:

```bash
docker --version
docker run hello-world
