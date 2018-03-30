class AlunosController < ApplicationController
  before_action :authorize_request_aluno, except: :create
  before_action :set_aluno, only: [:show, :show_reports, :update, :delete]
  before_action :set_escola, only: [:create]

  # GET /alunos
  def index
    @alunos = Aluno.all
    json_response @alunos
  end

  #POST /alunos/signup
  def create
    @aluno = @escola.aluno.create! aluno_params

    auth_token = AuthenticateUser.new(aluno_params[:email], aluno_params[:password]).call_aluno

    json_response auth_token
  end

  # GET /alunos/:id
  def show
    json_response @aluno
  end

  # PUT /alunos/:id
  def update
    delete_update do
      @aluno.update aluno_params
      json_response @aluno
    end
  end

  # DELETE /alunos/:id
  def delete
    delete_update do
      @aluno.destroy
      head :no_content
    end
  end

  #GET /alunos/logout
  def logout_aluno
    LogoutUser.new(request.headers["Authorization"]).call
    head :no_content
  end

  # GET /escolas/:escola_id/alunos/:aluno_id/reports
  def show_reports
    report_array = @aluno.report.to_a
    report_image_array = []

    for report in report_array
      report_image_array << { report: report, image: report.image }
    end

    json_response report_image_array
  end

  private

  def aluno_params
    params.permit :email, :password, :serie, :nome, :avatar
  end

  def set_escola
    @escola = Escola.find params[:escola_id]
  end

  def set_aluno
    set_escola
    @aluno = @escola.aluno.find params[:aluno_id]
  end

  def delete_update
    if @aluno.id == @current_aluno.id
      yield

    else
      raise ExceptionHandler::UnauthorizedAction, Message.unauthorized_action

    end
  end
end
