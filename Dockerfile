# ── Stage 1: Go backend builder ──────────────────────────────────────────────
FROM golang:1.22 AS go-builder

WORKDIR /build

COPY SmartOracle_backend/ .

RUN go mod tidy && go build -buildvcs=false -o hunter ./hunter/main.go


# ── Stage 2: Final image ──────────────────────────────────────────────────────
FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

RUN apt-get update && apt-get install -y \
    software-properties-common \
    git \
    gcc \
    && add-apt-repository ppa:deadsnakes/ppa \
    && apt-get update && apt-get install -y \
    python3.8 \
    python3.8-venv \
    python3.8-dev \
    python3-pip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY --from=go-builder /build/hunter /usr/local/bin/hunter
COPY --from=go-builder /build /app/SmartOracle_backend

WORKDIR /app
COPY SmartOracle/ SmartOracle/

RUN python3.8 -m venv /app/venv \
    && /app/venv/bin/pip install --upgrade pip \
    && /app/venv/bin/pip install -r SmartOracle/requirements.txt \
    && /app/venv/bin/pip install statsmodels==0.13.5

COPY dapps/ /app/dapps/

WORKDIR /app/SmartOracle

ENV PATH="/app/venv/bin:$PATH"

ENTRYPOINT ["python", "main.py"]
CMD ["--help"]
