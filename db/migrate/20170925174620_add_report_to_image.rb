class AddReportToImage < ActiveRecord::Migration[5.1]
  def change
    add_reference :images, :report, index:true
  end
end
