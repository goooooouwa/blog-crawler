require 'json'
require_relative '../../src/post'

class TemptationOfWolvesPost < Post
  def initialize(post_url, post_html)
    super(post_url, post_html)
    @title = post_html.css("body > div > table:nth-of-type(4) > tr:nth-of-type(1) > td > strong > font").text
    @published_date = '2004-08-01'
    @content = post_html.css("body > div > table:nth-of-type(5) > tr > td:nth-of-type(2) > p").children
  end
end
