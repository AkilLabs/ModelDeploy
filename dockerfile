# Use a lightweight Python image
FROM python:3.9

# Set working directory
WORKDIR /app

# Copy project files
COPY . /app

# Ensure the Llamafile model is executable
RUN chmod +x Llama-3.2-1B-Instruct.Q6_K.llamafile

# Install dependencies
RUN pip install fastapi uvicorn

# Expose port 8000 for FastAPI
EXPOSE 8000

# Start FastAPI server
CMD ["uvicorn", "server:app", "--host", "0.0.0.0", "--port", "8000"]