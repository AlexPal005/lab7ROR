class HelloController < ApplicationController
  def index
    @baggages = Baggage.all
  end
end