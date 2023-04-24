FROM rubylang/ruby:3.1.2-focal

RUN apt-get update -qq \
  && apt-get dist-upgrade -yq \
  && apt-get install -yq --no-install-recommends \
    libcurl4-openssl-dev \
    vim \
    curl \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
  && truncate -s 0 /var/log/*log

ENV LANG=C.UTF-8 \
  TZ=Asia/Tokyo \
  GEM_HOME=/bundle \
  BUNDLE_JOBS=4 \
  BUNDLE_RETRY=3
ENV BUNDLE_PATH=$GEM_HOME
ENV BUNDLE_APP_CONFIG=$BUNDLE_PATH \
  BUNDLE_BIN=$BUNDLE_PATH/bin
ENV PATH /app/bin:$BUNDLE_BIN:$PATH

WORKDIR /app

COPY Gemfile Gemfile.lock /app/

RUN bundle

COPY . /app
