# Use an official Python runtime as a parent image
FROM python:3.11-slim

# Set the working directory
WORKDIR /code

# Copy and install requirements system-wide as root
COPY ./requirements.txt /code/requirements.txt
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

# THE FIX: Pre-create all necessary directories with open permissions during the build
RUN mkdir -p /code/model_cache && chmod 777 /code/model_cache
RUN mkdir -p /code/temp_docs && chmod 777 /code/temp_docs

# Copy the application code
COPY . /code/

# Run the Gunicorn server as the root user to avoid any permission issues
CMD ["gunicorn", "-w", "1", "-k", "uvicorn.workers.UvicornWorker", "--bind", "0.0.0.0:7860", "main:app"]