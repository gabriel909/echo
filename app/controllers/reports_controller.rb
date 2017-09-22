class ReportsController < ApplicationController
  #before_action :set_aluno

   def show
     puts "fdasfda"
   end



  private

  def set_aluno
    @aluno = Aluno.find params[:aluno_id]
  end

  def set_aluno_report
    @aviso = @aluno.report.find_by! id: params[:id] if @aluno
  end

  def reports_params
    params.permit :categoria, :descricao, :status, :images, :videos
  end


end
