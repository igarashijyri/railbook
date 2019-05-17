class Author < ApplicationRecord
  belongs_to :user
  # 関連の命名を変更(エイリアスをつける)
  has_many :comments :comments, -> { where(deleted: false) }, class_name: 'FanComment', foreign_key: 'author_no'
  has_many :memos, as: :memoable
end
