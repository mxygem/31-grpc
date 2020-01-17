#!/usr/bin/env ruby
# frozen_string_literal:true

this_dir = __dir__
lib_dir = File.join(this_dir, 'lib/todo')
$LOAD_PATH.unshift(lib_dir) unless $LOAD_PATH.include?(lib_dir)
PORT = 8888

require 'google/protobuf'
require 'grpc'
require 'todo_services_pb'
require 'pry-byebug'

def main
  if ARGV.length.zero?
    puts 'please provide either list or add [value] when running the client'
    return
  end

  stub = Todo::Tasks::Stub.new("localhost:#{PORT}", :this_channel_is_insecure)

  case ARGV[0]
  when 'list'
    list(stub)
  when 'add'
    add(stub, ARGV[1])
  else
    puts "unknown command #{ARGV[0]}, please try with list or add [value]"
    return
  end
end

def list(stub)
  tasks = stub.list(Todo::ListRequest.new({})).tasks

  tasks.each do |m|
    puts m.text
  end
end

def add(stub, value)
  task = stub.add(Todo::Text.new(text: value))

  puts "successfully added task: #{task.text}"
end

main
