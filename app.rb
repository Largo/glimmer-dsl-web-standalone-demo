require 'opal'
require 'glimmer-dsl-web'
require 'fileutils'

Opal.use_gem("opal-jquery")
Opal.use_gem("glimmer-dsl-web")

builder = Opal::Builder.new
builder.build('glimmer-dsl-web')
builder.build("./script.js.rb")
FileUtils.mkdir_p "build"
output = builder.to_s

#require "execjs"
#require 'terser'
#ExecJS.runtime = ExecJS::Runtimes::Node
#minified_output = Terser.new.compile(output)
#File.binwrite "build/build.js", minified_output

File.binwrite "build/build.js", output
