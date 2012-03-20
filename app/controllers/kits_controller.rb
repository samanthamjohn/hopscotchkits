class KitsController < ApplicationController

  def index
    @kits = Kit.published
    @programs = Program.featured.limit(6)
  end
end
