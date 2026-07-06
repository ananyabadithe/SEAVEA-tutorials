# macOS Setup Guide

This guide explains how to set up the SEAVEA tutorial workflow on macOS.

Recommended environment:

- macOS with Terminal
- Homebrew
- Python 3.10 or newer
- Git
- OpenSSH

## 1. Install Homebrew

If Homebrew is not installed, install it from:

```text
https://brew.sh/
```

Then install required packages:

```bash
brew update
brew install git python openssh
```

Check Python:

```bash
python3 --version
```

## 2. Enable SSH localhost

macOS includes SSH, but remote login may need to be enabled.

Go to:

```text
System Settings → General → Sharing → Remote Login
```

Turn on Remote Login.

Then test:

```bash
ssh localhost "echo SSH works"
```

If SSH asks whether to continue connecting, type:

```text
yes
```

## 3. Clone the tutorial repository

```bash
mkdir -p ~/seavea-work
cd ~/seavea-work
git clone https://github.com/ananyabadithe/SEAVEA-tutorials.git
cd SEAVEA-tutorials
```

## 4. Create the notebook environment

```bash
python3 -m venv .venv
source .venv/bin/activate
python -m pip install --upgrade pip setuptools wheel
pip install -r requirements.txt
python -m ipykernel install --user --name seavea-tutorial --display-name "SEAVEA Tutorial"
```

## 5. Clone and configure FabSim3

```bash
cd ~/seavea-work
git clone https://github.com/djgroen/FabSim3.git
cd FabSim3
python3 -m venv VirtualEnv
source VirtualEnv/bin/activate
python configure_fabsim.py
ln -sf ~/seavea-work/FabSim3/fabsim/bin/fabsim ~/seavea-work/FabSim3/VirtualEnv/bin/fabsim
```

Check FabSim3:

```bash
which fabsim
fabsim localhost -h
```

## 6. Clone and install FLEE

```bash
cd ~/seavea-work
git clone https://github.com/djgroen/flee.git
cd flee
source ~/seavea-work/FabSim3/VirtualEnv/bin/activate
pip install -e .
```

Check FLEE:

```bash
python - <<'PY'
import flee
print("FLEE imported successfully")
PY
```

## 7. Install FabFlee plugin

```bash
cd ~/seavea-work/FabSim3
source VirtualEnv/bin/activate
fabsim localhost install_plugin:FabFlee
```

Install required Python packages:

```bash
pip install "numpy==1.26.4" easyvvuq chaospy plotly "setuptools<70" wheel folium ipython
```

Check FabFlee tasks:

```bash
fabsim localhost -l tasks | grep -i flee
```

## 8. Configure FabSim3 machine settings

Copy the example configuration:

```bash
cp ~/seavea-work/SEAVEA-tutorials/examples/machines_user.example.yml \
   ~/seavea-work/FabSim3/fabsim/deploy/machines_user.yml
```

Edit it:

```bash
nano ~/seavea-work/FabSim3/fabsim/deploy/machines_user.yml
```

Example macOS configuration:

```yaml
default:
  local_results: /Users/YOUR_MAC_USERNAME/FabSim/results
  local_configs: /Users/YOUR_MAC_USERNAME/FabSim/config_files
  username: YOUR_MAC_USERNAME

localhost:
  username: YOUR_MAC_USERNAME
  cores: 1
  corespernode: 1
  cpuspertask: 1
  taskspernode: 1
  virtual_env_path: /Users/YOUR_MAC_USERNAME/seavea-work/FabSim3/VirtualEnv
  python3_command: /Users/YOUR_MAC_USERNAME/seavea-work/FabSim3/VirtualEnv/bin/python
  flee_location: /Users/YOUR_MAC_USERNAME/seavea-work/flee
  enable_template_cache: false
  template_cache_size: 2000
```

Find your macOS username:

```bash
whoami
```

Replace `YOUR_MAC_USERNAME` with the result.

## 9. Run the Mali2012 baseline

```bash
cd ~/seavea-work/FabSim3
source VirtualEnv/bin/activate
fabsim localhost sflee:mali2012,simulation_period=50
fabsim localhost fetch_results
```

Check output:

```bash
find ~/FabSim/results -path "*mali*" -name "out.csv"
```

The output CSV should contain a column called:

```text
Total error
```

## 10. Run EasyVVUQ sensitivity analysis

```bash
cd ~/seavea-work/FabSim3
source VirtualEnv/bin/activate

fabsim localhost flee_init_SA:mali2012
fabsim localhost fetch_results
```

Check generated runs:

```bash
find ~/FabSim/results/mali2012_localhost_1_SA_SCSampler/RUNS -maxdepth 2 -name "out.csv" | sort
```

Check `Total error` exists in every run:

```bash
for f in ~/FabSim/results/mali2012_localhost_1_SA_SCSampler/RUNS/run_*/out.csv; do
  echo "Checking $f"
  head -1 "$f" | grep "Total error" || echo "MISSING Total error in $f"
done
```

Analyse the sensitivity-analysis results:

```bash
fabsim localhost flee_analyse_SA:mali2012
```

Expected analysis outputs include:

```text
collation_result.csv
sobols.yml
plot_sobols_first[Total error].png
plot_statistical_moments[Total error].png
raw[Total error].png
```

## Troubleshooting

If `python3 -m venv` fails, reinstall Python using Homebrew:

```bash
brew reinstall python
```

If SSH localhost fails, enable Remote Login in macOS Sharing settings.

If `fabsim` is not found, activate the FabSim3 environment again:

```bash
cd ~/seavea-work/FabSim3
source VirtualEnv/bin/activate
```

If SSH says the localhost host key changed, run:

```bash
ssh-keygen -f ~/.ssh/known_hosts -R localhost
ssh localhost "echo SSH works"
```
