require './classes/book'

describe Book do
  context 'When testing book class' do
    before :all do
      @book = Book.new('2022-01-02', 'Oxford', 'bad')
    end

    it 'should be an instance of book class' do
      expect(@book).to be_an_instance_of Book
    end

    it 'should be archievable' do
      expect(@book.can_be_archived?).to eq(true)
    end

    it 'should be not archievable if cover state is good' do
      @book.cover_state = 'good'
      expect(@book.can_be_archived?).to eq(false)
    end
  end
end
