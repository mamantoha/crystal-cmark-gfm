require "./spec_helper"

describe CommonMarker do
  it "have cmark version" do
    (CommonMarker::CMARK_VERSION).should_not be_nil
  end

  describe "#initialize" do
    it "raise exception with unknown extensions" do
      expect_raises Exception, "Unknown extension pipeline" do
        text = "_Hello_ **world**"
        extensions = ["pipeline"]
        CommonMarker.new(text, extensions: extensions)
      end
    end
  end

  describe "#to_html" do
    it "should parse markdown" do
      text = "_Hello_ **world**"
      md = CommonMarker.new(text)
      html = md.to_html
      html.should eq("<p><em>Hello</em> <strong>world</strong></p>\n")
    end

    it "should parse markdown with options and extensions" do
      text = "_Hello_ **world**"
      extensions = ["table", "strikethrough", "autolink", "tagfilter", "tasklist"]
      options = ["unsafe"]
      md = CommonMarker.new(text, options: options, extensions: extensions)
      html = md.to_html
      html.should eq("<p><em>Hello</em> <strong>world</strong></p>\n")
    end

    it "should parse markdown tables" do
      text = <<-TXT
        | Month    | Savings |
        | -------- | ------- |
        | January  | $250    |
        | February | $80     |
        | March    | $420    |
        TXT

      markdown = <<-TXT
        <table>
        <thead>
        <tr>
        <th>Month</th>
        <th>Savings</th>
        </tr>
        </thead>
        <tbody>
        <tr>
        <td>January</td>
        <td>$250</td>
        </tr>
        <tr>
        <td>February</td>
        <td>$80</td>
        </tr>
        <tr>
        <td>March</td>
        <td>$420</td>
        </tr>
        </tbody>
        </table>

        TXT

      extensions = ["table", "strikethrough", "autolink", "tagfilter", "tasklist"]
      options = ["unsafe"]
      md = CommonMarker.new(text, options: options, extensions: extensions)
      html = md.to_html

      html.should eq(markdown)
    end
  end
end
