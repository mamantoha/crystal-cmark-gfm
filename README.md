# CommonMarker

[![Build Status](https://travis-ci.org/mamantoha/crystal-cmark-gfm.svg?branch=master)](https://travis-ci.org/mamantoha/crystal-cmark-gfm)
[![GitHub release](https://img.shields.io/github/release/mamantoha/crystal-cmark-gfm.svg)](https://github.com/mamantoha/crystal-cmark-gfm/releases)
[![License](https://img.shields.io/github/license/mamantoha/crystal-cmark-gfm.svg)](https://github.com/mamantoha/crystal-cmark-gfm/blob/master/LICENSE)

[Crystal](https://crystal-lang.org/) wrapper for [cmark-gfm](https://github.com/github/cmark-gfm), GitHub's fork of the reference parser for CommonMark.

This binding is statically linked with a specific version of cmark-gfm.

cmark-gfm supports simple parsing and rendering of markdown content.

If you want more features please check [cr-cmark-gfm](https://github.com/amauryt/cr-cmark-gfm).

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     common_marker:
       github: mamantoha/crystal-cmark-gfm
   ```

2. Run `shards install`

## Usage

```crystal
require "common_marker"

text = File.read("README.md")
extensions = ["table", "strikethrough", "autolink", "tagfilter", "tasklist"]
options = ["unsafe"]
md = CommonMarker.new(text, options: options, extensions: extensions)
html = md.to_html
```

## Extensions

`CommonMarker` initializer takes an optional third argument defining the extensions you want enabled as your CommonMark document is being processed. The documentation for these extensions are [defined in this spec](https://github.github.com/gfm/).

The available extensions are:

- `table` - This provides support for tables.
- `strikethrough` - This provides support for strikethroughs.
- `autolink` - This provides support for automatically converting URLs to anchor tags.
- `tagfilter` - This escapes [several "unsafe" HTML tags](https://github.github.com/gfm/#disallowed-raw-html-extension-), causing them to not have any effect.
- `tasklist` - This provides support for task list items.

## Development

```console
cd ext && make && cd ..
```

```console
crystal ./lib/crystal_lib/src/main.cr -- src/lib_cmark.cr.in > ./src/lib_cmark.cr
```

## Contributing

1. Fork it (<https://github.com/mamantoha/crystal-cmark-gfm/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Anton Maminov](https://github.com/mamantoha) - creator and maintainer
