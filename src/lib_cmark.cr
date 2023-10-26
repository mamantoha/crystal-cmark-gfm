@[Link(ldflags: "#{__DIR__}/../ext/libcmark-gfm-extensions.a #{__DIR__}/../ext/libcmark-gfm.a")]
lib LibCmark
  type CmarkParser = Void*
  fun cmark_parser_new(options : LibC::Int) : CmarkParser
  fun cmark_parser_get_syntax_extensions(parser : CmarkParser) : CmarkParser
  fun node_free = cmark_node_free(node : CmarkParser)
  fun cmark_find_syntax_extension(name : LibC::Char*) : CmarkParser
  fun cmark_parser_attach_syntax_extension(parser : CmarkParser, extension : CmarkParser) : LibC::Int
  fun cmark_gfm_core_extensions_ensure_registered
  fun parser_feed = cmark_parser_feed(parser : CmarkParser, buffer : LibC::Char*, len : LibC::SizeT)
  fun parser_finish = cmark_parser_finish(parser : CmarkParser) : CmarkParser
  fun render_html = cmark_render_html(root : CmarkParser, options : LibC::Int, extensions : CmarkParser) : LibC::Char*
  OPT_DEFAULT                       = 0
  OPT_SOURCEPOS                     = (1 << 1)
  OPT_HARDBREAKS                    = (1 << 2)
  OPT_NORMALIZE                     = (1 << 8)
  OPT_UNSAFE                        = (1 << 17)
  OPT_NOBREAKS                      = (1 << 4)
  OPT_VALIDATE_UTF8                 = (1 << 9)
  OPT_SMART                         = (1 << 10)
  OPT_GITHUB_PRE_LANG               = (1 << 11)
  OPT_LIBERAL_HTML_TAG              = (1 << 12)
  OPT_FOOTNOTES                     = (1 << 13)
  OPT_STRIKETHROUGH_DOUBLE_TILDE    = (1 << 14)
  OPT_TABLE_PREFER_STYLE_ATTRIBUTES = (1 << 15)
  VERSION                           = ((((0 << 24) | (29 << 16)) | (0 << 8)) | 2)
  VERSION_STRING                    = "0.29.0.gfm.2"
end
