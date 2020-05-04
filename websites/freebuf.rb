register_website(
  name: 'freebuf',
  test: -> (uri) {
    uri.hostname == 'www.freebuf.com'
  },
  process: -> (html) {
    document = Nokogiri::HTML(html)
    title = document.css('#creatTitle h2').first.content
    author = ''
    content = document.css('.articlecontent').first

    content.css('script').each(&:remove)
	content.css('.wechatcodeDiv').each(&:remove)
	content.css('.newlabelDiv').each(&:remove)
	content.css('.article-oper').each(&:remove)
    {
      title: title,
      author: author,
      content: content.to_html.lines.map(&:strip).join
    }
	
	
  }
)