FROM python:3.10.2

WORKDIR /app

COPY ./templates /app

COPY ./app.py /app

RUN pip install Flask

CMD ["python3", "app.py"]