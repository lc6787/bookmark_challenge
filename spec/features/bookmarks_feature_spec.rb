

feature "viewing all saved bookmarks" do
	scenario "navigating to view bookmarks page" do
		visit '/'
		click_on 'View Bookmarks'

		expect(page).to have_content "Your Bookmarks"
	end

	scenario "shows user all saved bookmarks as list" do
		connection = PG.connect(dbname: 'bookmark_manager_test')

    connection.exec("INSERT INTO bookmarks (url, name) VALUES ('https://makers.tech', 'Makers');")
    connection.exec("INSERT INTO bookmarks (url, name) VALUES ('https://github.com', 'Github');")

    visit '/bookmarks'

    expect(page).to have_link('Makers', href: 'https://makers.tech')
    expect(page).to have_link('Github', href: 'https://github.com')
	end
end

feature "adding a bookmark" do
	scenario "user can submit a new bookmark entry" do
		visit '/add-bookmark'
		within("form") do
			fill_in 'bookmark_url', with: 'https://ruby-doc.org/'
			fill_in 'name', with: "Ruby Docs"
			click_on "Save Bookmark"
		end

		expect(page).to have_link('Ruby Docs', href: 'https://ruby-doc.org/' )
	end
end
