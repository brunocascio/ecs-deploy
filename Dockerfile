FROM fabfuel/ecs-deploy:1.10.0

LABEL author="Bruno Cascio <@brunocascio>"

RUN apk add jq

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]