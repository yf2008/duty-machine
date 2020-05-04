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
    content.traverse{|x|
      x.remove_class
      x.remove_attribute('id')
      x.remove_attribute('style')
      if x.name == 'img'
        unless x['src']
          x['src'] = x['data-src']
        end
      end
    }
    {
      title: title,
      author: author,
      content: content.to_html.lines.map(&:strip).join
    }
	
	
  }
)