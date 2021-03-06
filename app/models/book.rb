class Book < ApplicationRecord
  has_many :reviews
  has_many :users, through: :reviews
  has_and_belongs_to_many :authors
  has_many :memos, as: :memoable

  validates :isbn,
    presence: true,
    uniqueness: true,
    length: { is: 17 },
    isbn: true

  validates :title, presence: true, length: { minimum: 1, maximum: 100}
  validates :price, numericality: { only_integer: true, less_than: 10000 }
  validates :publish, inclusion:{ in: ['技術評論社', '翔泳社', '秀和システム', '日経BP社', 'ソシム'] }

  scope :gihyo, -> { where(publish: '技術評論社') }
  scope :newer, -> { order(published: :desc) }
  scope :top10, -> { newer.limit(10) }
  scope :hoge, -> {where(publish: '技術評論社').order(published: :desc)}
end
