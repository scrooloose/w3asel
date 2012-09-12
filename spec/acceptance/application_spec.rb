require File.dirname(__FILE__) + "/../spec_helper"

describe "Checking a local file for errors" do
  it "The application checks a file with no errors and reports that it is all good" do
    $stdout.should_receive(:puts).with(/Syntax OK/)
    run_with_test_file("valid.xhtml")
  end

  it "The application finds one error and reports it" do
    W3Site.any_instance.stub(:results).and_return(open(output_test_file_path('one_error.xhtml')))
    $stdout.should_receive(:puts).with(/Error: line 9, column 12: end tag for "html" omitted, but OMITTAG NO was specified/)
    run_with_test_file("one_error.xhtml")
  end
end

