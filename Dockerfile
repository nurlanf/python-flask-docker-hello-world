FROM python:2.7
MAINTAINER Nurlan Farajov "coolinuxoid@gmail.com"
COPY . /app
WORKDIR /app
RUN pip install -r requirements.txt
ENTRYPOINT ["python"]
CMD ["app.py"]
