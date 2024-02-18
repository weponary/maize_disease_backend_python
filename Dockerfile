# Use the official Python image from the Docker Hub
FROM python:3.10-slim

RUN apt-get update && apt-get install ffmpeg libsm6 libxext6  -y


# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Disable GPU acceleration
ENV CUDA_VISIBLE_DEVICES -1

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code into the container
COPY . .

# Expose the port on which your Flask app will run
EXPOSE 8000

# Command to run the Flask application
CMD ["python", "app.py"]
