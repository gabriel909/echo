class AddReportToVideo < ActiveRecord::Migration[5.1]
  def change
    add_reference :videos, :report, foreign_key: true
  end
end
