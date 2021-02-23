Rails.application.routes.draw do

  get("/users", { :controller => "users", :action => "index"})

  get("/users/:user", { :controller => "users", :action =>})
end
