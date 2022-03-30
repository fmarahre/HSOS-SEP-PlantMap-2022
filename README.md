# README

## Quick Start

### VS Code devcontainer

1. Clone this repo and open it in VS Code.
2. Install the extensions `ms-vscode-remote.remote-containers` and `ms-azuretools.vscode-docker`.
3. Press `F1` or `CTRL + SHIFT + P` and enter `Remote-Containers: Reopen Folder in Container`
4. This creates a docker container based on
   [ghcr.io/naturerobots/hsos-sep-plant-map-2022:main](https://github.com/naturerobots/HSOS-SEP-PlantMap-2022/pkgs/container/hsos-sep-plant-map-2022),
   installs all necessary VS Code extensions, builds the workspace a first time, sets up
   Intellisense, installs the [pre-commit](#precommit) hooks and opens it in VS Code.

   Use `pre-commit run -a` in the workspace folder to check the code style before commiting. In the Docker image the
   pre-commit checks are installed in the git so a commit is just possible if the checks succeed.

5. default user: `docker` with password: `docker`

## pre-commit formatting checks

This repo has a [pre-commit](https://pre-commit.com/) check that runs in CI. You can use this locally and set it up to
run automatically before you commit something. In the devcontainer it is already pre-installed. To install, use pip:

```bash
pip3 install --user pre-commit
```

To run over all the files in the repo manually:

```bash
pre-commit run -a
```

To run pre-commit automatically before committing in the local repo, install the git hooks (run it in the repo folder):

```bash
pre-commit install
```