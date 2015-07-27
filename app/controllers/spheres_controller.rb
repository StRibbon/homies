class SpheresController < ApplicationController
  def index
    @spheres = Sphere.all
  end

  def show
  end
end
