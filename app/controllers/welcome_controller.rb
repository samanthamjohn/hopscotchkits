class WelcomeController < ApplicationController
  def index
    @body_class="homepage"
  end

  def products
    @body_class="about"
  end

  def product_detail
    @body_class="about"
    render("welcome/products/#{params[:name]}")
  end

  def about
    @body_class="about"
  end
end
