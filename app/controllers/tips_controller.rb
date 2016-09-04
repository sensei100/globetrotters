class TipsController < ApplicationController

  def index
    @tips = Tip.all
  end

end