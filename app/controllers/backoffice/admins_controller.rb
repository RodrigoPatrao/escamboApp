class Backoffice::AdminsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_admin, only: [:edit, :update, :destroy]

  layout 'backoffice'
  def index
    @admins = Admin.order(:name).page params[:page]
  end
  def new
    @admin = Admin.new
  end
  def create
    @admin = Admin.new(admin_params)
    if @admin.save
      flash[:success] = "Perfil '#{@admin.name}' adicionado à lista."
      redirect_to backoffice_admins_path
    else
      flash[:danger] = "Não foi possível adicionar '#{@admin.name}' à lista: #{ @admin.errors.messages[:description].join }"
      redirect_to new_backoffice_admin_path
    end
  end
  def edit
  end
  def update

    if @admin.update(admin_params)
      flash[:success] = "Perfil para '#{@admin.name}' atualizado."
      redirect_to backoffice_admins_path
    else
      flash[:danger] = "Não foi possível atualizar '#{@admin.name}'."
      redirect_to edit_backoffice_admin_path
    end
  end
  def destroy
    name = @admin.name
    if @admin.destroy
      flash[:success] = "Perfil '#{name}' excluído."
      redirect_to backoffice_admins_path
    else
      flash[:danger] = "Não foi possível excluir '#{@admin.email}'."
      redirect_to backoffice_admins_path
    end
  end
  private
  def set_admin
    @admin = Admin.find(params[:id])
  end
  def admin_params
    passwd = params[:admin][:password]
    passwd_conf = params[:admin][:password_confirmation]
    if passwd.blank? && passwd_conf.blank?
      params[:admin].except!(:password, :password_confirmation)
    end
    params.require(:admin).permit(:name, :email, :password, :password_confirmation, :role)
  end
end
