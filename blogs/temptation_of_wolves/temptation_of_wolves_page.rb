require "json"
require_relative "../../src/page"
require "pry-byebug"

class TemptationOfWolvesPage < Page
  def initialize(page_url, page_html)
    super(page_url, page_html)
    match_data = page_url.match(/book4\/9246\/[0-9]{6}/)
    current_page_number = match_data.nil? ? 204538 : match_data[0].split("/").last.to_i
    @next_page_url = "https://www.kanunu8.com/book4/9246/#{current_page_number + 1}.html"
    @previous_page_url = "https://www.kanunu8.com/book4/9246/#{current_page_number - 1}.html"
    @post_urls = [@page_url]
  end
end
