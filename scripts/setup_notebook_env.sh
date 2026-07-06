#!/usr/bin/env bash
set -e

echo "Creating Python virtual environment..."
python3 -m venv .venv

echo "Activating virtual environment..."
source .venv/bin/activate

echo "Upgrading pip..."
python -m pip install --upgrade pip wheel "setuptools<70"

echo "Installing requirements..."
pip install -r requirements.txt

echo "Installing Jupyter kernel..."
python -m ipykernel install --user --name seavea-tutorial --display-name "SEAVEA Tutorial"

echo "Setup complete."
echo "To activate the environment later, run:"
echo "source .venv/bin/activate"
