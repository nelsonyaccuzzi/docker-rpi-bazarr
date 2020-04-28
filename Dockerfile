FROM arm32v7/alpine:edge as git

ARG BAZARR_CP=/var/lib/bazarr

RUN apk add git \
 && git clone https://github.com/morpheus65535/bazarr.git $BAZARR_CP\
 && rm -rf $BAZARR_CP/.git $BAZARR_CP/bin/{Windows, MacOSX}

FROM arm32v7/python:3.7-alpine

ARG BAZARR_CP=/var/lib/bazarr

RUN apk add --no-cache libxml2-dev libxslt-dev git

COPY --from=git $BAZARR_CP $BAZARR_CP

VOLUME ["/config", "/data"]

WORKDIR $BAZARR_CP

CMD ["python", "bazarr.py", "-c", "/config", "--debug","True"]
