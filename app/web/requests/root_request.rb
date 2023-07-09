class RootRequest < AppRequest

  def self.call env
    new.call env
  end

  attr_reader :env, :request, :action, :format

  def call env
    @env = env
    @request = env["LIZA_REQUEST"].to_sym
    @action  = env["LIZA_ACTION"].to_sym
    @format  = env["LIZA_FORMAT"].to_sym

    @breadcrumbs = get_breadcrumbs.find { _1.first[:selected] }

    @breadcrumbs = []

    status = 200
    headers = {
      "Framework" => "Liza #{Lizarb::VERSION}"
    }
    body = render format, action, format: format

    log status
    [status, headers, [body]]
  end

  def hotjar_tag
    <<-STR
    <!-- Hotjar Tracking Code for https://lizarb.org/ -->
<script>
    (function(h,o,t,j,a,r){
        h.hj=h.hj||function(){(h.hj.q=h.hj.q||[]).push(arguments)};
        h._hjSettings={hjid:3509884,hjsv:6};
        a=o.getElementsByTagName('head')[0];
        r=o.createElement('script');r.async=1;
        r.src=t+h._hjSettings.hjid+j+h._hjSettings.hjsv;
        a.appendChild(r);
    })(window,document,'https://static.hotjar.com/c/hotjar-','.js?sv=');
</script>
    STR
  end

  def youtube_tag id, w = 450
    h = (315 * w) / 560
    # %|<iframe width="#{w}" height="#{h}" src="https://www.youtube.com/embed/#{id}" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>|
    # http://i3.ytimg.com/vi/erLk59H86ww/hqdefault.jpg
    # http://i3.ytimg.com/vi/erLk59H86ww/maxresdefault.jpg
    #
    %|<a href="https://www.youtube.com/v/#{id}" target="_blank"><img width="#{w}" height="#{h}" src="https://i3.ytimg.com/vi/#{id}/hqdefault.jpg"/></a>|
  end

  def grupo_url
    "https://t.me/lizarborg"
    "https://t.me/rubybrasil"
  end

  def get_docs_main
    [
      {
        name: "Caderno 1 - Programas",
        url: "https://docs.ruby-lang.org/en/3.2/syntax_rdoc.html",
        pages: 50,
      },
      {
        name: "Caderno 2 - Sintaxe",
        url: "https://docs.ruby-lang.org/en/3.2/syntax_rdoc.html",
        pages: 150,
      },
      {
        name: "Caderno 3 - Tipos",
        url: "https://docs.ruby-lang.org/en/3.2/syntax_rdoc.html",
        pages: 800,
      },
      {
        name: "Caderno 4 - Expressoes",
        url: "https://docs.ruby-lang.org/en/3.2/syntax_rdoc.html",
        pages: 50,
      },
      {
        name: "Caderno 5 - Estrutura de Fluxo",
        url: "https://docs.ruby-lang.org/en/3.2/syntax_rdoc.html",
        pages: 50,
      },
      {
        name: "Caderno 6 - Metodos",
        url: "https://docs.ruby-lang.org/en/3.2/syntax_rdoc.html",
        pages: 250,
      },
      {
        name: "Caderno 7 - Classes",
        url: "https://docs.ruby-lang.org/en/3.2/syntax_rdoc.html",
        pages: 250,
      },
      {
        name: "Caderno 8 - Metaprogramacao",
        url: "https://docs.ruby-lang.org/en/3.2/syntax_rdoc.html",
        pages: 250,
      },
    ]
  end

  def get_docs_versions

    # <p><img width="32" src="/pdf.png" />  19 paginas <a target="_blank" href="https://docs.ruby-lang.org/en/3.2/NEWS_md.html">Novidades do Ruby 3.2.0</a></p>
    # <p><img width="32" src="/pdf.png" />  18 paginas <a target="_blank" href="https://docs.ruby-lang.org/en/3.2/NEWS/NEWS-3_1_0_md.html">Novidades do Ruby 3.1.0</a></p>
    # <p><img width="32" src="/pdf.png" />  19 paginas <a target="_blank" href="https://docs.ruby-lang.org/en/3.2/NEWS/NEWS-3_0_0_md.html">Novidades do Ruby 3.0.0</a></p>
    # <p><img width="32" src="/pdf.png" />  22 paginas <a target="_blank" href="https://docs.ruby-lang.org/en/3.2/NEWS/NEWS-2_7_0.html">Novidades do Ruby 2.7.0</a></p>
    # <p><img width="32" src="/pdf.png" />  17 paginas <a target="_blank" href="https://docs.ruby-lang.org/en/3.2/NEWS/NEWS-2_6_0.html">Novidades do Ruby 2.6.0</a></p>
    # <p><img width="32" src="/pdf.png" />  13 paginas <a target="_blank" href="https://docs.ruby-lang.org/en/3.2/NEWS/NEWS-2_5_0.html">Novidades do Ruby 2.5.0</a></p>
    # <p><img width="32" src="/pdf.png" />  11 paginas <a target="_blank" href="https://docs.ruby-lang.org/en/3.2/NEWS/NEWS-2_4_0.html">Novidades do Ruby 2.4.0</a></p>

    # <p><img width="32" src="/pdf.png" />  07 paginas <a target="_blank" href="https://docs.ruby-lang.org/en/3.2/NEWS/NEWS-2_3_0.html">Novidades do Ruby 2.3.0</a></p>
    # <p><img width="32" src="/pdf.png" />  10 paginas <a target="_blank" href="https://docs.ruby-lang.org/en/3.2/NEWS/NEWS-2_2_0.html">Novidades do Ruby 2.2.0</a></p>
    # <p><img width="32" src="/pdf.png" />  10 paginas <a target="_blank" href="https://docs.ruby-lang.org/en/3.2/NEWS/NEWS-2_1_0.html">Novidades do Ruby 2.1.0</a></p>
    # <p><img width="32" src="/pdf.png" />  17 paginas <a target="_blank" href="https://docs.ruby-lang.org/en/3.2/NEWS/NEWS-2_0_0.html">Novidades do Ruby 2.0.0</a></p>
    # <p><img width="32" src="/pdf.png" />  10 paginas <a target="_blank" href="https://docs.ruby-lang.org/en/3.2/NEWS/NEWS-1_9_3.html">Novidades do Ruby 1.9.3</a></p>
    # <p><img width="32" src="/pdf.png" />  13 paginas <a target="_blank" href="https://docs.ruby-lang.org/en/3.2/NEWS/NEWS-1_9_2.html">Novidades do Ruby 1.9.2</a></p>
    # <p><img width="32" src="/pdf.png" />  08 paginas <a target="_blank" href="https://docs.ruby-lang.org/en/3.2/NEWS/NEWS-1_9_1.html">Novidades do Ruby 1.9.1</a></p>
    # <p><img width="32" src="/pdf.png" />  16 paginas <a target="_blank" href="https://docs.ruby-lang.org/en/3.2/NEWS/NEWS-1_8_7.html">Novidades do Ruby 1.8.7</a></p>

    [
      {
        name: "3.2.0",
        url: "https://docs.ruby-lang.org/en/3.2/NEWS_md.html",
        pages: 50,
      },
      {
        name: "3.1.0",
        url: "https://docs.ruby-lang.org/en/3.2/NEWS/NEWS-3_1_0_md.html",
        pages: 50,
      },
      {
        name: "3.0.0",
        url: "https://docs.ruby-lang.org/en/3.2/NEWS/NEWS-3_0_0_md.html",
        pages: 50,
      },
      {
        name: "2.7.0",
        url: "https://docs.ruby-lang.org/en/3.2/NEWS/NEWS-2_7_0.html",
        pages: 50,
      },
      {
        name: "2.6.0",
        url: "https://docs.ruby-lang.org/en/3.2/NEWS/NEWS-2_6_0.html",
        pages: 50,
      },
      {
        name: "2.5.0",
        url: "https://docs.ruby-lang.org/en/3.2/NEWS/NEWS-2_5_0.html",
        pages: 50,
      },
      {
        name: "2.4.0",
        url: "https://docs.ruby-lang.org/en/3.2/NEWS/NEWS-2_4_0.html",
        pages: 50,
      },
      {
        name: "2.3.0",
        url: "https://docs.ruby-lang.org/en/3.2/NEWS/NEWS-2_3_0.html",
        pages: 50,
      },
      {
        name: "2.2.0",
        url: "https://docs.ruby-lang.org/en/3.2/NEWS/NEWS-2_2_0.html",
        pages: 50,
      },
      {
        name: "2.1.0",
        url: "https://docs.ruby-lang.org/en/3.2/NEWS/NEWS-2_1_0.html",
        pages: 50,
      },
      {
        name: "2.0.0",
        url: "https://docs.ruby-lang.org/en/3.2/NEWS/NEWS-2_0_0.html",
        pages: 50,
      },
      {
        name: "1.9.3",
        url: "https://docs.ruby-lang.org/en/3.2/NEWS/NEWS-1_9_3.html",
        pages: 50,
      },
      {
        name: "1.9.2",
        url: "https://docs.ruby-lang.org/en/3.2/NEWS/NEWS-1_9_2.html",
        pages: 50,
      },
      {
        name: "1.9.1",
        url: "https://docs.ruby-lang.org/en/3.2/NEWS/NEWS-1_9_1.html",
        pages: 50,
      },
      {
        name: "1.8.7",
        url: "https://docs.ruby-lang.org/en/3.2/NEWS/NEWS-1_8_7.html",
        pages: 50,
      },
    ].map do
      _1[:name] = "Novidades do Ruby #{_1[:name]}"
      _1
    end
  end

  def get_breadcrumbs
    [
      [
        {
          # char: %|案 - This character (pronounced "an") can mean "guide" or "guidance" in Japanese. It is often used in words related to guiding or leading, such as 案内 (annai) which means "guide" or "guidance," as mentioned earlier.|,
          name: "Guia",
          path: "/root/guide.html",
        }
      ],
      [
        {
          # char: %|案 - This character (pronounced "an") can mean "guide" or "guidance" in Japanese. It is often used in words related to guiding or leading, such as 案内 (annai) which means "guide" or "guidance," as mentioned earlier.|,
          name: "Guia",
          path: "/root/guide.html",
        },
        {
          name: "/ Ruby",
          path: "/guide/ruby.html",
        },
        {
          name: "/ Install",
          path: "/guide_ruby/installation.html",
        }
      ],
      [
        {
          # char: %|共 - This character (pronounced "kyō") carries the meaning of "together" or "shared." It can be used to convey the idea of community or a sense of togetherness. While it doesn't exclusively mean "safe space," it can imply a sense of belonging and inclusiveness within a community.|,
          name: "Comunidade",
          path: "/root/community.html",
        },
        {
          name: "/ Brasil",
          path: "/community/lizarb.html",
        },
        {
          name: "/ Fabio Akita",
          path: "/community/fabio-akita.html",
        }
      ],
      [
        {
          # char: %|文 - This character (pronounced "bun") means "text," "writing," or "document" in Japanese. It can be used to refer to any form of written or documented information. It can encompass a broad range of written materials, including official documents, literature, or sacred texts.|,
          name: "Docs",
          path: "/root/docs.html",
        },
        {
          name: "/ Ruby",
          path: "/docs/ruby.html",
        },
        {
          name: "/ 1 Iniciante",
          path: "/docs_ruby/installation.html",
        }
      ]

    ].each do |crumbs|
      crumbs.each do |crumb|
        crumb[:selected] = env["LIZA_PATH"] == crumb[:path].gsub(".html", "")
        crumb
      end
    end

  end

end

__END__

# view head_extra.html.erb

<link rel="stylesheet" href="/<%= "#{@request}/#{@action}" %>.css">
<link rel="icon" href="/images/icon.png" type="image/png">

<script type="text/javascript" src="/<%= "#{@request}/#{@action}" %>.js"></script>

<%= hotjar_tag if App.mode == :demo %>

# view body.html.erb
<body>
  <%= render "body_github" %>
  <%= render "body_header" %>

  <%= render %>

  <%= render "body_footer" %>
</body>


# view css.css.erb
<%

@colors = false

%>

/* FONTS */

@font-face {
  font-family: "Rubik";
  src: url("/fonts/Rubik/static/Rubik-Medium.ttf") format("truetype");
}

body {
  --primary-green: #2A8031;
  --primary-gray: #71706E;
  --primary-red: #F75160;
  --primary-red: #C73330;

}

<%= render "body" %>
