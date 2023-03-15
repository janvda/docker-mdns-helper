FROM python:3.9-alpine
LABEL maintainer="stephane@apiou.org, Jan VdA"

# install dbus module for python
RUN apk add py3-dbus  --no-cache 

RUN cd /usr/lib/python3.10/site-packages && \
    ln -s _dbus_bindings.cpython-310-arm-linux-gnueabihf.so _dbus_bindings.so && \
    ln -s _dbus_glib_bindings.cpython-310-arm-linux-gnueabihf.so _dbus_glib_bindings.so

ENV PYTHONPATH=/usr/lib/python3.10/site-packages

RUN pip install docker

#RUN apk add dbus-glib-dev libc-dev gcc make  --no-cache
#RUN apk add cmake ninja --no-cache

WORKDIR /app/

COPY . .

#RUN pip install dbus-python

ENTRYPOINT ["python", "start.py"]
CMD ["-r"]
