#!/usr/bin/env ruby
require "sinatra"
require "pry"

set :public_folder, File.dirname(__FILE__)

APPEND = "a"
CSV    = "main.csv"
DELIM  = ", "
HTML   = "main.html"
NONE   = "Empty response"
ROOT   = "/"

File.write(CSV, "") unless File.file?(CSV)

def add_user(name, email)
  row = [name, email].join(DELIM)
  open(CSV, APPEND) { |f| f.puts(row) }
end

get ROOT do
  File.read(HTML)
end

post ROOT do
  add_user(params.fetch(:name, NONE), params.fetch(:email, NONE))
  File.read(HTML)
end

