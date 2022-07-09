require 'rails_helper'

RSpec.describe 'Atrists songs index' do
  it 'shows all of the songs for the artist' do
    prince = Artist.create!(name: 'Prince')
    purple = prince.songs.create!(title: 'Purple Rain', length: 841, play_count: 9000)
    beret = prince.songs.create!(title: 'Raspberry Beret', length: 331, play_count: 9566)

    visit "/artists/#{prince.id}/songs"

    expect(page).to have_content(purple.title)
    expect(page).to have_content(beret.title)
  end

  it 'links to each songs show page' do
    prince = Artist.create!(name: 'Prince')
    purple = prince.songs.create!(title: 'Purple Rain', length: 841, play_count: 9000)
    beret = prince.songs.create!(title: 'Raspberry Beret', length: 331, play_count: 9566)

    visit "/artists/#{prince.id}/songs"
    click_on purple.title

    expect(current_path).to eq("/songs/#{purple.id}")
  end

  it 'shows the average length for the artist' do
    prince = Artist.create!(name: 'Prince')
    purple = prince.songs.create!(title: 'Purple Rain', length: 841, play_count: 9000)
    beret = prince.songs.create!(title: 'Raspberry Beret', length: 331, play_count: 9566)

    visit "/artists/#{prince.id}/songs"

    expect(page).to have_content("Average Song Length for Prince: 586")
  end
end
