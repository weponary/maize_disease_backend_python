FROM python:3.11.5

WORKDIR /app

# Install virtualenv
RUN pip3 install virtualenv

# Create a virtual environment
RUN virtualenv venv

# Activate the virtual environment and set as the default shell
SHELL ["/bin/bash", "-c"]
RUN source venv/bin/activate

# Install dependencies
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

# Copy the application code into the container
COPY . .

# Set the entry point to run the Flask app within the virtual environment
CMD ["venv/bin/python", "-m", "flask", "run", "--host=0.0.0.0"]
