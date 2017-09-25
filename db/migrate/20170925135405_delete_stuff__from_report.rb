class DeleteStuffFromReport < ActiveRecord::Migration[5.1]
  def change
    remove_column :reports, :videos
    remove_column :reports, :image
  end
end
