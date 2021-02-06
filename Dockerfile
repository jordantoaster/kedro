FROM jupyter/datascience-notebook
WORKDIR /code
COPY . .
RUN pip install -r requirements.txt
RUN kedro new --config config.yml
CMD ["jupyter", "notebook"]



