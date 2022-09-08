FROM python:3.9-slim as testbox

RUN mkdir -p /code
WORKDIR /code
COPY ./pyprojects.toml /code

RUN pip install .[dev]
RUN pip install Django==3.2.15

COPY ./ /code

CMD ["tox"]
