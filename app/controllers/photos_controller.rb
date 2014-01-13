class PhotosController < ApplicationController
  before_filter :load_attachable1

  before_action :set_photo, only: [:show, :edit, :update, :destroy]

  def index
    @photos =  @attachable.photos
  end

  def new
    @photo   = @attachable.photos.build
  end

  def create
    @photo =  @attachable.photos.build(photo_params)
    if @photo.save
      redirect_to @attachable, notice: 'photo was successfully created'
    else
      render 'new'
    end
  end

  def show

  end

  def edit

  end

  def update
      if @photo.update(photo_params)
        redirect_to @attachable, notice: 'photo was successfully updated.'
      else
        render  'edit'
      end

  end

  def destroy
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to @attachable }
      format.json { head :no_content }
    end
  end

private
  def load_attachable
    resource, id = request.path.split('/')[1, 2]
    @attachable = resource.singularize.classify.constantize.find(id)
  end

  def load_attachable1
    klass = [Article, Program].detect { |c| params["#{c.name.underscore}_id"]}
    @attachable = klass.find(params["#{klass.name.underscore}_id"])
  end

  def set_photo
    @photo = Photo.find(params[:id])
  end

  def photo_params
    params.require(:photo).permit(:name, :image,:remote_image_url)
  end
end
