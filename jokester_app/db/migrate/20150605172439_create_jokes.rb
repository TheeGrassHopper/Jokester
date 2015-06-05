class CreateJokes < ActiveRecord::Migration
  def change
    create_table :jokes do |t|
    	t.string :content, :index => true, :null => false
     	t.timestamps null: false
    end
  end
end
