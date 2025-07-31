# Use an official Python runtime as a parent image
FROM python:3.11-slim

# Set the working directory in the container
WORKDIR /code

# Copy the requirements file
COPY ./requirements.txt /code/requirements.txt

# Create a non-root user to run the application
RUN useradd --create-home --shell /bin/bash appuser

# FIX: Create the cache directory and give the user ownership
RUN mkdir -p /code/model_cache && chown -R appuser:appuser /code

# Install dependencies as the new user
USER appuser
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

# Copy the rest of the application code
COPY --chown=appuser:appuser . /code/

# Run the Gunicorn server as the new user
CMD ["gunicorn", "-w", "1", "-k", "uvicorn.workers.UvicornWorker", "--bind", "0.0.0.0:7860", "main:app"]