ARG BAZZAR_PATH=/var/lib/bazarr

FROM arm32v7/alpine:edge as git

ARG BAZZAR_PATH
ARG SW_VERSION

RUN apk add --no-cache git \
 && git clone https://github.com/morpheus65535/bazarr.git $BAZZAR_PATH \
 && git -C $BAZZAR_PATH checkout tags/v$SW_VERSION \    
 && rm -rf $BAZZAR_PATH/.git $BAZZAR_PATH/bin/{Windows, MacOSX}

FROM arm32v7/python:3.7-alpine

ARG BAZZAR_PATH

RUN apk add --no-cache libxml2-dev libxslt-dev git

COPY --from=git $BAZZAR_PATH $BAZZAR_PATH

WORKDIR $BAZZAR_PATH

CMD ["python", "bazarr.py", "-c", "/config", "--debug","True"]
