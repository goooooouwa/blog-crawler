require "json"
require "date"

class Renderer
  attr_accessor :out_dir, :posts_file, :slice

  def initialize(blog)
    @blog = blog
    @out_dir = "./out"
    @posts_file = "./out/posts.json"
    @slice = 100
  end

  def start
    posts = JSON.parse(File.read(@posts_file))

    posts.sort_by { |hs| hs["published_date"] }.each_slice(@slice).with_index do |slice, index|
      rss_content = ""
      slice.each do |post|
        rss_content.concat(render_rss_item_with_no_image(post, @blog))
      end
      rss_feed = render_rss_header(@blog) + rss_content + render_rss_footer
      File.open("#{@out_dir}/rss-#{index}.xml", "w") { |file| file.write(rss_feed) }
    end
  end

  def render_rss_footer
    <<-FOOTER
</channel>
</rss>
    FOOTER
  end

  def render_rss_header(blog)
    <<-HEADER
<?xml version="1.0" encoding="utf-8"?>
<rss version="2.0">
<channel>
<title>#{blog["title"]}</title>
<description>#{blog["description"]}</description>
<link>#{blog["homepage"]}</link>
<pubDate>#{DateTime.now}</pubDate>
<!-- other elements omitted from this example -->
    HEADER
  end

  def render_rss_item_with_no_image(rss_item, site)
    <<-ITEM
<item>
<title><![CDATA[ #{rss_item["title"]} ]]></title>
<link>#{rss_item["post_url"]}</link>
<content><![CDATA[ #{rss_item["content"].gsub(/<img([\w\W]+?)[\/]?>/, '<img alt="image placeholder" >')} ]]></content>
<pubDate>#{rss_item["published_date"]}</pubDate>
<guid>#{rss_item["post_url"]}</guid>
<author><![CDATA[ #{site["author"]} ]]></author>
</item>
    ITEM
  end
end
