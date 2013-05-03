require 'rspec'
require_relative '../lib/linked_list'

describe LinkedList do
  let(:list) { LinkedList.new("value") }

  describe "add" do
    it "adds it to the end" do
      list.add("value2")
      expect(list.next.value).to eq "value2"
    end

    it "adds it to the end" do
      list.add("value2")
      list.add("value3")
      expect(list.next.next.value).to eq "value3"
    end
  end

  describe "search" do

    before do
      list.add("value1")
      list.add("value2")
      list.add("value3")
    end

    context "the value exists" do

      it "returns 'value' given the value 'value'" do
        expect(list.find("value").value).to eq "value"
      end

      it "returns 'value1' given the value 'value1'" do
        expect(list.find("value1").value).to eq "value1"
      end

      it "returns 'value3' given the value 'value3'" do
        expect(list.find("value3").value).to eq "value3"
      end
    end

    context "the value doesn't exist" do
      it "returns nil" do
        expect(list.find("blarghl")).to be_nil
      end
    end
  end

end
