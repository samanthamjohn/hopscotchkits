class KitsController < ApplicationController

  def index
    @kits = Kit.published
    @programs = Program.featured.order('updated_at DESC').limit(6)
  end
end
