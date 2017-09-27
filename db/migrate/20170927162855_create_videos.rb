class CreateVideos < ActiveRecord::Migration[5.1]
  def change
    create_table :videos do |t|
      t.string :video_data
      t.belongs_to :report, index: true
    end
  end
end
