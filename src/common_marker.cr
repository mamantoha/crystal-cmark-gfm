require "./lib_cmark"
require "./common_marker/*"

class CommonMarker
  getter text : String
  getter parser : Parser

  CMARK_VERSION = LibCmark::VERSION_STRING

  def initialize(@text, options = [] of String, @extensions = [] of String)
    @options = LibCmark::OPT_DEFAULT
    parse_options!(options)

    @parser = Parser.new(@options)
    @parser.add_extensions(@extensions)
  end

  # Parses a Markdown string into an HTML string.
  def to_html : String
    extensions = parser.get_extensions

    parser.parse!(text)

    document = parser.finish

    result = LibCmark.render_html(document, @options, extensions)

    LibCmark.node_free(document)

    String.new(result)
  end

  private def parse_options!(options)
    @options |= LibCmark::OPT_SOURCEPOS if options.includes?("sourcepos")
    @options |= LibCmark::OPT_HARDBREAKS if options.includes?("hardbreaks")
    @options |= LibCmark::OPT_NORMALIZE if options.includes?("normalize")
    @options |= LibCmark::OPT_VALIDATE_UTF8 if options.includes?("validate_utf8")
    @options |= LibCmark::OPT_SMART if options.includes?("smart")
    @options |= LibCmark::OPT_UNSAFE if options.includes?("unsafe")
  end
end
