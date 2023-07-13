class SitemapRequest < AppRequest

  def self.call env
    new.call env
  end

  attr_reader :env, :request, :action, :format

  def call env
    @env = env
    @request = env["LIZA_REQUEST"].to_sym
    @action  = env["LIZA_ACTION"].to_sym
    @format  = env["LIZA_FORMAT"].to_sym

    @list = get_list

    status = 200
    headers = {
      "Framework" => "Liza #{Lizarb::VERSION}"
    }
    body = render :sitemap, format: :xml

    log status
    [status, headers, [body]]
  end

  def get_list
    [
      {priority: 1.0, path: ""},
      {priority: 0.5, path: "guide"},
      {priority: 0.5, path: "community"},
      {priority: 0.5, path: "docs"},
    ].each do
      _1[:loc] = "https://www.lizarb.com/#{_1[:path]}"
      _1.delete :path
      _1[:lastmod] = today
      _1[:changefreq] = :daily
    end
  end

  # 2000-01-01
  def today
    @today ||= Time.now.strftime "%Y-%m-%d"
  end

end

__END__

# view sitemap.xml.erb

<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">

<% @list.each do |item| -%>
  <url>
    <loc><%= item[:loc] %></loc>
    <lastmod><%= item[:lastmod] %></lastmod>
    <changefreq><%= item[:changefreq] %></changefreq>
    <priority><%= item[:priority] %></priority>
  </url>
<% end -%>

</urlset>
