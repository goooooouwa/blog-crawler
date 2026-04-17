require "json"
require_relative "../../src/page"
require "pry-byebug"

class DoubanPage < Page
  def initialize(page_url, page_html)
    super(page_url, page_html)
    next_page_url_node = page_html.css("span.next a").first
    previous_page_url_node = page_html.css("span.prev a").first
    @next_page_url = next_page_url_node.attributes["href"].value unless next_page_url_node.nil?
    @previous_page_url = previous_page_url_node.attributes["href"].value unless previous_page_url_node.nil?
    @post_urls = page_html.css(".item .title a").map { |a| a.attributes["href"].value }
  end
end
