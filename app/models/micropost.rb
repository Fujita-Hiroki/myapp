class Micropost < ApplicationRecord
  belongs_to :user
  has_many_attached :pictures
  has_many :comments, dependent: :destroy
  has_many :micropost_tag_relationships, dependent: :destroy
  has_many :tags, through: :micropost_tag_relationships
  default_scope { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :understanding, length: { maximum: 1000 }
  validates :problem, length: { maximum: 1000 }
  validates :only_user_id, presence: true
  validate :validate_pictures
  validates :tag_ids, presence: true

  def resize_pictures
    return self.pictures.variant(resize: '1000x1000').processed
  end

  private
    def only_user_id
      understanding.presence or problem.presence or pictures.attached?
    end

    def validate_pictures
      if pictures.attached?
        if !pictures.content_type.in?(%('image/jpeg image/jpg image/png image/gif'))
          errors.add(:pictures, 'はjpeg, jpg, png, gif以外の投稿ができません')
        elsif pictures.blob.byte_size > 5.megabytes
          errors.add(:pictures, "のサイズが5MBを超えています")
        end
      end
    end
end
