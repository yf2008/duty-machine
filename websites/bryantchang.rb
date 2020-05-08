register_website(
  name: 'bryantchang',
  test: -> (uri) {
    uri.hostname == 'bryantchang.github.io'
  },
  process: -> (html) {
    document = Nokogiri::HTML(html)
    title = document.css('.article-title').first.content
    author = 'bryantchang'
    content = document.css('.article-entry').first
    content.traverse{|x|
      if x.name == 'img'
        x['src'] = "https://bryantchang.github.io"+x['src']
      end
    }
    {
      title: title,
      author: author,
      content: content.to_html.lines.map(&:strip).join
    }
	
	
  }
)