

feature "viewing all saved bookmarks" do
	scenario "user clicks on view bokmarks button" do
		visit '/'
		click_on 'View Bookmarks'

		expect(page).to have_content "Your Bookmarks"
	end

	scenario "shows user all saved bookmarks" do
		visit '/bookmarks'

		expect(page).to have_link("Makers")
	end
end
