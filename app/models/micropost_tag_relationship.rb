class MicropostTagRelationship < ApplicationRecord
  belongs_to :micropost
  belongs_to :tag
end
