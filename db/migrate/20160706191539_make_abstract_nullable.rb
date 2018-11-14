class MakeAbstractNullable < ActiveRecord::Migration[5.2]
  def up
    change_column :submissions, :abstract, :string, null: true
  end

  def down
  end
end
