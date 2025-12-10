FROM alpine:latest
RUN mkdir genesis
WORKDIR /app
COPY config.txt .
RUN -f "System Online" > status.txt
CMD [ "tail","-f","/dev/null" ]

# Day 2 test
