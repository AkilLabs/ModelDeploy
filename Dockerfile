FROM python:3.9

WORKDIR /app

COPY ModelDeploy /app

RUN pip install fastapi uvicorn
RUN chmod +x /app/qwen1.5-0.5b-ggml-model-Q4_K_M.llamafile

EXPOSE 8000

CMD ["uvicorn", "server:app", "--host", "0.0.0.0", "--port", "8000"]
