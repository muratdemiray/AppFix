FROM alpine:3.7
RUN mkdir -p /app
COPY requirements.txt /app
WORKDIR /app
COPY . /app

RUN apk add --virtual build-deps gcc python3-dev musl-dev && apk add --no-cache mariadb-dev
RUN apk add python --repository=http://dl-cdn.alpinelinux.org/alpine/edge/main &&  python /app/get-pip.py 
RUN apk add python2-dev gpgme-dev libc-dev 

RUN pip install -r ./requirements.txt

EXPOSE 3000
CMD python application.py