class Comment < ApplicationRecord
  belongs_to :visitor_comments, :polymorphic => true
end
