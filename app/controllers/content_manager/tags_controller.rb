require_dependency "content_manager/application_controller"

module ContentManager
  class TagsController < ApplicationController
    before_action :authenticate_admin! if Rails.env.production?
    before_action :set_tag, only: %i[edit update destroy]
  
    def index
      @tags = Tag.all.order('name ASC')
    end
  
    def new
      @tag = Tag.new
    end
  
    def create
      @tag = Tag.create(tag_params)
      if @tag.valid?
        flash[:notice] = 'Tag created successfully.'
        redirect_to tags_path
      else
        render :new
      end
    end
  
    def edit; end
  
    def update
      @tag.update(tag_params)
  
      if @tag.valid?
        flash[:notice] = 'Tag updated successfully.'
        redirect_to tags_path
      else
        render :edit
      end
    end
  
    def destroy
      if @tag.destroy
        flash[:notice] = 'Tag deleted successfully.'
        redirect_to tags_path
      else
        flash[:alert] = 'Error deleting tag.'
      end
    end
  
    private
  
    def tag_params
      params.require(:tag).permit(:name, :key, :tag_type)
    end
  
    def set_tag
      @tag = Tag.friendly.find(params[:id])
    end
  end
end
