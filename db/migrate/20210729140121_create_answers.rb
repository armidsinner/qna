class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.text :body, null: false
<<<<<<< HEAD
      t.references :question, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
=======
      t.references :question, null: false, foreign_key: true 

>>>>>>> d43852864566b4709dd6a25091aa0bd9c113e5f5
      t.timestamps
    end
  end
end
