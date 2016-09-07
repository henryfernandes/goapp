# Start from a Debian image with the latest version of Go installed
# and a workspace (GOPATH) configured at /go.
FROM golang

# Copy the local package files to the container's workspace.
#RUN mkdir -p /app && export GOPATH=/app && export PATH=$PATH:$GOPATH/bin && mkdir -p $GOPATH/src/github.com/user 
#RUN mkdir $GOPATH/src/github.com/user/goapp 
#RUN adduser --home /home/deployer --shell /bin/bash deployer 

RUN mkdir -p /go/src/app
ADD new.go /go/src/app/
RUN cd /go/src/app/ && go install

# Build the outyet command inside the container.
# # (You may fetch or manage dependencies here,
# # either manually or with a tool like "godep".)
#RUN go install

# # Run the outyet command by default when the container starts.
ENTRYPOINT /go/bin/app

 # Document that the service listens on port 8080.
EXPOSE 8484


