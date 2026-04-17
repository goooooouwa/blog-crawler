require 'json'
require_relative '../../src/post'

class DoubanPost < Post
  def initialize(post_url, post_html)
    super(post_url, post_html)
    @title = post_html.css("#content h1").text
    @published_date = post_html.css("collection_date").text
    @content = post_html.css("div#info").children
  end
end
