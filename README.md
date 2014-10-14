# Youtube Bulk Video Downloader:
=======
```
Uses mechanize and nokogiri

Purpose: when you need to download multiple youtube files, say a course or tutorial i.e. to watch offline. 
```


Variables:
==========

```
> search = 'https://www.youtube.com/playlist?list=PLV1-QgpUU7N2TVWS6gEVMqEfAFjAl-DV6'
> save = '/path/to/save'
> word = 'French'
```

Send mp4's to your local folder:
==========

```
Without keyword search:
> find = Scrape.new(search,save)
> links = find.grab_links
> find.you_convert(links) 
```
```
With keyword search:
> find = Scrape.new(search,save)
> links = find.grab_links('French')
> find.you_convert(links)
```

