FROM python:3.13.1

RUN groupadd -r uwsgi && useradd -r -g uwsgi uwsgi
RUN pip install Flask==3.1.0 uWSGI==2.0.28 requests==2.32.3 redis==5.2.1
WORKDIR /app
COPY app /app/
COPY cmd.sh /
RUN chmod a+x /cmd.sh

EXPOSE 9090 9191
USER uwsgi

CMD [ "/cmd.sh"]