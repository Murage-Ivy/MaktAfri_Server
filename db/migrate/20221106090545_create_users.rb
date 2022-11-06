class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :authors do |t|
      t.string :user_name
      t.string :email
    end
  end
end
