class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
    	t.string "name"
    	t.string "desc"
    	t.datetime "start_time"
    	t.datetime "end_time"
    end
  end
end
