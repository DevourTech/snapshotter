FROM ubuntu

RUN apt-get update -y && apt-get upgrade -y && apt-get install git -y

WORKDIR /app
ADD entrypoint.sh .
ADD action.yml .

RUN chmod +x ./entrypoint.sh

ENTRYPOINT ["sh","./entrypoint.sh"]
