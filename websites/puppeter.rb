register_website(
  name: 'puppeter',
  test: -> (uri) {
    uri.hostname == 'blog.puppeter.com'
  },
  process: -> (html) {
    document = Nokogiri::HTML(html)
    title = document.css('.textbox-title').first.content
    author = 'puppeter'
    content = document.css('.textbox-content').first
  content.traverse{|x|
      if x.name == 'img'
        x['src'] = "http://blog.puppeter.com/"+x['src']
      end
    }
    {
      title: title,
      author: author,
      content: content.to_html.lines.map(&:strip).join
    }
	
	
  }
)