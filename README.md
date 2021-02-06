# Kedro Exemplar

This repository contains an example Machine Learning use case, scaffolded by the Kedro library. 

The example leverages Docker for containerisation, this repository extends the base Kedro tutorial by packaging it with Docker Compose Configuration, to ensure simple setup and use. It defaults to running a Jupyter notebook instance, with the assumption you will attach and IDE and leverage a secondary CLI to edit the code and run Kedro commands to give full development flexibility.

## Setup & Use

### Assumptions
- Docker is installed and running on your local machine.

### Setup

1. In a terminal, in the root of the project, run ``docker-compose up``. This will setup and run the Image, mounting a volume and creating the Kedro project scaffolding.

2. The terminal will output the link to the notebook instance in the container, copy into your browser if using a notebook.

3. Open your desired IDE and attach a shell to the container (Docker plugin for VS code as an example enables this).

### Use




## Resources