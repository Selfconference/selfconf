class CreateSubmissions < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :twitter
      t.text :bio, null: false
      t.string :headshot, null: false
      t.boolean :admin, null: false, default: false
      t.string :password_digest, null: false

      t.timestamps
    end

    create_table :submissions do |t|
      t.string :talkname, null: false
      t.text :abstract, null: false
      t.string :talktype, null: false
      t.string :notes
      t.belongs_to :user
      t.belongs_to :event

      t.timestamps
    end

    create_table :votes do |t|
      t.integer :value
      t.belongs_to :user
      t.belongs_to :submission

      t.timestamps
    end
  end
end
