class Review < ApplicationRecord
  belongs_to :book
  belongs_to :user

  # メソッド呼び出ししなくてもデフォルトで適用される
  default_scope { order(updated_at: :desc) }
end
