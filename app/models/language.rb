class Language < ActiveRecord::Base
  belongs_to :survey, :polymorphic => true
  has_many :questions
end
