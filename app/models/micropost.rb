class Micropost < ApplicationRecord
  belongs_to :user
  has_one_attached :picture
  has_many :comments, dependent: :destroy
  has_many :micropost_tag_relationships, dependent: :destroy
  has_many :tags, through: :micropost_tag_relationships
  default_scope { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :understanding, length: { maximum: 1000 }
  validates :problem, length: { maximum: 1000 }
  validates :only_user_id, presence: true
  validate :validate_picture
  validates :tag_ids, presence: true

  def resize_picture
    return self.picture.variant(resize: '1000x1000').processed
  end

  private
    def only_user_id
      understanding.presence or problem.presence or picture.attached?
    end

    def validate_picture
      if picture.attached?
        if !picture.content_type.in?(%('image/jpeg image/jpg image/png image/gif'))
          errors.add(:picture, 'はjpeg, jpg, png, gif以外の投稿ができません')
        elsif picture.blob.byte_size > 5.megabytes
          errors.add(:picture, "のサイズが5MBを超えています")
        end
      end
    end
end
