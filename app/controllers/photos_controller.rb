class PhotosController < ApplicationController
  def index
    matching_photos = Photo.all

    @list_of_photos = matching_photos.order({ :created_at => :desc })

    render({ :template => "photo_templates/index.html.erb"})
  end

  def show
    url_id = params.fetch("path_id")

    matching_photos = Photo.where({ :id => url_id})

    @the_photo = matching_photos.first

    render({ :template => "photo_templates/show.html.erb"})
  end

  def baii
    the_id = params.fetch("toast_id")

    matching_photos = Photo.where({ :id => the_id })

    the_photo = matching_photos.first()

    the_photo.destroy
    
    redirect_to("/photos")
  end

  def create
  
    input_image = params.fetch("query_image")
    input_caption = params.fetch("query_caption")
    input_owner_id = params.fetch("query_owner_id")

    a_new_photo = Photo.new
    a_new_photo.image = input_image
    a_new_photo.caption = input_caption
    a_new_photo.owner_id = input_owner_id

    a_new_photo.save

    # render({ :template => "photo_templates/create.html.erb" })

    redirect_to("/photos/" + a_new_photo.id.to_s)
  end

  def update
    
    the_id = params.fetch("modify_id")

    matching_photos = Photo.where({ :id => the_id })

    the_photo = matching_photos.first

    input_image = params.fetch("query_image")
    input_caption = params.fetch("query_caption")

    the_photo.image = input_image
    the_photo.caption = input_caption
    
    the_photo.save

    # render({ :template => "photo_templates/update.html.erb" })

    redirect_to("/photos/" + the_photo.id.to_s)
  end

  def add_comment
    
    the_photo_id = params.fetch("input_photo_id")
    the_commenter_id = params.fetch("input_author_id")
    input_comment = params.fetch("input_body")

    a_new_comment = Comment.new
    a_new_comment.photo_id = the_photo_id
    a_new_comment.author_id = the_commenter_id
    a_new_comment.body = input_comment

    a_new_comment.save

    redirect_to("/photos/" + the_photo_id.to_s)
  end
end