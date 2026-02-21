require 'json'
require_relative '../../src/post'

class JoelOnSoftwarePost < Post
  def initialize(post_url, post_html)
    super(post_url, post_html)
    @title = post_html.css(".entry-title").text
    @published_date = post_html.css(".entry-date .entry-date").first.attributes["datetime"].value
    @content = post_html.css(".entry-content").children
  end
end
