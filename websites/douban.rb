register_website(
  name: 'douban',
  test: -> (uri) {
    uri.hostname == 'www.douban.com'
  },
  process: -> (html) {
    document = Nokogiri::HTML(html)
    title = document.css('.note-header').first.content
    author = document.css('.note-author').first.content
    content = document.css('.note-container').first
   content.css('script').each(&:remove)
    {
      title: title,
      author: author,
      content: content.to_html.lines.map(&:strip).join
    }
	
	
  }
)