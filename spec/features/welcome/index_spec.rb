require 'rails_helper'

RSpec.describe "Welcome page" do
  describe 'welcome page display' do
    it 'has a welcome message' do
      visit '/'
      expect(page).to have_content("Welcome to med search")
      expect(page).to have_field("Medical Provider's First Name")
    end
  end
  describe 'provider searches' do
    it 'last name and location' do
      VCR.use_cassette 'location_last_name_search_2' do
        visit '/'

        fill_in(:last_name_1, :with => 'Kemp')
        fill_in(:state, :with => 'co')
        save_and_open_page
        click_button("Search by Last Name and Location")
        expect(current_path).to eq('/providers')
      end
    end
    it 'first and last name' do
      VCR.use_cassette 'first_name_last_name_search_2' do
        visit '/'

        fill_in(:last_name_2, :with => 'Kemp')
        fill_in(:first_name, :with => 'Laura')
        click_button("Search by Full Name")
        expect(current_path).to eq('/providers')
      end
    end

    it 'last name and specialty' do
      VCR.use_cassette 'specialty_last_name__search_2' do
        visit '/'

        fill_in(:last_name_3, :with => 'Kemp')
        fill_in(:specialty, :with => 'midwife')
        click_button("Search by Specialty")
        expect(current_path).to eq('/providers')
      end
    end
  end
end
