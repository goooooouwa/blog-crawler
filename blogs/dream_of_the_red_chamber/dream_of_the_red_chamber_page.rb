require "json"
require_relative "../../src/page"
require "pry-byebug"

class DreamOfTheRedChamberPage < Page
  def initialize(page_url, page_html)
    super(page_url, page_html)
    match_data = page_url.match(/hqKz_[0-9]{1,3}/)
    current_page_number = match_data.nil? ? 2 : match_data[0].split("_").last.to_i
    @next_page_url = "https://www.52shuku.net/wenxue/hqKz_#{current_page_number + 1}.html"
    @previous_page_url = "https://www.52shuku.net/wenxue/hqKz_#{current_page_number - 1}.html"
    @post_urls = [@page_url]
  end
end
