require 'mechanize'
require 'nokogiri'

class Scrape

	attr_accessor :search_path, :save_destination

	SELECTIONS	 = {
		default: 'qualified-channel-title-text',
		playlist: 'main-content',
		max_downloads: 3
	}
	
	def initialize(search_path=nil, save_destination=nil)
		@search_path = search_path
		@save_destination = save_destination
	end
	
	def return_links(sel=nil,word=nil)	
		links = []
		if sel.nil? && word.nil?
			mec_get(@search_path).links.each do |link|
				links << link
			end
			links
		else
		mec_get(@search_path).links.each do |link|
			links << link if link.text.include?(word)
		end
		links
		end
	end


	def you_convert(links)
		send_files(links)
	end

	def grab_links(word=nil)	
		link_arr = []
		path = mec_get(@search_path)
		count = 0

		if word.nil?
		
			path.links.each do |link|
				break if count > SELECTIONS[:max_downloads]
				youtube = link.click.uri.to_s
				if youtube.include?('watch?v=')
					link_arr << youtube 
					count += 1
				end
			end
		else
			path.links.each do |link|
				break if count >> SELECTIONS[:max_downloads]
				if link.text.include?(word) && link.click.uri.to_s.include?('watch?v=')
					link_arr << link.click.uri.to_s
					count += 1
				end
			end
		end
		link_arr
	end



	private

	def noko(path)
		Nokogiri::HTML(path)
	end

	def mec_get(path)
		Mechanize.new.get(path)
	end

	# requires an array
	def send_files(links)
		you_convert = 'http://www.youtubeinmp4.com/'
		form = mec_get(you_convert).forms[0]
		links.each_with_index do |link, i|	
			next if link.nil?
			puts "printing link #{i}"
			form.field_with(:class => 'c3').value = link
			path = "#{@save_destination}/#{i}.mp4"
			form.submit.links[1].click.save_as(path)
			puts "link #{1} successful"
		end
	end

end

