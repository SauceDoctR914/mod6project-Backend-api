class Api::V1::NotebooksController < ApplicationController
before_action :authenticate_user
before_action :set_notebook, only: [:show, :update, :destroy]


def index
  # debugger
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
    @notebook.user_id = current_user.id
  if @notebook.save
    render json: @notebook, status: :created, location: api_v1_notebook_url(@notebook)
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

  def notebook_params
    params.require(:notebook).permit(:title, :user_id)
  end
end
