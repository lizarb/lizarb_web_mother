# Set up your request controllers per the DSL in http://guides.lizarb.org/controllers/request.html

class AppRequest < Liza::Request
  part :tag, TagRequestPart

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
