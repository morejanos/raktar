module ApplicationHelper

  def user_logged_in_msg
    str = ''
    if user_signed_in?
        str += '<li>' + "#{link_to(" Kijelentkezés", destroy_user_session_path, {:method => :delete, :class => 'glyphicon glyphicon-log-out'} )}}" + '</li>'
    else
        str += '<li>' + "#{link_to(' Regisztrálás', new_user_registration_path, {class: 'glyphicon glyphicon-user'})}" + '</li>'
        str += '<li>' + "#{link_to(' Bejelentkezés', new_user_session_path, {class: 'glyphicon glyphicon-log-in'})}" + '</li>'
    end
    raw(str)
  end

  def nav_items
	  	[
			{
			 displaytext: 'Raktár készlet',
			 controllername: 'components',
			 linkurl: components_path
			},
			{
			 displaytext: 'Alkatrész típusok',
			 controllername: 'componenttypes',
			 linkurl: componenttypes_path
			},
			{
			 displaytext: 'Gyártók',
			 controllername: 'manufacturers',
			 linkurl: manufacturers_path
			},
			{
			 displaytext: 'Tokozások',
			 controllername: 'packagings',
			 linkurl: packagings_path
			}
		]
	end

	def display_nav_item(displaytext, controllername, linkurl)
		raw("<li#{controller_name == controllername ? ' class="active"' : ''}>#{link_to displaytext, linkurl}</li>")
	end

  def site_name
    "Raktár nyilvántartó"
  end

  def site_url
    if Rails.env.production?
    # Place your production URL in the quotes below
    "http://192.168.1.119:3000"
    else
    # Our dev & test URL
    "http://localhost:3000"
    end
  end

  def meta_author
    "MMVILL kft."
  end

  def programmer_name
    "More Softwares"
  end

  def meta_description
    "Készlet nyilvántartó"
  end

  def meta_keywords
    # Change the value below between the quotes.
    "Add your keywords here"
  end

  # Returns the full title on a per-page basis.
  # No need to change any of this we set page_title and site_name elsewhere.
  def full_title(page_title)
    if page_title.empty?
      site_name
    else
      "#{page_title} | #{site_name}"
    end
  end  

end
