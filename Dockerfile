#FROM python:3.8-slim-buster
FROM public.ecr.aws/sam/build-python3.8:1.121.0-20240730174605
#WORKDIR /python-docker

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

COPY . .

ENTRYPOINT python app.py
#CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]

# # syntax=docker/dockerfile:1
# FROM python:3.10-alpine
# WORKDIR /code
# ENV FLASK_APP=app.py
# ENV FLASK_RUN_HOST=0.0.0.0
# RUN apk add --no-cache gcc musl-dev linux-headers
# COPY requirements.txt requirements.txt
# RUN pip install -r requirements.txt
# EXPOSE 5000
# COPY . .
# CMD ["flask", "run", "--debug"]