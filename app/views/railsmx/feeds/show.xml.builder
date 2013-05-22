atom_feed do |feed|
  feed.title 'rails.mx'
  feed.updated @items.first.updated_at if @items.first
  @items.each do |item|
    if item.class == Crowdblog::Post
      feed.entry(item, url: post_url(*item.url_params)) do |entry|
        entry.title item.title
        entry.content item.html_body, type: 'html'
        entry.author do |author|
          author.name item.author.username
          author.email item.author_email
        end
      end
    else
      feed.entry(item, url: event_url(item.slug)) do |entry|
        entry.title item.name
        entry.content item.description, type: 'html'
        entry.author do |author|
          author.name item.organizer
          author.email item.contact
        end
      end
    end
  end
end
