register_website(
  name: 'draveness',
  test: -> (uri) {
    uri.hostname == 'draveness.me'
  },
  process: -> (html) {
    document = Nokogiri::HTML(html)
    title = document.css('.article-title').first.content
    author = 'draveness'
    content = document.css('.article').first
    {
      title: title,
      author: author,
      content: content.to_html.lines.map(&:strip).join
    }
	
	
  }
)