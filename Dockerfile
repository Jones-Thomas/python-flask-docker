FROM python:3.12.0a3-slim-buster
LABEL maintainer="jonesthomas.work@gmail.com"
COPY . /app
WORKDIR /app
RUN pip install -r requirements.txt
EXPOSE 5000
ENTRYPOINT ["python"]
CMD ["app/app.py"]
