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
    @friend = Friend.find(params[:friend_id])
    @note = Note.new(note_params)
    @note.friend = @friend
    @note.user = current_user
    if @note.save
      redirect_to friend_path(@friend)
    else
      render 'friends/show'
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
    friend = @note.friend
    @note.destroy
    redirect_to friend_path(friend)
  end

  def note_params
    params.require(:note).permit(:content, :friend_id, :user_id)
  end
end
