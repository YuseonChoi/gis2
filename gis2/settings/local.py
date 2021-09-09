from .base import *


env_list = dict()
local_env = open(os.path.join(BASE_DIR, '.env'))
# 운영체제 관련해서 경로가 들어있는 곳이 PATH
# 최상위 폴더 안의 .env 파일을 연다.

while True:
    line = local_env.readline()
    if not line:
        break
    line = line.replace('\n', '')
    start = line.find('=')
    key = line[:start]
    value = line[start+1:]
    env_list[key] = value

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = env_list['SECRET_KEY']

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

ALLOWED_HOSTS = ['*']



# Database
# https://docs.djangoproject.com/en/3.2/ref/settings/#databases

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': BASE_DIR / 'db.sqlite3',
    }
}