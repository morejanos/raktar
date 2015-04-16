class Component < ActiveRecord::Base
    belongs_to :componenttype
    belongs_to :packaging
    belongs_to :manufacturer
    belongs_to :user

    validates :name, presence: true
    validates :componenttype, presence: true
    validates :user_id, presence: true
    validates :inventory, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
   
    scope :stock, -> { where("inventory > 0") }

    def self.search(search, type)

        if !search.empty?
          if !type.empty?
            found = self.where("componenttype_id = ?", "#{type}")
            found = found.where("name LIKE ? OR partnumber LIKE ? OR inductivity LIKE ? OR power LIKE ? OR voltage LIKE ? OR current LIKE ? OR resistance LIKE ? OR dimension LIKE ? OR temperature LIKE ? OR capacity LIKE ? OR location LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
          else
            found = self.where("name LIKE ? OR partnumber LIKE ? OR inductivity LIKE ? OR power LIKE ? OR voltage LIKE ? OR current LIKE ? OR resistance LIKE ? OR dimension LIKE ? OR temperature LIKE ? OR capacity LIKE ? OR location LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")

          end
        else
          if !type.empty?
            found = where("componenttype_id = ?", "#{type}")
          end
        end

        found||all
    end

    def to_s
        name
    end
end
