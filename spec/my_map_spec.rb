require 'spec_helper'
describe Array do
  before :each do
    @ary = Array.new([3, 4, 5, 6])
  end
  describe '@ary' do
    it "array contains elements" do
      expect(@ary.length).not_to eq(0)
    end
  end

  describe 'my_map' do
    it "transforming the elements" do
      expect(@ary.my_map{|e| e + 1 }).to eq([4, 5, 6, 7])
    end
  end
end