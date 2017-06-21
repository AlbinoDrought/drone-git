FROM alpine:3.5

RUN apk update && \
  apk add \
    ca-certificates \
    git \
    openssh \
    curl \
    perl && \
  rm -rf /var/cache/apk/*
  
RUN git config --global url."https://bitbucket.org".insteadOf ssh://git@bitbucket.org

ADD drone-git /bin/
ENTRYPOINT ["/bin/drone-git"]
