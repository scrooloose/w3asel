class W3ScraperApp
  def initialize(filename)
    @filename = filename
  end

  def run
    if parser.errors.any?
      print_errors(parser.errors)
    else
      puts "Syntax OK"
    end
  end

  private

    def parser
      @parser ||= Parser.new(output_from_w3_validator)
    end

    def output_from_w3_validator
      W3Site.new(@filename).results
    end

    def print_errors(errors)
      errors.map do |error|
        puts "Error: line #{error.line}, column #{error.col}: #{error.msg}\n"
      end
    end
end
