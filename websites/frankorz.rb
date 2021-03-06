register_website(
  name: 'frankorz',
  test: -> (uri) {
    uri.hostname == 'frankorz.com'
  },
  process: -> (html) {
    document = Nokogiri::HTML(html)
    title = document.css('.post-title').first.content
    author = 'frankorz'
    content = document.css('.post-content').first
   
    {
      title: title,
      author: author,
      content: content.to_html.lines.map(&:strip).join
    }
	
	
  }
)