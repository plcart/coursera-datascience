myapp <- oauth_app("github", "08e5a9f492f7d13d53aa",secret="040e8047cb62d18d6c11be650d6ecfdf335dfcf7")
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
stop_for_status(req)
content(req)

