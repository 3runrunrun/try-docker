# Runs the alpine Linux distribution
# SMALL-sized and installed with Golang
FROM golang:alpine

# Set necessary environmet variables needed for our image
# GO111MODULE is a variable used for how Go imports packages
ENV GO111MODULE=on \
    CGO_ENABLED=0 \
    GOOS=linux \
    GOARCH=amd64

# Move to working directory /build
WORKDIR /build

# Copy and download dependency using go mod
COPY go.mod .
COPY go.sum .
RUN go mod download

# Copy the code into the container
COPY . .

# Build the application
RUN go build -o main .

# Move to /dist directory as the place for resulting binary folder
WORKDIR /dist

# Copy binary from build to main folder
RUN cp /build/main .

# Export necessary port
# so the application could listen through the exposed port
EXPOSE 3682

# Command to run when starting the container
CMD ["/dist/main"]


# then build image with command (without hashtag):
# docker build . -t try-docker

# to run the image, run this command (without hashtag):
# docker run -p 3682:3682 try-docker
# 
# The flag -p is to define the port binding
# the port binding variable is like >> $HOST_PORT:$PORT
# $PORT is port inside the container, which is 3682
# $HOST_PORT is changeable if we want to bind $PORT to another $HOST_PORT, but we define the same value as $PORT