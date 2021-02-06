# Kedro Exemplar

This repository contains an example Machine Learning use case, scaffolded by the Kedro library. 

The example leverages Docker for containerisation, this repository extends the base Kedro tutorial by packaging it with Docker Compose Configuration, to ensure simple setup and use. It defaults to running a Jupyter notebook instance, with the assumption you will attach and IDE and leverage a secondary CLI to edit the code and run Kedro commands to give full development flexibility.

## Setup & Use

### Assumptions
- Docker is installed and running on your local machine.

### Setup

1. In a terminal, in the root of the project, run ``docker-compose up``. This will setup and run the Image, mounting a volume and creating the Kedro project scaffolding.

2. The terminal will output the link to the notebook instance in the container, copy into your browser if using a notebook.

3. Download the three data files in this web page ``https://kedro.readthedocs.io/en/stable/03_tutorial/03_set_up_data.html`` and place in the local ``data/01_raw`` folder.

4. Open your desired IDE and attach a shell to the container (Docker plugin for VS code as an example enables this).

5. cd into the project folder, in this case ``kedro`` and run ``kedro install`` to install the dependencies. This is a step which could be placed into the Dockerfile.

6. If need be, add any credentials or configuration to the conf folder. For example, aws credentials, if not using the awscli.


### Use

- All data sources need to the registered in the ``catalog.yml``, otherwise the Kedro pipeline will persist in memory and remove when execution completes.

- If using notebooks for core initial development, you can still use the Kedro API for loading datasets as catalogs for versioning and promiting through the data processing folders.

- ``kedro run`` will run the complete pipeline defined in the ``hooks.py`` file. You can 'slice' to subset parts of the pipeline to run as well. In our case this generate variations on the dataset and a model, while logging evaluation results.

- A pipeline hook connects multiple pipelines (DE + DS) which contais multiple nodes, which are essentially functions with defined input and outputs. The Kedro library detects your catalog setup and the configuration of nodes to persist data in each step.

- ``kedro package`` creates a pip installable wheel file. This could be something that is run in CI, with the output being moved to a different artifact store - similar to the model. This output expects log, conf and data files to exist in the client in the same structure as in this repository to support a ``python -m kedro_example_jmcd.run`` command.


## Pros and Cons

- [+] - In tandem with Docker the ability to setup quickly and regenerate results is impressive. Packing into Docker also gives flexibility on setup.

- [+] Encourages standardisation, testable and modular code. 


- [-] Project skeleton comes with a lot of boiler plate files, folders and in code comments that would need cleaned each time.

- [-] For anyone new to Kedro, there is quite a bit of specific lingo.

- [-] Quite a few 'extra' files in the kedro skeleton, run.py, cli.py that clog up space and cognitive attention for anyone viewing the project, whether experienced with kedro or not.

## TODO
- Data / Model Versioning
- Logging
- Linting
- Testing
- S3 integration for data pull (S3 as single data store, no local pull)

## Resources

- https://kedro.readthedocs.io/en/stable/03_tutorial/01_spaceflights_tutorial.html
 