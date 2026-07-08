"""Smoke test for the Binder tutorial environment."""

import sys

import numpy as np
import pandas as pd
import matplotlib
import easyvvuq as uq

print("Python:", sys.version)
print("NumPy:", np.__version__)
print("Pandas:", pd.__version__)
print("Matplotlib:", matplotlib.__version__)
print("EasyVVUQ:", uq.__version__ if hasattr(uq, "__version__") else "imported")
print("Binder smoke test passed.")
