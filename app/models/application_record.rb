class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  include PgSearch
  pg_search_scope :search_any_word,
                  :against => :text,
                  :using => {
                    :tsearch => {:any_word => true}
                  }
  pg_search_scope :search_all_words,
                  :against => :text
end
