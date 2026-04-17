require "json"
require_relative "../../src/page"
require "pry-byebug"

class DoubanPage < Page
  def initialize(page_url, page_html)
    super(page_url, page_html)
    next_page_url_node = page_html.css("span.next a").first
    previous_page_url_node = page_html.css("span.prev a").first
    @next_page_url = "https://movie.douban.com/#{ next_page_url_node.attributes["href"].value }" unless next_page_url_node.nil?
    @previous_page_url = "https://movie.douban.com/#{ previous_page_url_node.attributes["href"].value }" unless previous_page_url_node.nil?
    @posts = page_html.css(".item .item-show").map { |p| extract_post_info(p) }
    @post_urls = @posts.map { |post| post[:url] }
  end

  private

  def extract_post_info(element)
    {
      url: element.css(".title a").first&.attributes&.[]("href")&.value,
      title: element.css(".title a").first&.text&.strip,
      date: element.css(".date").first&.text&.strip,
    }
  end
end