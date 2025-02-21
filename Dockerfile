FROM python:3.9

WORKDIR /app

ARG GITHUB_TOKEN
RUN apt-get update && apt-get install -y git \
    && git clone https://YOUR_GITHUB_TOKEN@github.com/YOUR_GITHUB_USERNAME/YOUR_REPO_NAME.git /app \
    && chmod +x /app/qwen1.5-0.5b-ggml-model-Q4_K_M.llamafile

RUN pip install fastapi uvicorn

EXPOSE 8000

CMD ["uvicorn", "server:app", "--host", "0.0.0.0", "--port", "8000"]
