ARG VERSION=3.13
FROM alpine:$VERSION as builder
ARG VERSION
ENV MSG "Hello Wolrd !!"
RUN apk update && apk upgrade && apk add bash
RUN echo "$VERSION test" > /messages.txt
FROM alpine:$VERSION
WORKDIR /opt
COPY --from=builder /messages.txt /opt/mem-messages.txt
CMD ["cat","/opt/mem-messages.txt"]