require 'pg'

class BookmarkEntry
	
  def self.all
		if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end

		result = connection.exec('SELECT * FROM bookmarks')
		result.map { |bookmark| bookmark }
	end

	def self.urls
		all_bookmarks = self.all
		all_bookmarks.map { |bookmark| bookmark["url"] }
	end

	def self.create(url, name)
		if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end

		connection.exec("INSERT INTO bookmarks (url, name) VALUES('#{url}', '#{name}')")
	end
end