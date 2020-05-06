register_website(
  name: 'cjting',
  test: -> (uri) {
    uri.hostname == 'cjting.me'
  },
  process: -> (html) {
    document = Nokogiri::HTML(html)
    title = document.css('.post__title').first.content
    author = 'cjting'
    content = document.css('.post__body').first
   
    {
      title: title,
      author: author,
      content: content.to_html.lines.map(&:strip).join
    }
	
	
  }
)