class StaticController < ApplicationController
  def home
    @greeting = "hello there!"
  end
end
