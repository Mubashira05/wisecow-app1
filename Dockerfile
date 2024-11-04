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

# Example: Adjust paths as necessary
COPY path/to/your/certs/server.crt /etc/ssl/certs/
COPY path/to/your/certs/server.key /etc/ssl/private/


# Run the application using Gunicorn to handle TLS
CMD ["gunicorn", "--certfile=/etc/ssl/certs/server.crt", "--keyfile=/etc/ssl/private/server.key", "-b", "0.0.0.0:443", "app:app"]
