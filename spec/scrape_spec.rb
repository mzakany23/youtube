require 'spec_helper'
require_relative '../lib/scrape'


describe 'Scrape' do 
	before do 
		search_path = 'https://www.youtube.com/playlist?list=PLV1-QgpUU7N2TVWS6gEVMqEfAFjAl-DV6'
		save_path = '/Users/mzakany/Desktop/youtube'
		@word = 'French'
		@sel = "table#pl-video-table"
		@find = Scrape.new(search_path,save_path)
	end
	
	let(:links) {@find.return_links(@sel,@word)}

	context 'get the links' do 

		it 'should get links on page' do 
			links
		end

		it 'should show link count' do 
			expect(links.count).to be_an_instance_of Fixnum
		end
	end

	context 'save youtube to file' do 
		it 'should convert youtube vids' do 
			mec_link = links[1].click.uri
			# @find.you_convert(mec_link)
		end

		it 'should convert all youtube vids' do 
			@find.you_convert(links)
		end
	end

	context 'some more sites' do 
		before do 
			url_1 = 'https://www.youtube.com/playlist?list=PL55857F4F6F2D36B1'
			@find = Scrape.new(url_1, '/Users/mzakany/Desktop')
			@sel = 'branded-page-v2-body branded-page-v2-primary-column-content'
			@word = 'EEVblog'
		end

		it 'should find links' do 
			@find.return_links(@sel,@word)
		end

	
	end

	

end