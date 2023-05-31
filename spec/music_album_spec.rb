require './classes/music_album'

describe MusicAlbum do
  context 'when testing musicAlbum class' do
    before :all do
      @music_album = MusicAlbum.new('2020-01-01', true)
    end

    it 'should be an instance of musicAlbum class' do
      expect(@music_album).to be_an_instance_of(MusicAlbum)
    end

    it 'should have attributes of publish_date and on_spotify' do
      expect(@music_album).to have_attributes(publish_date: '2020-01-01', on_spotify: true)
    end

    it 'can_be_archived should return false when both publish_date AND on_spotify are not true' do
      expect(@music_album.can_be_archived?).to be false
    end

    it 'can_be_archived should return true when both publish_date AND on_spotify are true' do
      @music_album.publish_date = '2000-01-10'
      expect(@music_album.can_be_archived?).to be true
    end
  end
end
