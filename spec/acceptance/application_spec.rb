require File.dirname(__FILE__) + "/../spec_helper"

describe "Checking a local file for errors" do
  it "The application checks a file with no errors and reports that it is all good" do
    should_output('Syntax OK')
    W3Site.any_instance.stub(:results).and_return(open(output_test_file_path('valid.xhtml')))

    run_with_test_file("valid.xhtml")
  end

  it "The application checks a file with errors and reports them" do
    W3Site.any_instance.stub(:results).and_return(open(output_test_file_path('4_errors.xhtml')))

    should_output_error(9, 21, '"tag" is not a member of a group specified for any attribute')
    should_output_error(9, 21, 'element "invalid" undefined')
    should_output_error(10, 19, 'name start character invalid: only S separators and TAGC allowed here')
    should_output_error(11, 12, 'end tag for "html" omitted, but OMITTAG NO was specified')

    run_with_test_file("4_errors.xhtml")
  end
end

describe "CLI" do
  it "The app is given invalid args and prints the usage and aborts" do
    should_output('Usage:')
    lambda {
      W3aselApp.new(['invalid file']).run
    }.should raise_error(SystemExit)
  end
end

def should_output_error(line, column, msg)
  should_output(%Q(Error: line #{line}, column #{column}: #{msg}))
end

def should_output(msg)
  $stdout.should_receive(:puts).with(Regexp.new(msg))
end

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

def root_dir
  @root_dir ||= File.dirname(__FILE__) + "/.."
end
