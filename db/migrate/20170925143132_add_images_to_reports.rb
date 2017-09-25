class AddImagesToReports < ActiveRecord::Migration[5.1]
  def change
    add_reference :reports, :image, foreign_key:true
    add_reference :reports, :video, foreign_key:true
  end
end
