module SpriteHelpers
  def svg_icon(icon_id, svg_class = 'svg-icon')
    icon_id = icon_id.to_s.gsub(/_/, '-')

    image = image_path('sprite.svg')
    content_tag(:svg, viewBox: '0 0 8 8', class: svg_class) do
      content_tag(:use, '', 'xlink:href' => "#{image}##{icon_id}", class: "#{icon_id} icon-path")
    end
  end
end
