require 'json'
require_relative '../../src/post'

class TemptationOfWolvesPost < Post
  def initialize(post_url, post_html)
    super(post_url, post_html)
    @title = post_html.css("body > div > table:nth-of-type(4) > tbody > tr:nth-of-type(1) > td").text
    @published_date = '2004-08-01'
    @content = post_html.css("body > div > table:nth-of-type(5)").children
    @author = "（韩）可爱淘"
  end
end
