register_website(
  name: 'ruanyifeng',
  test: -> (uri) {
    uri.hostname == 'www.ruanyifeng.com'
  },
  process: -> (html) {
    document = Nokogiri::HTML(html)
    title = document.css('.page-title').first.content
    author = 'ruanyifeng'
    content = document.css('.hentry').first
    {
      title: title,
      author: author,
      content: content.to_html.lines.map(&:strip).join
    }
	
	
  }
)