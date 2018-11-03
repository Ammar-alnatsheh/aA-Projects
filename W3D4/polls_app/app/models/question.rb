class Question < ApplicationRecord
  validates :text, presence: true
  
  belongs_to :poll,
  primary_key: :id,
  foreign_key: :poll_id,
  class_name: :Poll
  
end