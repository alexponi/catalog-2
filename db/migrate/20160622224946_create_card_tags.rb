class CreateCardTags < ActiveRecord::Migration
  def change
    create_table :card_tags do |t|
      t.belongs_to :card, index: true
      t.belongs_to :tag, index: true
      
      t.timestamps null: false
    end
  end
end
