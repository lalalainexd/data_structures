require 'rspec'
require_relative './binary_search_tree'

describe BST do
  let(:bst) { BST.new("key", "value") }

  context "a tree of with height of 1" do
    it "has a value" do
      expect(bst.value).to eq "value"
    end

    it "has a key" do
      expect(bst.key).to eq "key"
    end

    it "has no left child" do
      expect(bst.left).to be_nil
    end

    describe "insert" do

      let(:subtree) {stub(:subtree)}

      context "with a key greater than the root key" do

        it "is inserted to the right" do
          bst.insert("zkey", "value2")
          bst.right.value.should == "value2"
          bst.right.key.should == "zkey"
        end
      end

      context "with a key less than the root key" do
        it "is inserted to the left" do
          bst.insert("akey", "value2")
          bst.left.value.should == "value2"
          bst.left.key.should == "akey"
        end
      end

    end
  end

  context "a tree of height 2 or more" do

    before do
      bst.insert("akey", "valueA")
      bst.insert("zkey", "valueZ")
    end

    describe "insert" do

      context "with a key greater than the root key" do
        it "inserts somewhere in right tree" do
          bst.insert("xkey", "valueX")
          expect(bst.right.left.value).to eq "valueX"
        end
      end

      context "with a key less than the root key" do
        it "inserts somewhere in left tree" do
          bst.insert("bkey", "valueB")
          expect(bst.left.right.value).to eq "valueB"
        end
      end
    end
  end

  describe "search" do

    before do
      bst.insert("bkey", "valueB")
      bst.insert("akey", "valueA")
      bst.insert("ckey", "valueC")
      bst.insert("dkey", "valueD")
      bst.insert("xkey", "valueX")
      bst.insert("ykey", "valueY")
      bst.insert("wkey", "valueW")
      bst.insert("zkey", "valueZ")
    end

    context "the key exists" do

      it "returns 'value' given the key 'key'" do
        expect(bst.search("key").value).to eq "value"
      end

      it "returns 'valueA' given the key 'akey'" do
        expect(bst.search("akey").value).to eq "valueA"
      end

      it "returns 'value'X given the key 'xkey'" do
        expect(bst.search("xkey").value).to eq "valueX"
      end
    end

    context "the key doesn't exist" do
      it "returns nil given the key 'bleh'" do
        expect(bst.search("bleh")).to be_nil
      end

      it "returns nil given the key 'xbleh'" do
        expect(bst.search("xbleh")).to be_nil
      end
    end

  end

end
