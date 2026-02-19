require 'json'
require_relative '../../src/post'

class TheLookingGlassPost < Post
  def initialize(post_url, post_html)
    super(post_url, post_html)
    @title = post_html.css("[testid='storyTitle']").text
    @published_date = post_html.at("meta[property='article:published_time']")['content']
    @content = post_html.css("article").children
    @author = "Julie Zhuo"
  end
end
