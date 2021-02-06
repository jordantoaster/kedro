# This could also be a Python3 base image.
FROM jupyter/datascience-notebook
WORKDIR /code
COPY requirements.txt . 
RUN pip install -r requirements.txt
RUN kedro new --config config.yml
# Pull the code in, after Kedro skeleton is in place.
COPY kedro .
CMD ["jupyter", "notebook"]



