class UsersController < ApplicationController
  def index
    matching_users = User.all
    
    @list_of_users = matching_users.order({ :username => :asc})
    
    render({ :template => "user_templates/index"})
  end

  def show
    url_username = params.fetch("path_username")
    matching_users = User.where({ :username => url_username})

    @the_user = matching_users.first

    if @the_user == nil
      redirect_to("/")
    else
      render({ :template => "user_templates/show"})
    end
  end

  def create
    url_username = params.fetch("input_username")
  
    a_new_user = User.new
    a_new_user.username = url_username

    a_new_user.save

    redirect_to("/users/" + url_username)
  end

  def update
    the_id = params.fetch("modify_id")
    matching_users = User.where({ :id => the_id})
    the_user = matching_users.at(0)

    url_username = params.fetch("input_username")

    the_user.username = url_username

    the_user.save

    redirect_to("/users/" + url_username)
  end

end

