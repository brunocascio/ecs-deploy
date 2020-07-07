FROM fabfuel/ecs-deploy:1.10.0

LABEL author="Bruno Cascio <@brunocascio>"

WORKDIR /

RUN apk add jq

COPY . .
RUN chmod a+x ./entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]