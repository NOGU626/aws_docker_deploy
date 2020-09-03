FROM python:3.6

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y tzdata
# timezone setting
ENV TZ=Asia/Tokyo

# opencv-devのインストール
RUN apt-get update -y && apt-get install -y libopencv-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
    
#ファイルをappディレクトリに追加
COPY ./src/app.py ./home/
RUN pip3 install Flask

WORKDIR /home
EXPOSE 5000

CMD ["python", "app.py"]