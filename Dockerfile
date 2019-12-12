FROM fabfuel/ecs-deploy:1.10.0

LABEL author="Bruno Cascio <@brunocascio>"

WORKDIR /

RUN apk add jq

COPY . .

ENTRYPOINT [ "/entrypoint.sh" ]