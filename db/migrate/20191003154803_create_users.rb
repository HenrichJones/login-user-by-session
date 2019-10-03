class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :fullname
      t.string :cpf
      t.string :nickname
      t.boolean :active
      t.string :email

      t.timestamps
    end
  end
end
