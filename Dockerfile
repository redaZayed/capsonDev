# Use the Python3.7.2 image
FROM python:3.7.2-stretch

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
ADD . /app

# Install the dependencies
RUN export FLASK_APP=run.py &&\
    pip install --upgrade pip &&\
    pip install -r requirements.txt

EXPOSE 5000

# run the command to start uWSGI on port 5000 (specified in the app.ini file).
CMD ["python", "run.py"]