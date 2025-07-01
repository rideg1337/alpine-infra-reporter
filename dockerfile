FROM python:3.10-alpine

WORKDIR /app

RUN apk add --no-cache gcc musl-dev linux-headers

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY app.py .

EXPOSE 5055

CMD ["python", "app.py"]
