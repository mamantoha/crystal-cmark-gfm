@[Link(ldflags: "#{__DIR__}/../ext/*.a")]
lib LibCmark
  type CmarkParser = Void*
  fun cmark_parser_new(options : LibC::Int) : CmarkParser

  struct X_CmarkLlist
    next : X_CmarkLlist*
    data : Void*
  end

  type CmarkLlist = X_CmarkLlist
  fun cmark_parser_get_syntax_extensions(parser : CmarkParser) : CmarkLlist*
  type CmarkNode = Void*
  fun node_free = cmark_node_free(node : CmarkNode)
  type CmarkSyntaxExtension = Void*
  fun cmark_find_syntax_extension(name : LibC::Char*) : CmarkSyntaxExtension
  fun cmark_parser_attach_syntax_extension(parser : CmarkParser, extension : CmarkSyntaxExtension) : LibC::Int
  fun cmark_gfm_core_extensions_ensure_registered
  fun parser_feed = cmark_parser_feed(parser : CmarkParser, buffer : LibC::Char*, len : LibC::SizeT)
  fun parser_finish = cmark_parser_finish(parser : CmarkParser) : CmarkNode
  fun render_html = cmark_render_html(root : CmarkNode, options : LibC::Int, extensions : CmarkLlist*) : LibC::Char*
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
  VERSION                           = ((((0 << 24) | (29 << 16)) | (0 << 8)) | 0)
  VERSION_STRING                    = "0.29.0.gfm.0"
end
