FROM cgr.dev/chainguard/python:latest-dev as builder

WORKDIR /app

COPY requirements.txt .

RUN pip install --user --no-cache-dir -r requirements.txt


FROM cgr.dev/chainguard/python:latest

COPY --from=builder /home/nonroot/.local/lib/python3.11/site-packages /home/nonroot/.local/lib/python3.11/site-packages

COPY --from=builder /home/nonroot/.local/bin  /home/nonroot/.local/bin

ENV PATH=$PATH:/home/nonroot/.local/bin

COPY app.py .

COPY templates/ templates/

COPY static/ static/

ENTRYPOINT ["flask", "run", "--host=0.0.0.0"]
