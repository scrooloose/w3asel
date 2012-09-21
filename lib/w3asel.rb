require "rubygems"
require "bundler/setup"

require "nokogiri"

lib_dir = File.dirname(__FILE__) + "/w3asel"
require "#{lib_dir}/error"
require "#{lib_dir}/parser"
require "#{lib_dir}/w3asel_app"
require "#{lib_dir}/w3_site"
