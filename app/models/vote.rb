class Vote < ApplicationRecord
  belongs_to :voteable, :polymorphic => true
  belongs_to :voter, :polymorphic => true
end
