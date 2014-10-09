require 'mechanize'
require 'nokogiri'

class Scrape
	
	def initialize(search_path, save_destination)
		@search_path = search_path
		@save_destination = save_destination
	end
	
	def return_links(sel,word)
		links = []
		mec_get(@search_path).links.each do |link|
			links << link if link.text.include?(word)
		end
		links
	end

	def you_convert(links)
		send_files_to_folder(links)
	end






	private

	def noko(path)
		Nokogiri::HTML(path)
	end

	def mec_get(path)
		Mechanize.new.get(path)
	end

	def send_files_to_folder(links)
		you_convert = 'http://www.youtubeinmp4.com/'
		form = mec_get(you_convert).forms[0]
		links.each_with_index do |link, i|	
			next if link.nil?
			puts "printing link #{i}"
			mec_link = link.click.uri
			form.field_with(:class => 'c3').value = mec_link.to_s
			path = "#{@save_destination}/#{i}.mp4"
			form.submit.links[1].click.save_as(path)
			puts "link #{1} successful"

		end
	end
end

