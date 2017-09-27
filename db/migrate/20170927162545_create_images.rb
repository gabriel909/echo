class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.string :image_data
      t.belongs_to :aviso, index: true
      t.belongs_to :report, index: true
    end
  end
end
