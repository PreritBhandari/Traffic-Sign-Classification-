FROM python:3.8
WORKDIR /code
COPY . /code
RUN --mount=type=cache,target=/root/.cache pip install -r requirements.txt
CMD ["python3", "App.py"]
EXPOSE 5000
