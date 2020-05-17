# frozen_string_literal: true

require 'strscan'

RSpec.describe StringScanner do
  let(:buff) { StringScanner.new "testing" }
  it "can peek one step ahead" do
    expect(buff.peek 1).to eq "t"
  end
  it "can read one char and return it" do
    expect(buff.getch).to eq "t"
    expect(buff.getch).to eq "e"
  end
end
