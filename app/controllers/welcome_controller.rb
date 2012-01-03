class WelcomeController < ApplicationController
  def index
    @body_class="homepage"
  end

  def about
    @body_class="about"
  end
end
