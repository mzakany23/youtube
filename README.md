# Youtube Bulk Video Downloader:
=======

### Uses mechanize and nokogiri

### Purpose: when you need to download multiple youtube files, say a course or tutorial i.e. to watch offline. 



## Variables:
==========


> search = 'https://www.youtube.com/playlist?list=PLV1-QgpUU7N2TVWS6gEVMqEfAFjAl-DV6'
> save = '/path/to/save'
> word = 'French'
> selector = 'table#pl-video-table'

## Send mp4's to your local folder:
==========
> find = Scrape.new(search,save)
> links = find.return_links(selector,word)
> find.you_convert(links) 


