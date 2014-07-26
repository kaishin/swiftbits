xml.instruct!

xml.feed "xmlns" => "http://www.w3.org/2005/Atom" do
  site_url = data.seo.site_url
  xml.title "#{data.seo.branded_name} Feed"
  xml.subtitle data.seo.tagline
  xml.id site_url
  xml.link "href" => site_url
  xml.link "href" => "#{site_url}/feed", "rel" => "self"
  xml.updated blog.articles.first.date.to_time.iso8601
  xml.author { xml.name "Reda Lemeden" }

  blog.articles[0..10].each do |article|
    xml.entry do
      xml.title article.title
      xml.link "rel" => "alternate", "href" => URI.join(site_url, article.url)
      xml.id URI.join(site_url, article.url)
      xml.published article.date.to_time.iso8601
      xml.updated File.mtime(article.source_file).iso8601
      xml.author { xml.name data.seo.author }
      xml.content article.body, "type" => "html"
      xml.summary article.data["teaser"]
    end
  end
end

