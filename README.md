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