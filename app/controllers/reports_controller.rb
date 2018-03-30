class ReportsController < ApplicationController

  before_action :set_escola_report, only: :delete
  before_action :set_aluno, only: [:create]
  before_action :authorize_request_aluno, except: [:delete, :update]

  # POST /escolas/:escola_id/alunos/:aluno_id/denuncias
  def create
    images_array = params[:image].to_a
    videos_array = params[:video].to_a
    report = @aluno.report.create! report_params

    images_array.each do |elem|
      report.image.create! image_data: elem
    end

    videos_array.each do |elem|
      report.video.create! base64Data: elem
    end

    json_response report, report.image, report.video
  end

  def delete
    images_array = @report.image.to_a

    images_array.each do |elem|
      elem.destroy
    end

    @report.destroy
    head :no_content
  end

  def update
	puts "NO UPDATE!!!!!!!!!!!!"
	escola_id = params[:escola_id]
  	@reports = params[:reports].to_a
        @reports.each do |elem|
	r = Report.find elem[:id]
        e = Escola.find escola_id
	puts "Escola_id #{r.escola.id} and r #{e.id}"
		raise Exception.new('trying to delete report that is not from your school') if r.escola.id != e.id
	r.status = elem[:status]
	puts "STATUS: #{r.status}"
        r.save
	end
	head :no_content
  end

  private

  def set_escola_report
    @report = Report.find params[:report_id]
    escola = Escola.find params[:escola_id]
    raise Exception.new('trying to delete report that is not from your school') if @report.escola.id != escola.id
  end

  def set_aluno
    escola = Escola.find params[:escola_id]
    @aluno = escola.aluno.find params[:aluno_id]
  end

  def set_aluno_report
    @aviso = @aluno.report.find_by! id: params[:id] if @aluno
  end

  def report_params
    params.permit :categoria, :descricao, :status, :escola_id
  end
end
