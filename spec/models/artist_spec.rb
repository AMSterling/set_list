require 'rails_helper'

RSpec.describe Artist do
  it {should have_many :songs}

  describe 'instance methods' do
    describe '#average_song_length' do
      it 'returns the average song length' do
        prince = Artist.create!(name: 'Prince')
        purple = prince.songs.create!(title: 'Purple Rain', length: 841, play_count: 9000)
        beret = prince.songs.create!(title: 'Raspberry Beret', length: 331, play_count: 9566)
        #cream = prince.songs.create!(title: 'Cream', length: 412, play_count: 8174)
        kiss = prince.songs.create!(title: 'Kiss', length: 357, play_count: 8629)

        expect(prince.average_song_length.round(2)).to eq 509.67
      end
    end
  end
end
