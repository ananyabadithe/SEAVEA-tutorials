## Setup guides by operating system

Use the guide for your operating system:

- Linux: [docs/setup_linux.md](docs/setup_linux.md)
- Windows using WSL2: [docs/setup_windows_wsl.md](docs/setup_windows_wsl.md)
- macOS: [docs/setup_macos.md](docs/setup_macos.md)

Windows users should use WSL2 Ubuntu for the full FabSim3/FLEE/FabFlee workflow. Native Windows PowerShell or Command Prompt is not currently recommended because the workflow uses Unix-style paths, Bash commands, and SSH-based localhost execution.

For common setup issues, see:

- Troubleshooting: [docs/troubleshooting.md](docs/troubleshooting.md)
- Validation log: [docs/validation_log.md](docs/validation_log.md)

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/ananyabadithe/SEAVEA-tutorials/master?urlpath=lab)

## Run in Binder

The tutorials can be launched in a temporary browser-based JupyterLab environment using Binder:

[Launch Binder](https://mybinder.org/v2/gh/ananyabadithe/SEAVEA-tutorials/master?urlpath=lab)

Binder is intended for lightweight tutorial exploration. For the full FabSim3/FLEE/FabFlee workflow, use the local setup guides.

## Reproducibility and privacy

Local virtual environments, generated results, EasyVVUQ campaign databases, logs, SSH credentials, and machine-specific configuration files are intentionally excluded from version control.

See [PRIVACY_AND_REPRODUCIBILITY.md](PRIVACY_AND_REPRODUCIBILITY.md) for details.


# SEAVEA-tutorials
Repository containing tutorial materials for the VECMAtk components

## Environment setup

### Prerequisites

- Python 3.10
- Git
- `pip`

Python 3.14 is currently unsupported because some dependencies require NumPy 1.x.

### Windows

From the repository root, create a virtual environment using Python 3.10:

```powershell
py -3.10 -m venv .venv

## Local setup notes

This repository is intended to be shareable and reproducible. Local environments, generated results, campaign databases, logs, and machine-specific configuration files are ignored by Git.

For a new user:

1. Clone this repository.
2. Create a Python virtual environment.
3. Install dependencies from `requirements.txt`.
4. Clone and configure FabSim3, FLEE, and FabFlee.
5. Copy `examples/machines_user.example.yml` to the FabSim3 deployment configuration as `machines_user.yml`.
6. Edit the copied `machines_user.yml` with local paths for `FabSim3`, `FLEE`, and FabSim results.
7. Run the Mali2012 baseline and EasyVVUQ sensitivity-analysis workflow.

See `PRIVACY_AND_REPRODUCIBILITY.md` for details on what is intentionally excluded from version control.
