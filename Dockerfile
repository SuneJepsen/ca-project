# The base image
FROM python:2

# Install  request
# RUN pip install requests -y

COPY . /usr/src/app/

RUN  pip  install -r /usr/src/app/requirements.txt

EXPOSE 5000

# Run the application
CMD ["python", "/usr/src/app/run.py"]


