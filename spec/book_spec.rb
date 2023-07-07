require './classes/book'

describe Book do
  context 'When testing book class' do
    before :all do
      @book = Book.new('Oxford', '2022-01-02', 'Fiction', 'James')
    end

    it 'should be an instance of book class' do
      expect(@book).to be_an_instance_of Book
    end

    it 'should be not archievable if cover state is good' do
      @book.cover_state = 'good'
      expect(@book.can_be_archived?).to eq(false)
    end

    it 'should be archievable' do
      @book.publish_date = '2000-01-01'
      expect(@book.can_be_archived?).to eq(true)
    end
  end
end
