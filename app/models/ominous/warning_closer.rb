require 'acts_as_list'
module Ominous
  class WarningCloser < ActiveRecord::Base
    attr_accessible :warning_id, :closer_id, :position
    
    belongs_to :closer
    belongs_to :warning
    
    acts_as_list :scope =>  :warning
    
    validates_uniqueness_of :closer_id, :scope => :warning_id
  end
end
