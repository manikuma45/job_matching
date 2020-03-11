class Language < ApplicationRecord
  belongs_to :user
  enum level: {blank: 0, Native: 1, Fluent: 2, Business: 3, Conversation: 4}
end
