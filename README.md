
[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/ananyabadithe/SEAVEA-tutorials/master?urlpath=lab)

## Setup guides by operating system

Use the guide for your operating system:

* Linux: [docs/setup_linux.md](docs/setup_linux.md)
* Windows using WSL2: [docs/setup_windows_wsl.md](docs/setup_windows_wsl.md)
* macOS: [docs/setup_macos.md](docs/setup_macos.md)

Windows users should use WSL2 Ubuntu for the full FabSim3/FLEE/FabFlee workflow. Native Windows PowerShell or Command Prompt is not currently recommended for the full workflow.

For common setup issues, see:

* Troubleshooting: [docs/troubleshooting.md](docs/troubleshooting.md)
* Validation log: [docs/validation_log.md](docs/validation_log.md)

## Run in Binder

The tutorials can be launched in a temporary browser-based JupyterLab environment using Binder:

[Launch Binder](https://mybinder.org/v2/gh/ananyabadithe/SEAVEA-tutorials/master?urlpath=lab)

Binder is intended for lightweight tutorial exploration. For the full FabSim3/FLEE/FabFlee workflow, use the local setup guides.

## Running the tutorials

You can run the tutorials in three ways:

1. Local setup using the OS-specific guides in `docs/`
2. Binder for a temporary browser-based JupyterLab session
3. Docker using the `seavealite` image for a reproducible local container environment

### Docker quick start

Build the lightweight tutorial image:

```bash
docker build -t seavealite .
```

Run JupyterLab:

```bash
docker run --rm -p 8888:8888 seavealite
```

Then open the JupyterLab URL printed in the terminal.

If port `8888` is already in use, run:

```bash
docker run --rm -p 8889:8888 seavealite
```

Then open the printed URL using port `8889`.

For full Docker instructions, see:

* Docker setup: [docs/docker.md](docs/docker.md)

## Reproducibility and privacy

Local virtual environments, generated results, EasyVVUQ campaign databases, logs, SSH credentials, and machine-specific configuration files are intentionally excluded from version control.

See [PRIVACY_AND_REPRODUCIBILITY.md](PRIVACY_AND_REPRODUCIBILITY.md) for details.

