module Ominous
  VERSION = "0.1.2"
end

# History
# =======
#
# 0.1.2
# -----
# Fixes bug where close_and_dismiss_warning closure url was relative to root ('/')
# which causes error is host app is in sub-uri. Url is now absolute rather than
# relative.
#
# 0.1.1
# -----
# Fix bug where trying to humanize the name to create a title cause an error
# because the name was absent
# 
# 0.1.0
# -----
# Move to beta
# 
# Rename ominous helper methods to remove likelihood of method clashes in
# host app. 
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
