class Page < Petrie::Page
  include TheSortableTree::Scopes
  attr_accessor :subtitle

end
