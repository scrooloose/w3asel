def require_lib_file(file)
  require File.dirname(__FILE__) + "/../lib/#{file}"
end

require_lib_file("w3_scraper_app")

def run_with_test_file(test_file)
  scraper = W3ScraperApp.new(test_file_path(test_file))
  scraper.run
end

def test_file_path(test_file)
  "#{root_dir}/spec/test_files/#{test_file}"
end

def executable
  @executable ||= "#{root_dir}/bin/w3scraper"
end

def root_dir
  @root_dir ||= File.dirname(__FILE__) + "/.."
end
