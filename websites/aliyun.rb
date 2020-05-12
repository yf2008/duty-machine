register_website(
  name: 'aliyun',
  test: -> (uri) {
    uri.hostname == 'yq.aliyun.com'
  },
  process: -> (html) {
    document = Nokogiri::HTML(html)
    title = document.css('.blog-title').first.content
    author = 'aliyun'
    content = document.css('.yq-blog-detail').first

    {
      title: title,
      author: author,
      content: content.to_html.lines.map(&:strip).join
    }
	
	
  }
)