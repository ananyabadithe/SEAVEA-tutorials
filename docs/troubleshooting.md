# Troubleshooting Guide

This guide lists common issues that can happen when setting up or running the SEAVEA tutorial workflow with FabSim3, FLEE, FabFlee, and EasyVVUQ.

## 1. `fabsim: command not found`

This usually means the FabSim3 virtual environment is not activated.

Run:

```bash
cd ~/seavea-work/FabSim3
source VirtualEnv/bin/activate
which fabsim
```

If `which fabsim` prints nothing, recreate the symlink:

```bash
ln -sf ~/seavea-work/FabSim3/fabsim/bin/fabsim ~/seavea-work/FabSim3/VirtualEnv/bin/fabsim
which fabsim
```

## 2. `ModuleNotFoundError: No module named 'numpy'`

This can happen if FabSim3 runs FLEE using the wrong Python environment.

Check that `machines_user.yml` contains the correct Python path:

```yaml
python3_command: /path/to/FabSim3/VirtualEnv/bin/python
```

Then confirm the environment has the required packages:

```bash
cd ~/seavea-work/FabSim3
source VirtualEnv/bin/activate

python - <<'PY'
import numpy
import flee
print("numpy and flee imported successfully")
PY
```

## 3. `ModuleNotFoundError` for EasyVVUQ, Chaospy, Plotly, Folium, or IPython

Activate the FabSim3 environment and install the missing packages:

```bash
cd ~/seavea-work/FabSim3
source VirtualEnv/bin/activate
pip install "numpy==1.26.4" easyvvuq chaospy plotly "setuptools<70" wheel folium ipython
```

Then check FabFlee tasks:

```bash
fabsim localhost -l tasks | grep -i flee
```

## 4. SSH localhost fails

FabSim3 may use SSH even when running on `localhost`.

Start SSH:

```bash
sudo service ssh start
```

Test SSH:

```bash
ssh localhost "echo SSH works"
```

If SSH asks whether to continue connecting, type:

```text
yes
```

## 5. `REMOTE HOST IDENTIFICATION HAS CHANGED`

This happens when the saved SSH key for `localhost` no longer matches.

Remove the old localhost key:

```bash
ssh-keygen -f ~/.ssh/known_hosts -R localhost
ssh-keygen -f ~/.ssh/known_hosts -R '[localhost]:22'
```

Then reconnect:

```bash
ssh localhost "echo SSH works"
```

Type `yes` if asked.

## 6. `Permission denied` or repeated SSH password prompts

First check that SSH works:

```bash
ssh localhost "echo SSH works"
```

To make localhost SSH easier, create an SSH key if needed:

```bash
ssh-keygen -t ed25519
```

Press Enter for the default options.

Copy the key to localhost:

```bash
ssh-copy-id localhost
```

Then test:

```bash
ssh localhost "echo SSH works"
```

## 7. `KeyError: 'Total error'` during `flee_analyse_SA`

This usually means the sensitivity-analysis run outputs do not contain the expected `Total error` column, or the analysis is looking in the wrong result folder.

Check all generated outputs:

```bash
find ~/FabSim/results/mali2012_localhost_1_SA_SCSampler/RUNS -maxdepth 2 -name "out.csv" | sort
```

Check the header of each output:

```bash
for f in ~/FabSim/results/mali2012_localhost_1_SA_SCSampler/RUNS/run_*/out.csv; do
  echo "Checking $f"
  head -1 "$f" | grep "Total error" || echo "MISSING Total error in $f"
done
```

If `Total error` is missing, rerun the Mali2012 baseline and sensitivity-analysis initialisation.

## 8. `NO machines_FabFlee_user.yml FOUND`

This message can appear during FabFlee commands.

It is not always an error. If `get_flee_location` prints the correct FLEE path and the workflow runs, it can be ignored.

Check FLEE location:

```bash
fabsim localhost get_flee_location
```

Expected:

```text
localhost /path/to/flee
```

## 9. FabSim3 uses the wrong results folder

Check `machines_user.yml`:

```bash
grep -n "local_results\|local_configs" ~/seavea-work/FabSim3/fabsim/deploy/machines_user.yml
```

Recommended local paths:

```yaml
local_results: /home/YOUR_USERNAME/FabSim/results
local_configs: /home/YOUR_USERNAME/FabSim/config_files
```

For macOS, use:

```yaml
local_results: /Users/YOUR_USERNAME/FabSim/results
local_configs: /Users/YOUR_USERNAME/FabSim/config_files
```

## 10. QCG machine points to a remote system

If running:

```bash
fabsim qcg ...
```

tries to connect to a remote machine such as `eagle.man.poznan.pl`, then the `qcg` machine profile is configured as a remote HPC profile, not local WSL/Linux/macOS.

For local testing, use:

```bash
fabsim localhost ...
```

Use QCG only when the correct machine profile and HPC configuration are available.

## 11. GitHub push asks for password and fails

GitHub no longer supports account passwords for Git operations over HTTPS.

Use a GitHub Personal Access Token when Git asks for the password.

Recommended safe Git workflow:

```bash
git status
git pull --rebase
git status
git add path/to/file
git commit -m "Clear commit message"
git push
git status
```

## 12. Privacy scan before pushing

Before pushing larger changes, scan for personal paths or credentials:

```bash
grep -RIn "YOUR_NAME\|/home/YOUR_USERNAME\|email@example.com\|password\|secret\|token" . \
  --exclude-dir=.git \
  --exclude-dir=.venv \
  --exclude-dir=VirtualEnv \
  --exclude-dir=__pycache__
```

Do not commit:

- real usernames in paths
- email addresses
- passwords
- tokens
- SSH keys
- machine-specific `machines_user.yml`
- generated results
- EasyVVUQ campaign databases
