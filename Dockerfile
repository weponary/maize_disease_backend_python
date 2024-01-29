FROM tensorflow/tensorflow:2.15.0

# Install system dependencies
RUN apt-get update && \
    apt-get install -y libgl1-mesa-glx && \
    apt-get install -y libglib2.0-0

RUN pip install --no-cache-dir tensorflow==2.15.0



# Disable GPU acceleration
ENV CUDA_VISIBLE_DEVICES -1

# Create and activate the virtual environment
RUN python3 -m venv myenv
ENV PATH="/app/myenv/bin:$PATH"

WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip install --upgrade pip && pip install -r requirements.txt

COPY . .

CMD ["python", "-m", "flask", "run", "--host=0.0.0.0"]

