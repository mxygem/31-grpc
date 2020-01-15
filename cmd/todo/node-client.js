const PROTO_PATH = __dirname + "/../../todo/todo.proto";
const port = "8888"
const grpc = require('grpc');
const protoLoader = require('@grpc/proto-loader');
const packageDefinition = protoLoader.loadSync(
    PROTO_PATH,
    {keepCase: true,
     longs: String,
     enums: String,
     defaults: true,
     oneofs: true
    });
const todo_proto = grpc.loadPackageDefinition(packageDefinition).todo;

function main() {
  const client = new todo_proto.Tasks(`localhost:${port}`, grpc.credentials.createInsecure());

  if (process.argv.length >= 3) {
    switch (process.argv[2].toLowerCase()) {
      case "list": 
        list(client)

        break;
      case "add":
        add(client, process.argv[3])

        break;
      default:
        console.log("unknown command specified")

        break;
    }
  } else {
    console.log("please include either the List or Add command!")
  }
}

const list = client => {
  client.list(null, (err, response) => {
    if (err) {
      console.log("could not complete list request!", err.details)
      return
    }

    console.log("current tasks:", response);
  })
}

const add = (client, text) => {
  console.log("received text:", text)
  client.add({"text": text}, (err, response) => {
    if (err) {
      console.log(`could not add item ${task}: ${err}`)
      return
    }
    
    console.log("successfully added task:", response.text);
  })
}

main();
