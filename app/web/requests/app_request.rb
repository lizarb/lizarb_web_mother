# Set up your request controllers per the DSL in http://guides.lizarb.org/controllers/request.html

class AppRequest < Liza::Request
  part :tag, TagRequestPart

  set :title,              "LizaRB"
  set :meta_description,   "Ruby ficou mais facil. Crie projetos MVC com Ruby e aprenda a ver tudo como objetos."
  set :meta_keywords,      "Ruby programming, Ruby development, Ruby framework"
  set :meta_viewport,      "width=device-width, initial-scale=1.0"
  set :meta_robots,        "no-index, no-follow"
  set :meta_revisit_after, "1 days"
  set :meta_generator,     "LizaRB #{Lizarb::VERSION}"

  def metatags
    [
      :viewport,
      :keywords,
      :description,
      :robots,
      :"revisit-after",
      :generator,
    ].map do |name|
      tag.open "meta", name: name, content: get(:"meta_#{name.to_s.snakecase}")
    end.join "\n"
  end

end

__END__

# view html.html.erb
<!DOCTYPE html>
<html lang="en">
  <%= render "head" %>
  <%= render "body" %>
</html>

# view head.html.erb
<head>
  <meta charset="UTF-8">
  <%= metatags %>
  <title><%= get :title %></title>
  <%= render :head_extra %>
</head>

# view head_extra.html.erb
<!--  -->

# view body.html.erb
<body>
  <%= render %>
</body>
