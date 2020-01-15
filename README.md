# 31-grpc

Demo grpc client and server built along side the justforfunc videos around protobuf and grpc. [Video here](https://www.youtube.com/watch?v=uolTUtioIrc)

## How to run

* In one terminal tab, start up the server with `go run cmd/server/main.go`
* In another terminal, run client commands:
  * To add to the local db: `go run cmd/todo/main.go add your text here`
  * To read all from the local db: `go run cmd/todo/main.go list`
