class Backoffice::AdminsController < ApplicationController
  before_action :authenticate_admin!
  before_action :get_admin, only: [:edit, :update, :destroy]
  before_action :set_admin, only: [:new, :create]

  layout 'backoffice'
  def index
    @admins = policy_scope(Admin).page(params[:page])
  end
  def new
    authorize @admin
  end
  def create
    @admin.update_attributes(permitted_attributes(@admin))
    if @admin.save
      flash[:success] = "Perfil '#{@admin.name}' adicionado à lista."
      redirect_to backoffice_admins_path
    else
      flash[:danger] = "Não foi possível adicionar '#{@admin.name}' à lista: #{@admin.errors.messages.flatten.join(' ')}."
      redirect_to new_backoffice_admin_path
    end
  end
  def edit
  end
  def update
    if password_blank?
      params[:admin].except!(:password, :password_confirmation)
    end
    if @admin.update(permitted_attributes(@admin))
      AdminMailer.update_email(current_admin, @admin).deliver_now
      flash[:success] = "Perfil '#{@admin.name}' alterado com sucesso."
      redirect_to backoffice_admins_path
    else
      flash[:danger] = "Não foi possível atualizar '#{@admin.name}': #{@admin.errors.messages.flatten.join(' ')}."
      redirect_to edit_backoffice_admin_path
    end
  end
  def destroy
    name = @admin.name
    authorize @admin
    if @admin.destroy
      flash[:success] = "Perfil '#{name}' excluído."
      redirect_to backoffice_admins_path
    else
      flash[:danger] = "Não foi possível excluir '#{@admin.email}'."
      redirect_to backoffice_admins_path
    end
  end
  private
  def get_admin
    @admin = Admin.find(params[:id])
  end
  def set_admin
    @admin = Admin.new
  end
  def pundit_user
    current_admin
  end
  def password_blank?
    params[:admin][:password].blank? && params[:admin][:password_confirmation].blank?
  end
end
