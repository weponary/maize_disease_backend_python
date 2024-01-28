FROM python:3.11.5

# Create and activate the virtual environment
RUN python3 -m venv myenv
ENV PATH="/app/myenv/bin:$PATH"

WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip install --upgrade pip && pip install -r requirements.txt

COPY . .

CMD ["python", "-m", "flask", "run", "--host=0.0.0.0"]
