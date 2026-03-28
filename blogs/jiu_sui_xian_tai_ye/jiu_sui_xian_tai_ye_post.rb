require 'json'
require_relative '../../src/post'

class JiuSuiXianTaiYePost < Post
  def initialize(post_url, post_html)
    super(post_url, post_html)
    @title = post_html.css("p.epi_t").text
    @published_date = ""
    @content = post_html.css("article.clear.epi_c p").text
  end
end
