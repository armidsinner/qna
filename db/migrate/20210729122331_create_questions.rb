class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.string :title, null: false
      t.text :body, null: false
<<<<<<< HEAD
      t.references :user, null: false, foreign_key: true
=======
>>>>>>> d43852864566b4709dd6a25091aa0bd9c113e5f5

      t.timestamps
    end
  end
end
