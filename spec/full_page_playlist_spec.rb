require 'spec_helper'
require_relative '../lib/scrape'

describe 'Full Page Playlist' do 
	before do 
		@EEVlog = 'https://www.youtube.com/playlist?list=PL55857F4F6F2D36B1'
		@french = 'https://www.youtube.com/playlist?list=PLV1-QgpUU7N2TVWS6gEVMqEfAFjAl-DV6'
		@save_to = '/Users/mzakany/Desktop/folder'
		
		@found = Scrape.new(@EEVlog, @save_to)
		@found_french = Scrape.new(@french, @save_to)
	end

	context 'Grab Links with no parameters' do 
		it 'should get eevlog links' do 
			# @found.grab_links
			# @found_french.grab_links
		end
	end

	context 'Grab with word search' do 
		it 'should get with word search ' do 
			# puts @found.grab_links('EEVblog')
			# puts @found_french.grab_links('French')
		end
	end

	context 'Send to folder' do 

		before do 
			@run_french = Scrape.new(@french, @save_to)
		end

		it 'should do no parameters' do 
			links = @run_french.grab_links
			@run_french.you_convert(links)

		end

		it 'should do word search' do 

		end
	end
end

