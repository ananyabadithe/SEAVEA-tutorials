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
