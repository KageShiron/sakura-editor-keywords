require 'nokogiri'
require 'open-uri'

url = 'https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes'

charset = nil

html = open(url) do |f|
    charset = f.charset
    f.read
end

doc = Nokogiri::HTML.parse(html, nil, charset)
doc.css("tr>td:first-child>code").each do |e|
    puts(e.inner_text)
end
