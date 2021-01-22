FROM python:3.9

COPY . .

ENTRYPOINT ["python", "src/main.py"]
