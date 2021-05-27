class NotesController < ApplicationController
  def index
    @notes = Note.all
  end

  def show
    @note = Note.find(params[:id])
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    @note.user = current_user
    if @note.save
      redirect_to friend_path
    else
      render :new
    end
  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
    @note.update(note_params)
    if @note.save
      redirect_to friend_path
    else
      render :edit
    end
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy
    redirect_to friend_path
  end

  def note_params
    params.require(:note).permit(:content, :friend_id, :user_id)
  end
end
