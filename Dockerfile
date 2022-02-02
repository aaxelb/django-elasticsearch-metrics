FROM python:3.10-buster as py_dev

RUN apt-get update && apt-get install -y \
    make \
    build-essential \
    libssl-dev \
    zlib1g-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    wget \
    curl \
    llvm \
    libncursesw5-dev \
    xz-utils \
    tk-dev \
    libxml2-dev \
    libxmlsec1-dev \
    libffi-dev \
    liblzma-dev \
    git

RUN git clone https://github.com/pyenv/pyenv.git /pyenv
ENV PYENV_ROOT "/pyenv"

RUN eval "$(/pyenv/bin/pyenv init --path)"
RUN eval "$(/pyenv/bin/pyenv init -)"

RUN /pyenv/bin/pyenv install 3.5.9
RUN /pyenv/bin/pyenv install 3.6.15
RUN /pyenv/bin/pyenv install 3.7.12
RUN /pyenv/bin/pyenv install 3.8.12
RUN /pyenv/bin/pyenv install 3.9.10

RUN /pyenv/bin/pyenv local 3.5.9 3.6.15 3.7.12 3.8.12 3.9.10

RUN ln -s /pyenv/bin/pyenv /usr/local/bin/pyenv

RUN mkdir -p /code
COPY . /code
WORKDIR /code

RUN pip install -e '.[dev]'
RUN pip install django

CMD pytest
