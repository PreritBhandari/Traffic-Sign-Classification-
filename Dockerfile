FROM python:3.8
WORKDIR /code
COPY . /code
RUN pip install -r requirements.txt
CMD ["python3", "App.py"]
EXPOSE 5000
