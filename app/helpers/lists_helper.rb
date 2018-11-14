module ListsHelper
  
  def currently_registered_to(list)
    return "(Currently registered to #{list.registered_site.site_url})" if list.registered_site
  end

end