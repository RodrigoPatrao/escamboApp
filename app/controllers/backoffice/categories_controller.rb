class Backoffice::CategoriesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_category, only: [:edit, :update, :destroy]

  layout 'backoffice'
  def index
    @categories = Category.order(:description).page params[:page]
  end
  def new
    @category = Category.new
  end
  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Categoria #{@category.description} adicionada à lista."
      redirect_to backoffice_categories_path
    else
      flash[:danger] = "Não foi possível adicionar categoria à lista: #{ @category.errors.messages[:description].join }"
      redirect_to new_backoffice_category_path
    end
  end
  def edit
  end
  def update
    if @category.update(category_params)
      flash[:success] = "Categoria #{@category.description} atualizada."
      redirect_to backoffice_categories_path
    else
      flash[:danger] = "Não foi possível atualizar #{@category.description}."
      redirect_to edit_backoffice_category_path
    end
  end
  def destroy
    if @category.destroy
      flash[:success] = "Categoria #{@category.description} excluída."
      redirect_to backoffice_categories_path
    else
      flash[:danger] = "Não foi possível excluir #{@category.description}."
      redirect_to backoffice_categories_path
    end
  end
  private
  def set_category
    @category = Category.find(params[:id])
  end
  def category_params
    params.require(:category).permit(:description)
  end
end
