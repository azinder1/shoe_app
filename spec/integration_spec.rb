require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)


describe('navigation') do
  describe('navigates successfully to second page and back', {:type => :feature}) do
    it('navigates to first page') do
      visit('/')
      expect(page).to have_content("Foot Unlocker")
    end
    it('navigates to store page') do
      visit('/')
      click_link("Add a Store")
      expect(page).to have_content("Fill out the info about a new store")
    end
    it('takes in user inputted fields and appends them to homepage') do
      visit('/store/new')
      fill_in("Store Name:", :with => "Nike Outlet")
      fill_in("Address:", :with => "123 Sesame Street")
      fill_in("City:", :with => "Portland")
      fill_in("State:", :with => "Oregon")
      fill_in("Zip Code:", :with => 97212)
      click_button("Add Store")
      expect(page).to have_content('Nike Outlet')
    end
    it('can click on href for store page for details') do
      visit('/store/new')
      fill_in("Store Name:", :with => "Nike Outlet")
      fill_in("Address:", :with => "123 Sesame Street")
      fill_in("City:", :with => "Portland")
      fill_in("State:", :with => "Oregon")
      fill_in("Zip Code:", :with => 97212)
      click_button("Add Store")
      click_link("Nike Outlet")
      expect(page).to have_content('Nike Outlet')
    end
    it('can update page') do
      visit('/store/new')
      fill_in("Store Name:", :with => "Nike Outlet")
      fill_in("Address:", :with => "123 Sesame Street")
      fill_in("City:", :with => "Portland")
      fill_in("State:", :with => "Oregon")
      fill_in("Zip Code:", :with => 97212)
      click_button("Add Store")
      click_link("Nike Outlet")
      click_link("Update")
      fill_in("Store Name:", :with => "Adidas Outlet")
      fill_in("Address:", :with => "123 Sesame Street")
      fill_in("City:", :with => "Portland")
      fill_in("State:", :with => "Oregon")
      fill_in("Zip Code:", :with => 97212)
      click_button("Update Store")
      expect(page).to have_content('Adidas Outlet')
    end
    it('delete page') do
      visit('/store/new')
      fill_in("Store Name:", :with => "Nike Outlet")
      fill_in("Address:", :with => "123 Sesame Street")
      fill_in("City:", :with => "Portland")
      fill_in("State:", :with => "Oregon")
      fill_in("Zip Code:", :with => 97212)
      click_button("Add Store")
      click_link("Nike Outlet")
      click_link("Update")
      fill_in("Store Name:", :with => "Adidas Outlet")
      fill_in("Address:", :with => "123 Sesame Street")
      fill_in("City:", :with => "Portland")
      fill_in("State:", :with => "Oregon")
      fill_in("Zip Code:", :with => 97212)
      click_button("Update Store")
      click_button('Delete')
      expect(page).not_to have_content('Adidas Outlet')
    end
  end
end
