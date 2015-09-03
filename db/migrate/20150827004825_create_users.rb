class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :login, null: false
      t.string :password, null: false
      t.string :email
      t.string :website
      t.timestamps
    end
  end
end
