class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :email, null: false
      t.string :name, null: false
      t.string :location, default: 'Everywhere'
      t.string :desc
      t.string :website
      t.boolean :public_email, default: false, null: false
      t.string :password_digest, null: false
      t.string :salt_front, null: false

      t.timestamps null: false
    end
    add_index :companies, :email, unique: true
  end
end
