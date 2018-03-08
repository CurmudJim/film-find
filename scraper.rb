require 'mechanize'

 def shop(keyword)
 	agent = Mechanize.new

 	agent.user_agent_alias = 'Mac Safari'

 	page = agent.get('https://www.amazon.com/movies-tv-dvd-bluray/b/ref=nav_shopall_mov?ie=UTF8&node=2625373011')

 	search_form = page.form

 	search_form['field-keywords'] = keyword

 	page = search_form.submit

 	link = page.uri
 end

# items = page.css('.s-result-item')
#
# items.each do |item|
# 	puts "#{item.css('h2').text}, #{item.css('.s-price').text}"
# end
