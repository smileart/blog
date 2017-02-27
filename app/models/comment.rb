class Comment < ApplicationRecord
  validates :commenter, presence: true,
                        length: { minimum: 5 }
  validates :body, presence: true

  belongs_to :article
end
