require 'nokogiri'
require 'open-uri'

url = 'https://developer.mozilla.org/en-US/docs/Web/HTML/Element'

charset = nil

html = open(url) do |f|
    charset = f.charset
    f.read
end

doc = Nokogiri::HTML.parse(html, nil, charset)
doc.css("a[href='/en-US/docs/Web/HTML/Element']+ol li a").each do |e|
    puts(e["href"].gsub("/en-US/docs/Web/HTML/Element/",""))
end
