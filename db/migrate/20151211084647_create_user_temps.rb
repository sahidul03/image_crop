class CreateUserTemps < ActiveRecord::Migration
  def change
    create_table :user_temps do |t|
      t.string :first_name
      t.string :last_name
      t.string :photo

      t.timestamps null: false
    end
  end
end
