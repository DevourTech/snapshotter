FROM golang

ADD entrypoint.sh .
ADD action.yml .

RUN chmod +x ./entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]
