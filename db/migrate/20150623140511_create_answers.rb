class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.belongs_to :question, null: false
      t.text :description, null: false

      t.timestamps null: false
    end

    add_index(:answers, :question_id)
  end
end
