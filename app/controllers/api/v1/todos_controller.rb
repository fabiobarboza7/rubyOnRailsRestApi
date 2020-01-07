class Api::V1::TodosController < ApplicationController
  before_action :set_todo, only: [:show, :update, :destroy]
  before_action :require_authorization!, only: [:show, :update, :destroy]
  # GET /api/v1/todos
  def index
    @todos = current_user.contacts.todos
    render json: @todos
  end

  # GET /api/v1/todos/1
  def show
    render json: @todo
  end

  # POST /api/v1/todos
  def create
    @todo = Todo.new(todo_params.merge(user: current_user))
    
    if @todo.save
      render json: @todo, status: :created
    else
      render json: @todo.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/todos/1
  def update
    if @todo.update(todo_params)
      render json: @todo
    else
      render json: @todo.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/todos/1
  def destroy
    @todo.destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_todo
    @todo = Todo.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def todo_params
    params.require(:todo).permit(:title, :is_completed)
  end

  def require_authorization!
    unless current_user == @contact.user
      render json: {}, status: :forbidden
    end
  end

end
