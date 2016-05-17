require "rails_helper"

  describe "clients index", type: :feature do

    describe "see previous clients" do
      user = FactoryGirl.create(:user)
      let!(:client_1) { FactoryGirl.create(:client) }
      let!(:client_2) { FactoryGirl.create(:client) }

      it "displays a list of all clients" do
        visit "/"
        fill_in 'email', :with => "#{user.email}"
        fill_in 'password', :with => "#{user.password}"
        click_button('Login')
        expect(page).to have_content("address")
        # expect(page).to have_content("Clearance Batches")
        within('table') do
          expect(page).to have_content("#{client_1.id}")
          expect(page).to have_content("#{client_2.id}")
        end
      end

    end

end
