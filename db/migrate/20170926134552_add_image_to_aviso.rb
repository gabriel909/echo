class AddImageToAviso < ActiveRecord::Migration[5.1]
  def change
    add_reference :avisos, :image, foreign_key: true
  end
end
