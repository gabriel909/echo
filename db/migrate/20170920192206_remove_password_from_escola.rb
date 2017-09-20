class RemovePasswordFromEscola < ActiveRecord::Migration[5.1]
  def change
    remove_column :escolas, :password, :string
  end
end
