FROM fabfuel/ecs-deploy:1.11.0

LABEL author="Bruno Cascio <@brunocascio>"

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
