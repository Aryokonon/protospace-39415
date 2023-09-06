class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:edit, :show, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :check_ownership, only: [:edit, :update, :destroy]

  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = current_user.prototypes.build(prototype_params)
    if @prototype.save
      redirect_to root_path, notice: 'Prototype was successfully created.'
    else
      render :new
    end
  end

  def edit
    if current_user != @prototype.user
      redirect_to root_path, alert: "You are not authorized to edit this prototype."
    end
  end

  def update
    if @prototype.update(prototype_params)
      redirect_to @prototype, notice: 'Prototype was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    if current_user == @prototype.user
      @prototype.destroy
      redirect_to root_path, notice: 'Prototype was successfully destroyed.'
    else
      redirect_to root_path, alert: "You are not authorized to delete this prototype."
    end
  end

  def show
    @comment = Comment.new
    @comments = @prototype.comments

    if user_signed_in?
      @user = @prototype.user
      @user_owns_prototype = current_user == @prototype.user
    else
      @user_owns_prototype = false
    end
  end

  private

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image)
  end

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  def check_ownership
    @prototype = Prototype.find(params[:id])
    redirect_to root_path unless current_user == @prototype.user
  end
end