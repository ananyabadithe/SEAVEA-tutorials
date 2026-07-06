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
