# Set up your request controllers per the DSL in http://guides.lizarb.org/controllers/request.html

class AppRequest < Liza::Request

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
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title><%= @title || "LizaRB" %></title>
  <%= render "head_extra" %>
</head>

# view body.html.erb
<body>
  <%= render %>
</body>
