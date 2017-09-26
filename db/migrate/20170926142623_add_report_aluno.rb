class AddReportAluno < ActiveRecord::Migration[5.1]
  def change
    add_reference :reports, :aluno, foreign_key: true
    add_reference :alunos, :report, foreign_key: true
    add_reference :escolas, :aluno, foreign_key: true
    add_reference :alunos, :escola, foreign_key: true
    add_reference :escolas, :report, foreign_key: true
    add_reference :reports, :escola, foreign_key: true
  end
end
