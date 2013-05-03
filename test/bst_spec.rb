require 'rspec'
require_relative '../lib/binary_search_tree'

describe BST do
  let(:bst) { BST.new(4) }

  context "a tree of with height of 1" do
    it "has a value" do
      expect(bst.value).to eq 4
    end

    it "has no left child" do
      expect(bst.left).to be_nil
    end

    describe "insert" do

      context "with a value greater than the root value" do

        it "is inserted to the right" do
          bst.insert(6)
          bst.right.value.should == 6
        end
      end

      context "with a value less than the root value" do
        it "is inserted to the left" do
          bst.insert(2)
          bst.left.value.should == 2
        end
      end

    end
  end

  context "a tree of height 2 or more" do

    before do
      bst.insert(2)
      bst.insert(6)
    end

    describe "insert" do

      context "with a value greater than the root value" do
        it "inserts somewhere in right tree" do
          bst.insert(5)
          expect(bst.right.left.value).to eq 5
        end
      end

      context "with a value less than the root value" do
        it "inserts somewhere in left tree" do
          bst.insert(3)
          expect(bst.left.right.value).to eq 3
        end
      end
    end
  end

  describe "search" do

    before do
      bst.insert(1)
      bst.insert(8)
      bst.insert(2)
      bst.insert(5)
      bst.insert(7)
      bst.insert(3)
      bst.insert(9)
      bst.insert(6)
    end

    context "the value exists" do

      it "returns the correct node given the value 4" do
        expect(bst.search(4)).to eq bst
      end

      it "returns the correct node given the value 2" do
        expect(bst.search(2).value).to eq 2
      end

      it "returns the correct node given the value 7" do
        expect(bst.search(7).value).to eq 7
      end
    end

    context "the value doesn't exist" do
      it "returns nil given the value -1" do
        expect(bst.search(-1)).to be_nil
      end

      it "returns nil given the value 20" do
        expect(bst.search(20)).to be_nil
      end
    end

  end

end
