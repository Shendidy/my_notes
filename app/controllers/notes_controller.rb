class NotesController < ApplicationController

  before_action :find_note, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @notes = Note.where(user_id: current_user.id).order("updated_at DESC")
  end

  def show
    @category = Category.find(@note[:category_id])
  end

  def new
    @note = current_user.notes.build
    @categories = Category.where(user_id: current_user.id)
  end

  def create
    @note = current_user.notes.build(note_params)
    @note.user_id = current_user.id
    if @note.save
      flash[:alert] = "Your note has been saved"
      redirect_to :action => 'index'
    else
      flash.now[:alert] = "Error saving your new note, please try again!"
      render 'new'
    end
  end

  def edit
  end

  def update
    if @note.update_attributes(note_params)
      flash[:alert] = "Your updated note has been saved."
      redirect_to note_path
    else
      flash.now[:alert] = "Couldn't update your note, please try again or cancel!"
      render 'edit'
    end
  end

  def destroy
    if @note.destroy
      flash[:alert] = "Your note has been deleted successfully"
      redirect_to :action => 'index'
    else
      flash.now[:alert] = "We couldn't delete your note, please try again!"
      render 'show'
    end
  end

  private

  def find_note
    @note = Note.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:title, :body, :category_id, :user_id)
  end
end
