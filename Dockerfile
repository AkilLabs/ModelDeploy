# Use a lightweight Python image
FROM python:3.9

# Set the working directory inside the container
WORKDIR /app

# Clone your GitHub repo (replace with your GitHub URL)
RUN apt-get update && apt-get install -y git \
    && git clone https://github.com/YOUR_GITHUB_USERNAME/YOUR_REPO_NAME.git /app \
    && chmod +x /app/qwen1.5-0.5b-ggml-model-Q4_K_M.llamafile

# Install dependencies
RUN pip install fastapi uvicorn

# Expose the API port
EXPOSE 8000

# Start the FastAPI server
CMD ["uvicorn", "server:app", "--host", "0.0.0.0", "--port", "8000"]
