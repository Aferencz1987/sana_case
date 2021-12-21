require 'rails_helper'

RSpec.describe "provider page" do
  describe 'provider results' do
    it 'last name and location results' do
      VCR.use_cassette 'location_last_name_search' do
        visit '/'

        fill_in(:last_name_1, :with => 'kemp')
        fill_in(:state, :with => 'co')
        click_button("Search by Last Name and Location")
        expect(page).to have_content(/kemp/i)
        expect(page).to have_content("Results")
      end
    end

    it 'first and last name' do
      VCR.use_cassette 'first_name_last_name_search' do
        visit '/'

        fill_in(:last_name_2, :with => 'kemp')
        fill_in(:first_name, :with => 'laura')
        click_button("Search by Full Name")

        expect(page).to have_content(/kemp/i)
        expect(page).to have_content("Results")
      end
    end
    it 'last name and specialty' do
      VCR.use_cassette 'specialty_last_name__search' do
        visit '/'

        fill_in(:last_name_3, :with => 'kemp')
        fill_in(:specialty, :with => 'midwife')
        click_button("Search by Specialty")

        expect(page).to have_content(/kemp/i)
        expect(page).to have_content(/midwife/i)
        expect(page).to have_content("Results")
      end
    end
  end
end
