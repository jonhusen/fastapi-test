FROM python:3

RUN apt install gcc python-dev libkrb5-dev

RUN pip install poetry==1.8.3

ENV POETRY_NO_INTERACTION=1 \
    POETRY_VIRTUALENVS_IN_PROJECT=1 \
    POETRY_VIRTUALENVS_CREATE=1 \
    POETRY_CACHE_DIR=/tmp/poetry_cache

WORKDIR /usr/src/app

COPY pyproject.toml poetry.lock ./
RUN touch README.md

RUN poetry install --without dev && rm-rf $POETRY_CACHE_DIR

COPY fastapi_test ./fastapi_test

RUN poetry install --without dev

ENTRYPOINT ["poetry", "run", "python", "-m", "fastapi_test.main"]
