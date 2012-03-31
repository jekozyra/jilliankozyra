class Language < ActiveRecord::Base
  belongs_to :survey, :polymorphic => true
end
