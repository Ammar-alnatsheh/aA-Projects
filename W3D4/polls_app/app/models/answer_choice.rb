class AnswerChoice < ApplicationRecord
  validates :text, presence: true
  
  has_many :responses,
  primary_key: :id,
  foreign_key: :answer_choice_id,
  class_name: :Response
  
  
end