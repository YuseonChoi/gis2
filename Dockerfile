FROM python:3.9.0

WORKDIR /home/

RUN git clone https://github.com/YuseonChoi/gis2.git

WORKDIR /home/gis2/

RUN echo 'SECRET_KEY=django-insecure-8#-*)2t@!@qt1ooa4dd-zq$lyt)ibb1vf1n_w4bafp)on_45o*' > .env

RUN pip install -r requirements.txt

RUN pip install gunicorn

RUN python manage.py migrate

RUN python manage.py collectstatic

EXPOSE 8000

CMD ["gunicorn", "gis2.wsgi", "--bind", "0.0.0.0:8000"]