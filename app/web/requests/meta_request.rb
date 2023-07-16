class MetaRequest < AppRequest

  set :meta_keywords, "class settings are automatically inherited ..."

  def self.call env
    # ip = env["REMOTE_ADDR"]
    # ua = env["HTTP_USER_AGENT"]
    # log "REMOTE_ADDR     = #{ip}"
    # log "HTTP_USER_AGENT = #{ua}"
    new.call env
    # [404, {}, ["404 - Not Found"]]
  end

  attr_reader :env, :request, :action, :format
  
  def call env
    set :meta_keywords, "... and instance settings take precedence over class settings"

    status = 200
    headers = {
      "Framework" => "Liza #{Lizarb::VERSION}"
    }
    body = render :html, :index, format: :html

    log status
    [status, headers, [body]]
  end
  
end

__END__

# view index.html.erb

<h1>Header</h1>
<p>meta_keywords: <%= get :meta_keywords %></p>
