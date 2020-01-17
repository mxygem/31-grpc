# 31-grpc

Demo grpc client and server built along side the justforfunc videos around protobuf and grpc. [Video here](https://www.youtube.com/watch?v=uolTUtioIrc)

Initially done in Go and then expanded out with clients in different languages.

## How to run

* In one terminal tab, start up the server with `go run cmd/server/main.go`
* In another terminal, run client commands:
  * To add to the local db: `go run cmd/todo/main.go add your text here`
  * To read all from the local db: `go run cmd/todo/main.go list`

## Generate

* Go: `protoc -I . --go_out=plugins=grpc:. ./todo/todo.proto`
* Ruby: `grpc_tools_ruby_protoc -I ./todo --ruby_out=./clients/ruby/lib --grpc_out=.`
  * While protoc can generate the todo_pb.rb file, it doesn't seem to generate the services file we also need.
