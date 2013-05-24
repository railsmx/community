xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "rails.mx"

    @items.each do | item |
      if item.class == Crowdblog::Post

        xml.item do
          xml.title item.title
          xml.description item.html_body
          xml.pubDate item.published_at.to_s(:rfc822)
          xml.link post_url(*item.url_params)
        end

      else

        xml.item do
          xml.title item.name
          xml.description item.description
          xml.link event_url(item.slug)
        end

      end
    end
  end
end