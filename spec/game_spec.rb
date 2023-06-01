require './classes/game'

describe Game do
  context 'when testing game class' do
    before :all do
      @game = Game.new('2000-01-01', true, '2021-01-01')
    end

    it 'should be an instance of game' do
      expect(@game).to be_an_instance_of(Game)
    end

    it 'should have publish_date, multiplayer and last_played attributes' do
      expect(@game).to have_attributes(publish_date: '2000-01-01', multiplayer: true, last_played: '2021-01-01')
    end

    it "should return false if parent's method returns false AND if last_played_at is less than 2 years" do
      expect(@game.can_be_archived?).to be false
    end

    it "should return true if parent's method returns true AND if last_played_at is older than 2 years" do
      @game.last_played = '2019-01-01'
      expect(@game.can_be_archived?).to be true
    end
  end
end
