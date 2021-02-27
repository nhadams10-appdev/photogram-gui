class UsersController < ApplicationController
  def index
    matching_users = User.all
    
    @list_of_users = matching_users.order({ :username => :asc })
    
    render({ :template => "user_templates/index.html.erb"})
  end

  def show

    url_username = params.fetch("path_username")

    matching_usernames = User.where({ :username => url_username })

    @the_user = matching_usernames.first()

    if @the_user == nil
      redirect_to("/404")
    else
      render({ :template => "user_templates/show.html.erb"})
    end 
  end

  def create
  
    entered_username = params.fetch("input_username").to_s

    a_new_user = User.new
    a_new_user.username = entered_username

    a_new_user.save

    redirect_to("/users/" + a_new_user.username)
  end

  def update
    
    the_id = params.fetch("modify_userid")

    matching_users = User.where({ :id => the_id })

    the_user = matching_users.first

    input_new_username = params.fetch("input_username")

    the_user.username = input_new_username

    the_user.save

    redirect_to("/users/" + the_user.username)
  end
end