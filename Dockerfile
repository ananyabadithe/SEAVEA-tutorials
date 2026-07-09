FROM python:3.10-slim

LABEL org.opencontainers.image.title="seavealite"
LABEL org.opencontainers.image.description="Lightweight Docker environment for the SEAVEA tutorial notebooks"
LABEL org.opencontainers.image.source="https://github.com/ananyabadithe/SEAVEA-tutorials"

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV PIP_NO_CACHE_DIR=1

WORKDIR /workspace

RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    build-essential \
    gcc \
    g++ \
    make \
    && rm -rf /var/lib/apt/lists/*

COPY binder/requirements.txt /tmp/requirements.txt

RUN python -m pip install --upgrade pip \
    && python -m pip install -r /tmp/requirements.txt \
    && python -m ipykernel install --sys-prefix --name seavea-tutorials --display-name "Python (SEAVEA tutorials)"

COPY . /workspace

EXPOSE 8888

CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]
