class RemoveDescricaoFromReport < ActiveRecord::Migration[5.1]
  def change
    remove_column :reports, :descrição
  end
end
