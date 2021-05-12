FROM python:3.6-buster

RUN apt-get update -y && apt-get install ffmpeg libavcodec-extra -y && apt-get install git -y && apt-get install nginx -y

RUN git clone https://github.com/XiGitEvidence/xi-speech-synthesizer.git

RUN cd xi-speech-synthesizer && pip3 install -r requirements.txt
RUN pip3 install gunicorn gevent

ADD frontend-demo frontend-demo 
ADD start.sh start.sh
ADD xi.conf /etc/nginx/conf.d/default.conf

EXPOSE 5001
CMD ["bash", "start.sh"]
