class Parser
  getter parser : LibCmark::CmarkParser

  # Creates a new cmark-gfm's parser abstraction with the defined options.
  def initialize(options : Int32)
    LibCmark.cmark_gfm_core_extensions_ensure_registered

    @parser = LibCmark.cmark_parser_new(options)
  end

  # Feeds a string to parser.
  def parse!(text : String)
    LibCmark.parser_feed(parser, text, text.bytesize)
  end

  # Returns a list containing the extensions of the current parser.
  def get_extensions
    LibCmark.cmark_parser_get_syntax_extensions(parser)
  end

  def add_extension(name : String)
    extension = LibCmark.cmark_find_syntax_extension(name)

    if extension.null?
      raise "Unknown extension #{name}"
    end

    result = LibCmark.cmark_parser_attach_syntax_extension(parser, extension)

    if result == 0
      raise "Unable to attach #{name}"
    end

    true
  end

  def add_extensions(extensions = [] of String)
    extensions.each { |name| add_extension(name) }
  end

  # Finish parsing and return a pointer to a tree of nodes.
  def finish
    LibCmark.parser_finish(parser)
  end
end
