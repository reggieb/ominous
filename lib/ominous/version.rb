module Ominous
  VERSION = "0.0.5"
end

# History
# =======
# 
# 0.0.5
# -----
# Moved text decoration of warnings and closers to models. 
# 
# Upgrading to this version requires a migration:
# 
#     rake ominous:install:migrations
#     rake db:migrate
# 
# In use, the separation of text (in translations) from the warning objects was 
# confusing. It proved difficult for users to create new warning, and match them 
# to translations.
# 
# By using a more standard arrangement, translation options can be added to the
# host app, where all text output can be handled the same way, and therefore
# users will be familiar with the process of updating text.
# 
# 0.0.4
# -----
# First working version. No history before this version.
#
