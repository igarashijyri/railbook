require 'test_helper'

class BookTest < ActiveSupport::TestCase
  test "book save" do
    book = Book.new({
      isbn: '978-4-7741-4466X',
      title: 'Ruby on Rails本格入門',
      price: 3100,
      publish: '技術評論社',
      published: '2017-02-14',
      dl: false
    })
    assert_not book.save, 'Failed to save'
  end
end
