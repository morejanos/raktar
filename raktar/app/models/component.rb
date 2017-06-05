class Component < ActiveRecord::Base
    belongs_to :componenttype
    belongs_to :packaging
    belongs_to :manufacturer
    belongs_to :user

    has_attached_file :image, styles: { original: "300x300>", thumb: "80x80>" }
    validates_attachment :image,
        content_type: { content_type: ["image/jpeg", "image/gif", "image/png"]},
        size: { in: 0..1024.kilobytes }

    validates :name, presence: true
    validates :componenttype, presence: true
    validates :user_id, presence: true
    validates :inventory, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    validates :criticalNrOfPieces, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

    scope :stock, -> { where("inventory > 0") }

    def self.search(search, type)

        if !search.nil? && !search.empty?
          if !type.nil? && !type.empty?
            found = self.where("componenttype_id = ?", "#{type}")
            found = found.where("name REGEXP ? OR partnumber REGEXP ? OR inductivity REGEXP ? OR power REGEXP ? OR voltage REGEXP ? OR current REGEXP ? OR resistance REGEXP ? OR dimension REGEXP ? OR temperature REGEXP ? OR capacity REGEXP ? OR location REGEXP ?", "#{search}", "#{search}", "#{search}", "#{search}", "#{search}", "#{search}", "#{search}", "#{search}", "#{search}", "#{search}", "#{search}")
          else
            found = self.where("name REGEXP ? OR partnumber REGEXP ? OR inductivity REGEXP ? OR power REGEXP ? OR voltage REGEXP ? OR current REGEXP ? OR resistance REGEXP ? OR dimension REGEXP ? OR temperature REGEXP ? OR capacity REGEXP ? OR location REGEXP ?", "#{search}", "#{search}", "#{search}", "#{search}", "#{search}", "#{search}", "#{search}", "#{search}", "#{search}", "#{search}", "#{search}")

          end
        else
          if !type.nil? && !type.empty?
            found = where("componenttype_id = ?", "#{type}")
          end
        end

        found||all
    end

    def to_s
        name
    end

    def self.to_csv(options = {})
        CSV.generate(options) do |csv|
            csv << column_names

            all.each do |component|
                csv << component.attributes.values_at(*column_names)
            end
        end
    end
end


