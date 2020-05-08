register_website(
  name: 'arthurchiao',
  test: -> (uri) {
    uri.hostname == 'arthurchiao.art'
  },
  process: -> (html) {
    document = Nokogiri::HTML(html)
    title = document.css('.postTitle').first.content
    author = 'arthurchiao'
    content = document.css('.post').first
    content.traverse{|x|
      if x.name == 'img'
        x['src'] = "http://arthurchiao.art"+x['src']
      end
    }
    {
      title: title,
      author: author,
      content: content.to_html.lines.map(&:strip).join
    }
	
	
  }
)