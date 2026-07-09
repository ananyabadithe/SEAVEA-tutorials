# Validation Log

This document records the validation checks performed on the SEAVEA tutorials repository after the reproducibility and setup-guide cleanup.

## Repository validation

The repository was tested from a fresh clone to confirm that the tutorial materials are accessible and do not rely on local-only files.

Checks completed:

- Fresh clone completed successfully.
- `README.md` links to the setup guides were present.
- OS-specific setup guides were present:
  - `docs/setup_linux.md`
  - `docs/setup_windows_wsl.md`
  - `docs/setup_macos.md`
- Troubleshooting guide was present:
  - `docs/troubleshooting.md`
- Privacy scan showed no personal paths or personal email addresses.
- Generated files, virtual environments, results, campaign databases, and local machine configs are excluded through `.gitignore`.

## Notebook environment validation

The notebook setup script was tested from a clean virtual environment.

Command tested:
```bash
bash scripts/setup_notebook_env.sh

## Binder / repo2docker validation

Date: 2026-07-08

Branch: binder-docker-setup

Validation performed:
- Built repository environment locally with `jupyter-repo2docker --no-run .`
- Launched local repo2docker JupyterLab session with `jupyter-repo2docker .`
- Ran `python scripts/binder_smoke_test.py` inside the repo2docker JupyterLab environment

Result:
- JupyterLab launched successfully.
- Python imports succeeded for numpy, pandas, matplotlib, and easyvvuq.
- Binder smoke test passed.

Observed package versions inside repo2docker:
- Python 3.10.19
- NumPy 1.26.4
- Pandas 2.3.3
- Matplotlib 3.10.9
- EasyVVUQ 1.3

Notes:
- This validates the lightweight Binder environment locally using repo2docker.
- The full FabSim3/FLEE/FabFlee Mali2012 EasyVVUQ workflow remains validated locally outside Binder.

Additional online Binder validation:
- Launched Binder from the `binder-docker-setup` branch.
- Ran `python scripts/binder_smoke_test.py` in the online Binder session.
- Smoke test passed.
