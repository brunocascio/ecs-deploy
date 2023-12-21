# ECS deploy using Github Actions

This action deploys ECS services using [fabfuel/ecs-deploy](https://github.com/fabfuel/ecs-deploy) tool.

## Example usage

```yml

- name: Configure AWS Credentials
  uses: aws-actions/configure-aws-credentials@v1
  with:
    aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}
    aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
    aws-region: ${{ secrets.AWS_REGION }} 

- name: Deploying services with an env file
  uses: brunocascio/ecs-deploy@v2.2.0
  with:
    args: deploy <cluster> <service> --task <task-definition>

- name: Running tasks
  uses: brunocascio/ecs-deploy@v2.2.0
  with:
    args: run <cluster> <task-name> -c <container> "your override shell command here"

- name: Updating a cron (scheduled task)
  uses: brunocascio/ecs-deploy@v2.2.0
  with:
    args: cron <cluster> <task> <rule>
```

Check the [fabfuel/ecs-deploy](https://github.com/fabfuel/ecs-deploy) for more information about what you can do with it.
