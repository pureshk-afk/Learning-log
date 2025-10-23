FROM python:3.12-alpine

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

RUN python manage.py migrate

CMD ["gunicorn", "learning_log.wsgi:application", "--bind", "0.0.0.0:4000"]