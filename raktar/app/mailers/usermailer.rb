class Usermailer < ApplicationMailer
    def criticalNrOfPieces_email(component)
        @component = component
        p = Permission.find_by name: 'poweruser'
        
        p.users.each do |user|
            mail(to: user.email, subject: "Raktarkeszlet fogyoban")
        end
    end
end
