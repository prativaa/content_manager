require_dependency "content_manager/application_controller"

module ContentManager
  class CategoriesController < ApplicationController
    before_action :authenticate_admin! if Rails.env.production?
    before_action :set_category, only: %i[show edit update]
    def new
      @category = Category.new
    end
  
    def index
      @categories = Category.all
    end
  
    def create
      @category = Category.create(category_params)
      if @category.valid?
        flash[:notice] = 'Category created successfully.'
        redirect_to root_path
      else
        render :new
      end
    end
  
    def show; end
  
    def edit; end
  
    def update
      if @category.update(category_params)
        flash[:notice] = 'Category updated successfully'
        redirect_to admin_categories_path
      else
        flash[:alert] = 'Invalid attributes'
        render :edit
      end
    end
  
    private
  
    def category_params
      params.require(:category).permit(:name, :desc, :key)
    end
  
    def set_category
      @category = Category.friendly.find(params[:id])
    end
  end
end
