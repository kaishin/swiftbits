module TitleHelpers
  def page_title(page_data)
    if page_data.title
      "#{page_data.title} - #{data.seo.site_name}"
    else
      "#{data.seo.site_name}: #{data.seo.tagline}"
    end
  end
end
