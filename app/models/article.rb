class Article < ApplicationRecord
    belongs_to :user
    has_one :content, class_name: 'ActionText::RichText', as: :record
    has_rich_text :content
    has_one_attached :image
end
