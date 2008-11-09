# dependencies are generated using a strict version, don't forget to edit the dependency versions when upgrading.
merb_gems_version = "1.0"
dm_gems_version   = "0.9.6"

# For more information about each component, please read http://wiki.merbivore.com/faqs/merb_components
#dependency "merb-action-args", merb_gems_version
dependency "merb-assets", merb_gems_version  
#dependency "merb-cache", merb_gems_version   
dependency "merb-helpers", merb_gems_version 
#dependency "merb-mailer", merb_gems_version  
dependency "merb-slices", merb_gems_version  
#dependency "merb-auth-core", merb_gems_version
#dependency "merb-auth-more", merb_gems_version
#dependency "merb-auth-slice-password", merb_gems_version
dependency "merb-param-protection", merb_gems_version
dependency "merb-exceptions", merb_gems_version
 
dependency "dm-core", dm_gems_version         
dependency "dm-aggregates", dm_gems_version   
dependency "dm-migrations", dm_gems_version   
dependency "dm-timestamps", dm_gems_version   
dependency "dm-types", dm_gems_version        
dependency "dm-validations", dm_gems_version  



# #dependency "merb-action-args", "0.9.9"   # Provides support for querystring arguments to be passed in to controller actions
# dependency "merb-assets", "0.9.9"        # Provides link_to, asset_path, auto_link, image_tag methods (and lots more)
# #dependency "merb-cache", "0.9.9"         # Provides your application with caching functions 
# dependency "merb-helpers", "0.9.9"       # Provides the form, date/time, and other helpers
# #dependency "merb-mailer", "0.9.9"        # Integrates mail support via Merb Mailer
# dependency "merb-slices", "0.9.9"        # Provides a mechanism for letting plugins provide controllers, views, etc. to your app
# #dependency "merb-auth", "0.9.9"          # An authentication slice (Merb's equivalent to Rails' restful authentication)
#  
# dependency "dm-core", "0.9.6"         # The datamapper ORM
# dependency "dm-aggregates", "0.9.6"   # Provides your DM models with count, sum, avg, min, max, etc.
# dependency "dm-migrations", "0.9.6"   # Make incremental changes to your database.
# dependency "dm-timestamps", "0.9.6"   # Automatically populate created_at, created_on, etc. when those properties are present.
# dependency "dm-types", "0.9.6"        # Provides additional types, including csv, json, yaml.
# dependency "dm-validations", "0.9.6"  # Validation framework
