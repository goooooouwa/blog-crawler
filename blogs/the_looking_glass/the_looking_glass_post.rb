require 'json'
require_relative '../../src/post'

class TheLookingGlassPost < Post
  def initialize(post_url, post_html)
    super(post_url, post_html)
    @title = post_html.css(".post-title").text
    script_tags = post_html.css('script')
    script_tags.each do |script|
      text = script.content
      if match = text.match(/"post_date\\":\\"([^\\]*)\\"/)
        @published_date = match[1]
      end
    end
    @content = post_html.css(".available-content").children
  end
end
