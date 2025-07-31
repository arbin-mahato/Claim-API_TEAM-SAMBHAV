# Use an official Python runtime as a parent image
FROM python:3.11-slim

# Set the working directory
WORKDIR /code

# Copy and install requirements system-wide as root
COPY ./requirements.txt /code/requirements.txt
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

# Copy the application code
COPY . /code/

# Run the Gunicorn server as the root user.
# This is acceptable for a short-term hackathon and solves all permission issues.
CMD ["gunicorn", "-w", "1", "-k", "uvicorn.workers.UvicornWorker", "--bind", "0.0.0.0:7860", "main:app"]