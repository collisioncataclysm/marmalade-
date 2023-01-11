FROM python:3.12.0a3-slim-buster

COPY requirements.txt ./
RUN pip install -r requirements.txt
RUN pip install tensorflow --upgrade

COPY ./ ./
WORKDIR scripts
RUN python autogen.py make

CMD ["python", "-u", "autogen.py", "serve"]
