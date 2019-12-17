# ECS deploy using Github Actions

This action deploys ECS services using [fabfuel/ecs-deploy](https://github.com/fabfuel/ecs-deploy) script.

## Example usage

```yml
uses: brunocascio/ecs-deploy@vX.Y.Z>
with:
  cluster: theClusterName
  service: theServiceName
  task: theTaskDefinitionName
  container: theContainerName
```

Environment variables are read from system. You can use [say8425/aws-secrets-manager-actions](https://github.com/say8425/aws-secrets-manager-actions) if you are using Aws Secrets manager.
