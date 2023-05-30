require './label'
require './item'

describe Label do
  context 'When testing Label class' do
    before :all do
      @label = Label.new('K_arts', 'blue')
    end

    it 'should be an instance of Label' do
      expect(@label).to be_an_instance_of Label
    end

    it 'should have a title and color attributes' do
      expect(@label).to have_attributes(title: 'K_arts', color: 'blue')
    end

    it 'should have empty items array' do
      expect(@label.items).to be_empty
    end

    it 'should add item to items array' do
      @item = Item.new('2023-05-30')
      @label.add_item(@item)

      expect(@label.items).to include(@item)
    end
  end
end
