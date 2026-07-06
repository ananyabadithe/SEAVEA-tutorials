# Privacy and Reproducibility Cleanup

This repository is being prepared as a shareable SEAVEA tutorial workflow.

## Cleanup goals

The repository should not contain user-specific or machine-specific files such as:

- local virtual environments
- generated FabSim/FabFlee results
- EasyVVUQ campaign databases
- local logs
- SSH credentials
- personal usernames, emails, passwords, or tokens
- private ARCHER2 login details
- machine-specific `machines_user.yml` files

## Ignored local files

The `.gitignore` excludes:

- `.venv/`, `VirtualEnv/`, and other Python environments
- Python cache folders
- Jupyter checkpoint files
- FabSim/FabFlee generated results
- EasyVVUQ campaign files such as `campaign.db`
- generated plots, CSV files, and logs
- local machine configuration files
- SSH keys and environment files

## Reproducibility approach

Users should clone the repository, create their own Python environment, install dependencies from `requirements.txt`, and configure FabSim3 using their own local paths.

Machine-specific configuration should be provided through an example template rather than committed directly.

## Local workflow validated

The following workflow has been validated locally:

1. FabSim3 setup
2. FLEE installation
3. FabFlee plugin installation
4. Mali2012 baseline run
5. EasyVVUQ sensitivity-analysis initialisation
6. EasyVVUQ/FabFlee sensitivity-analysis execution
7. Sensitivity-analysis post-processing

Generated outputs are not committed because they can be recreated by following the tutorial.
