class Article < ApplicationRecord
    belongs_to :user
    belongs_to :category
    has_one :content, class_name: 'ActionText::RichText', as: :record
    has_rich_text :content
    has_one_attached :image
    has_many :comments
end
