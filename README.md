# ECS deploy using Github Actions

This action deploys ECS services using [fabfuel/ecs-deploy](https://github.com/fabfuel/ecs-deploy) script.

## Example usage

```yml

- name: Configure AWS Credentials
  uses: aws-actions/configure-aws-credentials@v1
  with:
    aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}
    aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
    aws-region: ${{ secrets.AWS_REGION }} 

- name: Deploy to ecs
  uses: brunocascio/ecs-deploy@v1.1.2
  with:
    cluster: theClusterName
    service: theServiceName
    task: theTaskDefinitionName
    container: theContainerName
    envfile: /path/to/your/envfile (optionally)
    timeout: 720 (optionally, default 300)
```
