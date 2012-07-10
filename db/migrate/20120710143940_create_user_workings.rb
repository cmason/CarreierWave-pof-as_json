class CreateUserWorkings < ActiveRecord::Migration
  def change
    create_table :user_workings do |t|
      t.string :username

      t.string :avatar

      t.timestamps
    end
  end
end
