from fastapi import FastAPI
import subprocess

app = FastAPI()

@app.get("/ai/")
def get_response(prompt: str):
    # Run the Llamafile model with the given prompt
    result = subprocess.run(["./Llama-3.2-1B-Instruct.Q6_K.llamafile", prompt], capture_output=True, text=True)
    return {"response": result.stdout}