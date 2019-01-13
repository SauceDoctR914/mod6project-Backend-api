class Api::V1::NotesController < ApplicationController
  before_action :authenticate_user
  before_action :set_note, only: [:show, :update, :destroy]

def index

  @notes = Note.all
  render json: @notes
end

def show
  @note = Note.find(params[:id])
end

def create
  @note = Note.new(note_params)
  @note.user_id = current_user.id
  if @note.save
  render json: @note, status: :created, location: api_v1_note_url(@note)
  else
    render json: @note.errors, status: :unprocessable_entity
  end
end

def update
  @note = Note.find(params[:id])
  @note.user_id = current_user.id
  if @note.update(note_params)
    render json: @note
  else
    render json: @note.errors, status: :unprocessable_entity
  end
end

def destroy
  @note.destroy
end

private
def set_note
  @note = Note.find(params[:id])
end

  def note_params
    params.permit(:note).permit(:title, :description, :content, :created, :notebook_id, :user_id )
  end

end
