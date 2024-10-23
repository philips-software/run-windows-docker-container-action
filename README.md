
# Action for running commands in a windows docker

## State

[![Test](https://github.com/philips-software/run-windows-docker-container-action/actions/workflows/test.yml/badge.svg)](https://github.com/philips-software/run-windows-docker-container-action/actions/workflows/test.yml)

## Description

Composite action for running commands in windows docker containers.

## Usage

Very simple hello world example:

```
    steps:
      - name: Checkout
        uses: actions/checkout@v3
        with:
          fetch-depth: 0
      - name: Test_Run
        uses: philips-software/run-windows-docker-container-action@<version>
        with:
          image: mcr.microsoft.com/windows/servercore:20H2
          entrypoint: powershell.exe
          run: >-
            echo "Hello world";
            ./run-test-script.ps1;
```

On default, the github workspace directory is mapped to the docker volume path
and work path. 

<!-- action-docs-inputs -->
## Inputs

| parameter | description | required | default |
| - | - | - | - |
| image | Docker image. | `true` |  |
| run | Command to execute. | `true` |  |
| workspace_path | Workspace path. Default is root workspace path. | `false` |  |
| mapping_path | Mapping path, i.e. path to where the workspace path is mapped in the docker container. Defaults to workspace_path. | `false` |  |
| work_path | Work path, i.e. path where the command in the docker container is executed. Defaults to workspace_path. | `false` |  |
| memory | Memory limit. See docker documentation on --memory. | `false` | 4GB |
| entrypoint | Overrides the default ENTRYPOINT in docker image. | `false` |  |
| env_names | Environment variable names passed to docker image as comma separated list, for example: NAME1, NAME2, NAME3 | `false` |  |
| extra_args | Extra arguments for docker run command. | `false` |  |
| pre-warm | Run a warming-up container (which might crash due to first time use failure) | `false` | true |
| pre-warm-cmd | Pre warm command to run inside the container | `false` | echo "warming up!" |
| registry_authentication | Authenticate against registry server | `false` | false |
| registry_username | Docker registry username. | `false` |  |
| registry_token | Docker registry token | `false` |  |
| registry_repository | Docker registry repository | `false` |  |



<!-- action-docs-inputs -->


<!-- action-docs-runs -->
## Runs

This action is a `composite` action.


<!-- action-docs-runs -->

## Contributing

Please refer to our [Contributing](CONTRIBUTING.md) guide when you want to contribute to this project.

## License

Run-Windows-Docker-Container is licenced under the [MIT](https://choosealicense.com/licenses/mit/) license. See [LICENSE file](LICENSE).
