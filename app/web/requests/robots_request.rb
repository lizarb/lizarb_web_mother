class RobotsRequest < AppRequest

  def self.call env
    ip = env["REMOTE_ADDR"]
    ua = env["HTTP_USER_AGENT"]
    log "REMOTE_ADDR     = #{ip}"
    log "HTTP_USER_AGENT = #{ua}"
    new.call env
  end

  def call env
    template = :permissive
    # template = :rejective
    # template = :slow
    # template = :custom

    status = 200
    headers = {
      "Framework" => "Liza #{Lizarb::VERSION}"
    }
    body = render template, format: :txt

    log status
    log template
    [status, headers, [body]]
  end

end

__END__

# view permissive.txt.erb
User-agent: *
Disallow:

# view rejective.txt.erb
User-agent: *
Disallow: /

# view slow.txt.erb
User-agent: *
Disallow: /
Crawl-delay: 10

# view custom.txt.erb
User-agent: *
Disallow: /admin
Disallow: /secret
Disallow: /heavy
