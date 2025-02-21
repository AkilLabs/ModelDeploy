from fastapi import FastAPI
import subprocess
import os

app = FastAPI()

MODEL_PATH = "/app/qwen1.5-0.5b-ggml-model-Q4_K_M.llamafile"

@app.get("/ai/")
def get_response(prompt: str):
    if not os.path.exists(MODEL_PATH):
        return {"error": "Model file not found"}

    result = subprocess.run([MODEL_PATH, prompt], capture_output=True, text=True)
    return {"response": result.stdout}