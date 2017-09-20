class AddPasswordDigestToEscola < ActiveRecord::Migration[5.1]
  def change
    add_column :escolas, :password_digest, :string
  end
end
