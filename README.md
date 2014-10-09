Youtube build video downloader:
=======

see spec for tests.

example:

Uses mechanize and nokogiri

The purpose for this is when you need to download multiple youtube files, say a course or tutorial, so you can watch offline. It just automates the clicking of each link instead of sitting and doing manually. 

Variables:
==========
search = 'https://www.youtube.com/playlist?list=PLV1-QgpUU7N2TVWS6gEVMqEfAFjAl-DV6'
save = '/path/to/save'
word = 'French'
selector = 'table#pl-video-table'

Send mp4's to your local folder:
==========
find = Scrape.new(search,save)
links = find.return_links(selector,word)
find.you_convert(links) 


