require 'rspec'
require_relative '../lib/linked_list'

describe LinkedList do
  let(:list) { LinkedList.new("key", "value") }

  describe "add" do
    it "adds it to the end" do
      list.add("key2", "value2")
      expect(list.next.value).to eq "value2"
    end

    it "adds it to the end" do
      list.add("key2", "value2")
      list.add("key3", "value3")
      expect(list.next.next.value).to eq "value3"
    end
  end

  describe "search" do

    before do
      list.add("key1", "value1")
      list.add("key2", "value2")
      list.add("key3", "value3")
    end

    context "the key exists" do

      it "returns 'value' given the key 'key'" do
        expect(list.find("key").value).to eq "value"
      end

      it "returns 'value1' given the key 'key1'" do
        expect(list.find("key1").value).to eq "value1"
      end

      it "returns 'value3' given the key 'key3'" do
        expect(list.find("key3").value).to eq "value3"
      end
    end
  end

end
