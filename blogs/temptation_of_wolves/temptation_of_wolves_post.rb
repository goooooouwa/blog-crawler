require 'json'
require_relative '../../src/post'

class TemptationOfWolvesPost < Post
  def initialize(post_url, post_html)
    super(post_url, post_html)
    @title = post_html.css("#c_title").text
    @published_date = '2004-08-01'
    @content = post_html.css("#content").children
    @author = "（韩）可爱淘"
  end
end
