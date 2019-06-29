require "./spec_helper"

describe CommonMarker do
  it "have cmark version" do
    (CommonMarker::CMARK_VERSION).should_not be_nil
  end
end
