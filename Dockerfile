FROM python:3.10-slim

# set work directory
# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
COPY ./requirements.txt /
RUN pip install -r requirements.txt

# install dependencies
# copy project
WORKDIR /app
COPY ./app /app

EXPOSE 8000

CMD ["gunicorn", "main:app", "-b", ":8000", "-w2"]
