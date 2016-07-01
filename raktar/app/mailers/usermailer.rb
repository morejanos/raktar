class Usermailer < ApplicationMailer
    def criticalNrOfPieces_email(component)
        @component = component
        p = Permission.find_by name: 'poweruser'
       
	recipients = Array.new

        p.users.each do |user|
       	    recipients.push(user.email)	
        end

        mail(to: recipients , subject: "Raktarkeszlet fogyoban")

    end
end
