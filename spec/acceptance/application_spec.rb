describe "Checking a local file for errors" do
  it "The application checks a file with no errors and reports that it is all good" do
    output = run_with_test_file("valid.xhtml")
    output.should == "Syntax OK"
  end
end

def run_with_test_file(test_file)
  cmd = "#{executable} #{test_file_path(test_file)}"
  `#{cmd}`
end

def test_file_path(test_file)
  "#{root_dir}/spec/test_files/#{test_file}"
end

def executable
  @executable ||= "#{root_dir}/bin/w3scraper"
end

def root_dir
  @root_dir ||= File.expand_path("../../")
end
