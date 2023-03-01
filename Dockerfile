FROM python:3.10-slim
#создаём директорию /code и переходим в неё
WORKDIR /code
# копируем файлс зависимостями
COPY requirements.txt .
# устанавливаем через pip зависимости
RUN pip install -r requirements.txt
# копируем код приложения
COPY app.py .
# копируем код приложения
COPY migrations migrations
# копируем спецаильный конфиг и подменяем дефолтный
COPY docker_config.py default_config.py

#Указываем команду, которая будет запущена командой docker run
CMD flask run -h 0.0.0.0 -p 80
