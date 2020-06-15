class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :micropost
  has_many_attached :pictures
  validates :user_id, presence: true
  validates :comment, length: { maximum: 1000 }
  validates :only_micropost_id, presence: true
  # validate :validate_pictures

  private
    def only_micropost_id
      comment.presence or pictures.attached?
    end

    # def validate_pictures
      # if pictures.attached?
        # if !pictures.content_type.in?(%('image/jpeg image/jpg image/png image/gif'))
          # errors.add(:pictures, 'はjpeg, jpg, png, gif以外の投稿ができません')
        # elsif pictures.blob.byte_size > 5.megabytes
          # errors.add(:pictures, "のサイズが5MBを超えています")
        # end
      # end
    # end
end