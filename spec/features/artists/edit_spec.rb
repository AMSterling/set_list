require 'rails_helper'

RSpec.describe 'the artist edit' do
  it 'links to the edit page' do
    artist = Artist.create!(name: 'Elton John')
    visit '/artists'

    click_button "Edit #{artist.name}"

    expect(current_path).to eq("/artists/#{artist.id}/edit")
  end

  it 'can edit the artist' do
    artist = Artist.create!(name: 'Eton John')

    visit '/artists'

    expect(page).to have_content('Eton John')

    click_button 'Edit Eton John'

    fill_in 'Name', with: 'Elton John'
    
    click_button 'Update Artist'

    expect(current_path).to eq('/artists')
    expect(page).to have_content('Elton John')
  end
end
