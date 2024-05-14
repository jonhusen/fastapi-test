from typing import Optional

from fastapi import FastAPI

from fastapi_test.models import User

app = FastAPI()

@app.get("/")
async def root():
    return {"message": "hello world"}
