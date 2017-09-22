class AddDescricaoToReport < ActiveRecord::Migration[5.1]
  def change
    add_column :avisos, :descricao, :text
    add_column :reports, :descricao, :text
  end
end
