register_website(
  name: 'juejin',
  test: -> (uri) {
    uri.hostname == 'juejin.im'
  },
  process: -> (html) {
    document = Nokogiri::HTML(html)
    title = document.css('.article-title').first.content
    author = document.css('.author-info-box').first.content
    content = document.css('.article').first

    {
      title: title,
      author: author,
      content: content.to_html.lines.map(&:strip).join
    }
	
	
  }
)