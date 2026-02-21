require 'json'
require_relative '../../src/post'

class DreamOfTheRedChamberPost < Post
  def initialize(post_url, post_html)
    super(post_url, post_html)
    @title = post_html.css(".article-title").text
    @published_date = '2010-09-01'
    @content = post_html.css(".article-content").children
  end
end
