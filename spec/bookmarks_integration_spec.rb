require './models/bookmark_manager.rb'

RSpec.describe "lists bookmarks from database" do
  it "includes bookmarks from database" do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    connection.exec("INSERT INTO bookmarks (url, name) VALUES ('https://makers.tech', 'Makers');")
    connection.exec("INSERT INTO bookmarks (url, name) VALUES ('https://github.com', 'Github');")
    bookmarks = BookmarkEntry.urls

    expect(bookmarks).to include('https://makers.tech')
    expect(bookmarks).to include('https://github.com')
  end
end

describe "adds bookmark entry to database" do
  it "successfully adds input to database" do
    BookmarkEntry.create("http://www.example.org", "example")
  
    expect(BookmarkEntry.urls).to include("http://www.example.org")
  end
end
