class ReportsController < ApplicationController
  before_action :set_aluno, only: [:xaxando]
  # before_action :authorize_request_aluno

  # POST /escolas/:escola_id/alunos/:aluno_id/denuncias
  def xaxando
    puts "jeba"
    logger.debug "dido"
    imagesArray = params[:image].to_a
    puts "count #{imagesArray.count}"

    report = @aluno.report.create! report_params
    if imagesArray.is_a?(Array)
      imagesArray.each do |elem|
          report.image.create! base64Data: elem
        end
    end

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
    params.permit :categoria, :descricao, :status
  end
end
