require "json"
require_relative "../../src/page"
require "pry-byebug"

class JiuSuiXianTaiYePage < Page
  def initialize(page_url, page_html)
    super(page_url, page_html)
    next_page_url_node = page_html.css("a.epino_btn.rt").first
    previous_page_url_node = page_html.css("a.epino_btn.lt").first
    @next_page_url = "https://www.tvmao.com#{ next_page_url_node.attributes["href"].value }" unless next_page_url_node.nil?
    @previous_page_url = "https://www.tvmao.com#{ previous_page_url_node.attributes["href"].value }" unless previous_page_url_node.nil?
    @post_urls = [@page_url]
  end
end
