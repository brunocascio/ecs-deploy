# ECS deploy using Github Actions

This action deploys ECS services using [fabfuel/ecs-deploy](https://github.com/fabfuel/ecs-deploy) script.

## Example usage

```yml
uses: brunocascio/ecs-deploy@latest
with:
  cluster-name: theCluster
  service-name: theService
  task-name: theTaskDefinitionName
  container-name: theContainer
```