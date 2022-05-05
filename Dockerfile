FROM python:3.8
WORKDIR /code
RUN pip install -r requirements.txt
COPY . /code
CMD ["python3", "App.py"]
EXPOSE 5000
