class TagsNote < ApplicationRecord
  belongs_to :tag
  belongs_to :note

  validates_uniqueness_of :tag, scope: :note
end
