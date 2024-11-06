FROM python:3.9-slim

WORKDIR /app

COPY . .

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 443

COPY certs/server.crt /etc/ssl/certs/
COPY certs/server.key /etc/ssl/private/


CMD ["python", "app.py"]
