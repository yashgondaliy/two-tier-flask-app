#Base file (OS)

FROM python:3.12-slim

#set workdir

WORKDIR /app

#install and update required pkg's

RUN apt-get update && apt-get upgrade -y gcc default-libmysqlclient-dev pkg-config && rm -rf /var/lib/apt/lists/*

#copy the code 

COPY requirements.txt .

#run and install pkg and file

RUN pip install mysqlclient
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["python","app.py"]
