def require_lib_file(file)
  require File.dirname(__FILE__) + "/../lib/#{file}"
end

require_lib_file("w3asel")

def run_with_test_file(test_file)
  weasel = W3aselApp.new([test_file_path(test_file)])
  weasel.run
end

def output_test_file_path(test_file)
  "#{root_dir}/spec/test_files/outputs/#{test_file}"
end

def test_file_path(test_file)
  "#{root_dir}/spec/test_files/#{test_file}"
end

def executable
  @executable ||= "#{root_dir}/bin/w3asel"
end

def root_dir
  @root_dir ||= File.dirname(__FILE__) + "/.."
end
