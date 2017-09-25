class ReportsController < ApplicationController
  before_action :set_aluno, only: [:create]
  before_action :authorize_request_aluno

  # POST /escolas/:escola_id/alunos/:aluno_id/denuncias
  def create
    report = @aluno.report.create! report_params
    json_response report
  end

  private

  def set_aluno
    escola = Escola.find params[:escola_id]
    @aluno = escola.aluno.find params[:aluno_id]
  end

  def set_aluno_report
    @aviso = @aluno.report.find_by! id: params[:id] if @aluno
  end

  def report_params
    params.permit :categoria, :descricao, :status, :images, :videos
  end
end
