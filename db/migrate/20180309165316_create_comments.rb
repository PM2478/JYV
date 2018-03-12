class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text :content
      t.references :user, foreign_key: true
      t.references :post, foreign_key: true
      t.integer "cached_votes_total", default: 0
      t.integer "cached_votes_score", default: 0
      t.integer "cached_votes_up", default: 0
      t.integer "cached_votes_down", default: 0
      t.integer "cached_weighted_score", default: 0
      t.integer "cached_weighted_total", default: 0
      t.float "cached_weighted_average", default: 0.0
      t.index ["cached_votes_down"], name: "index_comments_on_cached_votes_down"
      t.index ["cached_votes_score"], name: "index_comments_on_cached_votes_score"
      t.index ["cached_votes_total"], name: "index_comments_on_cached_votes_total"
      t.index ["cached_votes_up"], name: "index_comments_on_cached_votes_up"
      t.index ["cached_weighted_average"], name: "index_comments_on_cached_weighted_average"
      t.index ["cached_weighted_score"], name: "index_comments_on_cached_weighted_score"
      t.index ["cached_weighted_total"], name: "index_comments_on_cached_weighted_total"
      t.timestamps
    end
  end
end
