class Backoffice::SendMailController < ApplicationController
  def edit
    @admin = Admin.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  def create
    begin
      AdminMailer.send_email(current_admin, params[:recipient], params[:subject], params[:message]).deliver_now
      flash[:success] = 'Email enviado com sucesso.'
      redirect_to backoffice_admins_path
    rescue
      flash[:danger] = 'Erro ao enviar email. Tente novamente.'
      redirect_to backoffice_admins_path
    end
  end
end
