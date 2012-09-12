require "rubygems"
require "bundler/setup"

require "nokogiri"

lib_dir = File.dirname(__FILE__) + "/w3_scraper"
require "#{lib_dir}/error"
require "#{lib_dir}/parser"
require "#{lib_dir}/w3_scraper_app"
require "#{lib_dir}/w3_site"
