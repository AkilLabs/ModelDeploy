from fastapi import FastAPI
import subprocess
import os

app = FastAPI()

# Path to the Llamafile model
MODEL_PATH = "/app/qwen1.5-0.5b-ggml-model-Q4_K_M.llamafile"

@app.get("/ai/")
def get_response(prompt: str):
    # Ensure the model file exists
    if not os.path.exists(MODEL_PATH):
        return {"error": "Model file not found"}

    # Run the model with the given prompt
    cmd = f"{MODEL_PATH} {prompt}"
    process = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    output, error = process.communicate()

    if error:
        return {"error": error.decode()}
    return {"response": output.decode()}
