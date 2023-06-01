require './classes/author'

describe Author do
  context 'when testing author class' do
    before :all do
      @author = Author.new('Gordon', 'Ramsey')
    end

    it 'should be an instance of author' do
      expect(@author).to be_an_instance_of(Author)
    end

    it 'should have firstname and lastname attributes' do
      expect(@author).to have_attributes(firstname: 'Gordon', lastname: 'Ramsey')
    end

    it 'items array should be empty' do
      expect(@author.items).to be_empty
    end

    it 'add_items should add item to the items array' do
      item = double('item')
      allow(item).to receive(:author=)
      @author.add_item(item)
      expect(@author.items).to include(item)
    end
  end
end
