class MakeAbstractNullable < ActiveRecord::Migration
  def up
    change_column :submissions, :abstract, :string, null: true
  end

  def down
  end
end
