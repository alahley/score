class PlayerController < ApplicationController
  def index
    @players = Player.all
  end
  
  def new
    @player = Player.new
  end
  
  def create
    @player = Player.new(params[:player])
    if @player.save
      @players = Player.all
      render "index"
    else
      render "new"
    end
  end
  
  def update
    player = Player.find(params[:player][:id])
    new_score = params[:player][:score].to_i + player.score.to_i
    player.update_attributes(score: new_score)

    @players = Player.all
    render "index"
  end

  def destroy
    player = Player.find(params[:id])
    player.destroy

    @players = Player.all
    render "index"
  end
    
end
