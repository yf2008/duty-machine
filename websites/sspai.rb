register_website(
  name: 'sspai',
  test: -> (uri) {
    uri.hostname == 'sspai.com'
  },
  process: -> (html) {
    document = Nokogiri::HTML(html)
    title = document.css('#article-title').first.content
    author = document.css('.nickname').first.content
    content = document.css('.content').first
  
    {
      title: title,
      author: author,
      content: content.to_html.lines.map(&:strip).join
    }
	
	
  }
)