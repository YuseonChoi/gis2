FROM python:3.9.0

WORKDIR /home/

RUN echo 'asdgsadg'

RUN git clone https://github.com/YuseonChoi/gis2.git

WORKDIR /home/gis2/

RUN echo 'SECRET_KEY=django-insecure-8#-*)2t@!@qt1ooa4dd-zq$lyt)ibb1vf1n_w4bafp)on_45o*' > .env

RUN pip install -r requirements.txt

RUN pip install gunicorn

RUN pip install mysqlclient

EXPOSE 8000

CMD ["bash", "-c", "python manage.py collectstatic --noinput --settings=gis2.settings.deploy && python manage.py migrate --settings=gis2.settings.deploy && gunicorn --env DJANGO_SETTINGS_MODULE=gis2.settings.deploy gis2.wsgi --bind 0.0.0.0:8000"]