#!/usr/bin/env ruby
# frozen_string_literal:true

this_dir = __dir__
lib_dir = File.join(this_dir, 'lib')
$LOAD_PATH.unshift(lib_dir) unless $LOAD_PATH.include?(lib_dir)

require 'grpc'
require 'todo_services_pb'
require 'pry-byebug'

def main
  stub = Todo::Tasks::Stub.new('localhost:8888', :this_channel_is_insecure)
  binding.pry
  message = stub.list
  p "List response: #{message}"
end

main
