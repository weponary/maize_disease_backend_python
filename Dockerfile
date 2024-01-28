FROM python:3.11.5

# Install system dependencies
RUN apt-get update && \
    apt-get install -y libgl1-mesa-glx


# Disable GPU acceleration
ENV CUDA_VISIBLE_DEVICES -1

# Create and activate the virtual environment
RUN python3 -m venv myenv
ENV PATH="/app/myenv/bin:$PATH"

WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY . .

CMD ["python", "-m", "flask", "run", "--host=0.0.0.0"]

