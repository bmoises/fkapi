require 'net/http'
require 'yaml'
#require 'json'
require 'sinatra'
require 'optparse'

#$:.unshift File.dirname(__FILE__)

Dir["#{ File.dirname(__FILE__)}/fkapi/*.rb"].each{|f| require f}

module Fkapi
  # Your code goes here...
end
