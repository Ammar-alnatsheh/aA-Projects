# == Schema Information
#
# Table name: shortenedurls
#
#  id         :bigint(8)        not null, primary key
#  user_id    :integer          not null
#  short_url  :string           not null
#  long_url   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Shortenedurls < ApplicationRecord
  

  
  
  def self.random_code
    short_url = SecureRandom.urlsafe_base64
    while Shortenedurls.exists?(short_url)
      short_url = SecureRandom.urlsafe_base64
    end
    short_url
  end
  
end
