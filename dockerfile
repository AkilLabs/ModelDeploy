FROM python:3.9

WORKDIR /app

# Download the Llamafile model
RUN wget "https://huggingface.co/SalmanHabeeb/qwen-llamafiles/resolve/main/qwen1.5-0.5b-ggml-model-Q4_K_M.llamafile" -O /app/qwen1.5-0.5b-ggml-model-Q4_K_M.llamafile

# Give execute permissions to the model
RUN chmod +x /app/qwen1.5-0.5b-ggml-model-Q4_K_M.llamafile

# Copy project files
COPY . /app

# Install dependencies
RUN pip install fastapi uvicorn

EXPOSE 8000

CMD ["uvicorn", "server:app", "--host", "0.0.0.0", "--port", "8000"]