require './item'
require 'date'

describe Item do
  context 'When testing Item class' do
    before :all do
      @item = Item.new('2023-05-30')
    end

    it 'should be an instance of item' do
      expect(@item).to be_an_instance_of Item
    end

    it 'should have a publish date' do
      expect(@item.publish_date).to eq('2023-05-30')
    end

    it 'should have archived as false' do
      expect(@item.archived).to eq(false)
    end

    it 'should return true for an item that can be archived' do
      publish_date = "#{Time.now.year - 11}-01-01"
      @item = Item.new(publish_date)

      expect(@item.can_be_archived?).to be true
    end

    it 'should return false for an item that cannot be archived' do
      publish_date = "#{Time.now.year - 9}-01-01"
      @item = Item.new(publish_date)

      expect(@item.can_be_archived?).to be false
    end

    it 'should move to archive if can_be_archived? returns true' do
      publish_date = "#{Time.now.year - 11}-01-01"
      @item = Item.new(publish_date)

      @item.move_to_archive

      expect(@item.archived).to be true
    end
  end
end
