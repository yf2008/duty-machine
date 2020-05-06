register_website(
  name: 'tencent',
  test: -> (uri) {
    uri.hostname == 'cloud.tencent.com'
  },
  process: -> (html) {
    document = Nokogiri::HTML(html)
    title = document.css('.article-title').first.content
    author = ""
    content = document.css('.J-articlePanel').first
   content.css('script').each(&:remove)
    {
      title: title,
      author: author,
      content: content.to_html.lines.map(&:strip).join
    }
	
	
  }
)