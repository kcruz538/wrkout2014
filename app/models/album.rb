class Album < ActiveRecord::Base
  acts_as_taggable
  include PgSearch
  pg_search_scope :search,
                  against: [:name, :description],
                  using: {
                    tsearch: {dictionary: "english"}
                  }

  validates :name, :photo, presence: true

  mount_uploader :photo, PhotoUploader
end
