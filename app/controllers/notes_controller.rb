class NotesController < ApplicationController

  def index
    @notes = Note.all.order("updated_at DESC")
  end

  def show
    @note = Note.find(params[:id])
    @category = Category.find(@note[:category_id])
  end

  def new
    @note = Note.new
    @categories = Category.all
  end

  def create
    @note = Note.new(note_params)
    @note.owner_id = 1
    if @note.save
      flash[:alert] = "Your note has been saved"
      redirect_to :action => 'index'
    else
      flash.now[:alert] = "Error saving your new note, please try again!"
      render 'new'
    end
  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])
    if @note.update_attributes(note_params)
      flash[:alert] = "Your updated note has been saved."
      redirect_to note_path
    else
      flash.now[:alert] = "Couldn't update your note, please try again or cancel!"
      render 'edit'
    end
  end

  def destroy
    @note = Note.find(params[:id])
    if @note.destroy
      flash[:alert] = "Your note has been deleted successfully"
      redirect_to :action => 'index'
    else
      flash.now[:alert] = "We couldn't delete your note, please try again!"
      render 'show'
    end
  end

  private
  def note_params
    params.require(:note).permit(:title, :body, :category_id)
  end
end
