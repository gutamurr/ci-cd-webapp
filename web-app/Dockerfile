FROM ubuntu

RUN apt-get update
RUN apt-get install -y python3-flask

COPY main.py /opt/main.py
ENV FLASK_APP=/opt/main.py

EXPOSE 5000

ENTRYPOINT ["flask", "run", "--host=0.0.0.0"]