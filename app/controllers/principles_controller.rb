class PrinciplesController < InheritedResources::Base
  before_filter :authenticate_user!
  #t.string   "name"
  #t.text     "description"
end
