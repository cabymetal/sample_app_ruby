class Resume < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :file_url, presence: true
  mount_uploader :file_url, AttachmentUploader
  
  def self.search(search)
    if search
      where('file_url LIKE ?', "%#{search}%")
    else
      all
    end
  end
end
