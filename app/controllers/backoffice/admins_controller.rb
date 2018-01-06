class Backoffice::AdminsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_admin, only: [:edit, :update, :destroy]

  layout 'backoffice'
  def index
    @admins = policy_scope(Admin).page params[:page]
  end
  def new
    @admin = Admin.new
    authorize @admin
  end
  def create
    @admin = Admin.new
    @admin.update_attributes(permitted_attributes(@admin))
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
    passwd = params[:admin][:password]
    passwd_conf = params[:admin][:password_confirmation]
    if passwd.blank? && passwd_conf.blank?
      params[:admin].except!(:password, :password_confirmation)
    end
    if @admin.update(permitted_attributes(@admin))
      flash[:success] = "Perfil para '#{@admin.name}' atualizado."
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
  def set_admin
    @admin = Admin.find(params[:id])
  end
  # def admin_params
  #   passwd = params[:admin][:password]
  #   passwd_conf = params[:admin][:password_confirmation]
  #   if passwd.blank? && passwd_conf.blank?
  #     params[:admin].except!(:password, :password_confirmation)
  #   end
  #   params.require(:admin).permit(policy(@admin).permitted_attributes)
  # end
  def pundit_user
    current_admin
  end
end
