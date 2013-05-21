atom_feed do |feed|
  feed.title 'Rails Mx'
  feed.updated @posts.first.updated_at

  @posts.each do |post|
    feed.entry(post, url: post_url(*post.url_params)) do |entry|
      entry.title post.title
      entry.content post.html_body, type: 'html'
      entry.author do |author|
        author.name post.author.username
        author.email post.author_email
      end
    end
  end
end