class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :avatar
      t.string :avatar2
      t.timestamps
    end
  end
end
