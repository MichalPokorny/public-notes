#!/usr/bin/ruby

# Dependencies: goodreads

# Want to optimize:
#   * How much information is the book likely to give me
#   * How long is it
#
# Proxies:
#   * Did I read something by that author already?
#   * 

require 'goodreads'
require 'pp'

api_key = File.read('/home/prvak/dropbox/hesla/goodreads_api_key').strip
client = Goodreads.new(api_key: api_key)

all_books = []

page = 1
loop do
	puts "Page #{page}..."

	shelf = client.shelf(44521971, 'to-read', per_page: 200, page: page)
	break if shelf.books.empty?

	books = shelf.books.map { |b| {
		title: b.book.title,
		isbn: b.book.isbn,
		isbn13: b.book.isbn13,
		url: b.book.link,
		author: b.book.authors.author.name,
		num_pages: b.book.num_pages.to_i,
		average_rating: b.book.average_rating.to_f,
		read_at: b.read_at,
		owned: (b.owned != "0"),
	} }

	page += 1
	all_books += books
end

File.open('generated/goodreads.ttl', 'w') do |f|
	for book in all_books
		if book[:isbn]
			f.puts "isbn:#{book[:isbn]} :title \"#{book[:title]}\" ;"
		elsif book[:isbn13]
			f.puts "isbn13:#{book[:isbn13]} :title \"#{book[:title]}\" ;"
		else
			puts "(Book has no ISBN: #{book[:title]})"
			next
		end

		f.puts "\t:goodreads-url <#{book[:url]}> ;"
		f.puts "\t:author \"#{book[:author]}\" ;"

		if book[:num_pages] != 0
			f.puts "\t:num-pages \"#{book[:num_pages]}\" ;"
		end

		if book[:read_at]
			f.puts "\t:read_at \"#{book[:read_at]}\" ;"
		end

		f.puts "\t:average-rating \"#{book[:average_rating]}\" ."
		f.puts "\t:owned \"#{book[:owned]}\" ."
		f.puts
	end
end
