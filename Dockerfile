FROM osgeo/gdal:latest

# ENV WORKDIR=/usr/src/app
ENV WORKDIR=/app
# ENV DATA_DIR "/data"

RUN apt-get install -y --no-install-recommends python3-distutils python3-pip python3-setuptools python3-wheel
COPY requirements.txt ./
RUN python3 -m pip install -r requirements.txt

WORKDIR ${WORKDIR}
COPY static/sample/ ./static/sample
COPY static/config/ ./static/config
COPY static/requests/ ./static/requests
COPY processes/ ./processes
COPY *.py ./
COPY *.cfg ./

COPY ./patch/core.py /usr/local/lib/python3.6/dist-packages/czml3/

RUN mkdir -p ./logs ./outputs ./workdir ./static/maps

#CMD ls
CMD ["gunicorn" ,"--bind", "0.0.0.0:5000", "main:app"]