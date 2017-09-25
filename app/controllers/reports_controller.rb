class ReportsController < ApplicationController
  before_action :set_aluno, only: [:create]
  #before_action :authorize_request_aluno

  # POST /escolas/:escola_id/alunos/:aluno_id/denuncias
  def create
    imagesArray = params[:image].to_a
    imagesURLs = []
    report = @aluno.report.create! report_params

    imagesArray.each do |elem|
      imageAux = report.image.create! base64Data: elem
      imagesURLs.push(imageAux.base64Data)
    end

    puts "url: #{imagesURLs.to_json}"
    json_response report, report.image
  end

  private

  def array_to_json

  end

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
