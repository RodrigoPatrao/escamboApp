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
      flash[:success] = "Perfil #{@admin.email} adicionado à lista."
      redirect_to backoffice_admins_path
    else
      flash[:danger] = "Não foi possível adicionar administrador à lista: #{ @admin.errors.messages[:description].join }"
      redirect_to new_backoffice_admin_path
    end
  end
  def edit
  end
  def update
    passwd = params[:admin][:password]
    passwd_conf = params[:admin][:password_confirmation]
    if passwd.blank? && passwd_conf.blank?
      params[:admin].delete(:password)
      params[:admin].delete(:password_confirmation)
    end
    if @admin.update(admin_params)
      flash[:success] = "Perfil para #{@admin.email} atualizado."
      redirect_to backoffice_admins_path
    else
      flash[:danger] = "Não foi possível atualizar #{@admin.email}."
      redirect_to edit_backoffice_admin_path
    end
  end
  def destroy
    if @admin.destroy
      flash[:success] = "Perfil #{@admin.email} excluído."
      redirect_to backoffice_admins_path
    else
      flash[:danger] = "Não foi possível excluir #{@admin.email}."
      redirect_to backoffice_admins_path
    end
  end
  private
  def set_admin
    @admin = Admin.find(params[:id])
  end
  def admin_params
    params.require(:admin).permit(:name, :email, :password, :password_confirmation, :role)
  end
end
