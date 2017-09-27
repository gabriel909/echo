class AddReportToImage < ActiveRecord::Migration[5.1]
  def change
    add_reference :images, :report, foreign_key: true
  end
end
