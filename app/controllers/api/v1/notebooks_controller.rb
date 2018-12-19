class Api::V1::NoteBooksController < ApplicationController
before_action :authenticate_user
before_action :set_notebook, only: [:show, :update, :destroy]

def index
  if current_user
    @notebooks = Notebook.all
    render json: @notebooks
  end
end

def show
  render json: @notebook
end

def create
  @notebook = Notebook.new(notebook_params)
  if @notebook.save
    render json: @notebook, status: :created, location: @notebook
  else
    render json: @notebook.errors, status: :unprocessable_entity
  end
end

def update
  if @notebook.update(notebook_params)
    render json: @notebook
  else
    render json: @notebook.errors, status: :unprocessable_entity
  end
end

def destroy
  @notebook.destroy
end

private
  def set_notebook
    @notebook = Notebook.find(params[:id])
  end

  def banana_params
    params.require(:banana).permit(:name, :location)
  end
end
