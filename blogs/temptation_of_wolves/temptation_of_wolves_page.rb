require "json"
require_relative "../../src/page"
require "pry-byebug"

class TemptationOfWolvesPage < Page
  def initialize(page_url, page_html)
    super(page_url, page_html)
    match_data = page_url.match(/book\/1933\/[0-9]{5}/)
    current_page_number = match_data.nil? ? 54087 : match_data[0].split("/").last.to_i
    @next_page_url = "https://99csw.com/book/1933/#{current_page_number + 1}.htm"
    @previous_page_url = "https://99csw.com/book/1933/#{current_page_number - 1}.htm"
    @post_urls = [@page_url]
  end
end
