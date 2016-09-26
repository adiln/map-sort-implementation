require 'spec_helper'
describe Array do
  before :each do
    @ary = Array.new([7, 2, 0, 9, 4])
  end
  describe '@ary' do
    it "array contains elements" do
      expect(@ary.length).not_to eq(0)
    end
  end

  describe 'my_sort' do
     it "sorts elements" do
       expect(@ary.my_sort).to eq([0, 2, 4, 7, 9])
     end
  end
end