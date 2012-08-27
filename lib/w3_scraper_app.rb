require File.dirname(__FILE__) + "/../lib/validator"

class W3ScraperApp
  def initialize(args)
    @args = args
  end

  def run
    v = Validator.new($1)

    unless v.warnings_or_errors?
      "Syntax OK"
    end
  end
end
