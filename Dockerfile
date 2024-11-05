# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . .

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Expose port for TLS (443)
EXPOSE 443

# Copy SSL certificates (ensure they exist in the `certs` directory in your project)
COPY server.crt /etc/ssl/certs/
COPY server.key /etc/ssl/private/


# Run the application using Gunicorn to handle TLS
# Here, `app:app` assumes that `app.py` contains a Flask app named `app`
CMD ["gunicorn", "--certfile=/etc/ssl/certs/server.crt", "--keyfile=/etc/ssl/private/server.key", "-b", "0.0.0.0:443", "app:app"]
