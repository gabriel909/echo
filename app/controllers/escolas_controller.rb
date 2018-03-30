class EscolasController < ApplicationController
  before_action :authorize_request_escola, except: [:create,:index]
  before_action :set_escola_id, only: [:show, :update, :show_reports]
  before_action :set_reports, only: [:show_reports, :show_reports_categories]

  #POST
  #GET /escolas
  def index
    @escolas = Escola.all
    json_response @escolas
  end

  #GET /escolas/select
  def show
    json_response @escola
  end

  #POST /escolas/signup
  def create
    @escola = Escola.create! escola_params

    auth_token = AuthenticateUser.new(escola_params[:email], escola_params[:password]).call_escola

    json_response auth_token
  end

  #DELETE /escolas/:id
  def delete
    delete_update do
      @escola.destroy
      head :no_content
    end
  end

  #PUT /escolas/:id
  def update
    delete_update do
      @escola.update! escola_params
      json_response @escola
    end
  end

  def logout_escola
    LogoutUser.new(request.headers['Authorization']).call
    head :no_content
  end

  # GET /escolas/:escola_id/reports
  def show_reports
    report_array = @reports.to_a
    report_image_array = []

    for report in report_array
      report_image_array << { report: report, image: report.image, aluno: report.aluno }
    end

    puts "no show reports escola"
    json_response report_image_array
  end

  # GET /escolas/:escola_id/reports
  def show_reports_categories
    reports_category = @reports.where categoria: params[:category]
    json_response reports_category
  end

  private

  def escola_params
    params.permit :email, :password, :unidade, :nome, :cnpj
  end

  def set_escola
    @escola = Escola.where "nome = ? AND unidade = ?", params[:nome], params[:unidade]
  end

  def set_escola_id
    @escola = Escola.find params[:escola_id]
  end

  def set_reports
    set_escola_id
    alunos_id = @escola.aluno.select :id

    @reports = Report.where :aluno_id => alunos_id
  end

  def delete_update
    #TODO
    yield
  end
end
