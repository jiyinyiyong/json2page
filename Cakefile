
{print} = require "util"
{spawn, exec} = require "child_process"

echo = (child) ->
  child.stderr.pipe process.stderr
  child.stdout.pipe process.stdout

d = __dirname
split = (str) -> str.split " "

queue = [
  "jade -O #{d}/page/ -wP #{d}/src/"
  "stylus -o #{d}/page/ -w #{d}/src/"
  "coffee -o #{d}/page/ -wb #{d}/src/"
  "doodle #{d}/page/"
]

task "dev", "watch and convert files", ->
  queue.map(split).forEach (array) ->
    echo (spawn array[0], array[1..])