class CategoriesController < ApplicationController

  before_action :find_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def show
    @notes = @category.notes #because of the associations in the model files we can call all notes in any specific category in this way.
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.owner_id = 1
    if @category.save
      flash[:alert] = 'Your new category has been successfully created.'
      redirect_to :action => 'index'
    else
      flash.now[:alert] = 'Error creating the new category, please try again!'
      render 'new'
    end
  end

  def edit
  end

  def update
    if @category.update_attributes(category_params)
      flash[:alert] = "Your updated category has been saved."
      redirect_to category_path
    else
      flash.now[:alert] = "Couldn't update your category, please try again or cancel!"
      render 'edit'
    end
  end

  def destroy
    if @category.destroy
      flash[:alert] = "Your category has been deleted successfully"
      redirect_to :action => 'index'
    else
      flash.now[:alert] = "We couldn't delete your category, please try again!"
      render 'show'
    end
  end

  private

  def find_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :description)
  end
end
