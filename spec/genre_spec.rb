require './classes/genre'

describe Genre do
  context 'when testing genre class' do
    before :all do
      @genre = Genre.new('Rock')
    end

    it 'should be an instance of genre class' do
      expect(@genre).to be_an_instance_of(Genre)
    end

    it 'should have attributes of name and items array' do
      expect(@genre).to have_attributes(name: 'Rock', items: [])
    end

    it 'items array should be empty' do
      expect(@genre.items).to be_empty
    end

    it 'should add item to items array using add_item' do
      item = double('item')
      allow(item).to receive(:genre=).with(@genre)
      @genre.add_item(item)
      expect(@genre.items).to include(item)
    end
  end
end
