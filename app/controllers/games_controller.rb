class GamesController < ApplicationController
  before_action :set_game, only: %i[ show edit update destroy invite]

  # GET /games or /games.json
  def index
    games = Game.all.order(created_at: :desc)
    if params[:date_between].present?
      starts, ends = params[:date_between].split(" - ")
      start_date = Date.strptime(starts, "%m/%d/%Y")
      end_date = Date.strptime(ends, "%m/%d/%Y")
      @games = games.where("starts_at >= ? AND ends_at <= ?", start_date, end_date)
    elsif params[:search].present?
      @games = games.where("description ILIKE ?", "%#{params[:search]}%")
    else
      @games = games
    end
  end

  # GET /games/1 or /games/1.json
  def show
    respond_to do |format|
      format.html
      format.ics do
        send_data Games::IcalendarEvent.new(game: @game).call, filename: "#{@game.title}.ics"
      end
    end
  end

  # GET /games/new
  def new
    @game = Game.new
  end

  # GET /games/1/edit
  def edit
  end

  # POST /games or /games.json
  def create
    @game = Game.new(game_params)

    respond_to do |format|
      if @game.save
        format.html { redirect_to game_url(@game), notice: "Game was successfully created." }
        format.json { render :show, status: :created, location: @game }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /games/1 or /games/1.json
  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to game_url(@game), notice: "Game was successfully updated." }
        format.json { render :show, status: :ok, location: @game }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1 or /games/1.json
  def destroy
    @game.destroy

    respond_to do |format|
      format.html { redirect_to games_url, notice: "Game was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def invite
    GameMailer.with(game: @game).invite.deliver_now
    redirect_to game_url(@game), notice: "Game was successfully invited."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def game_params
      params.require(:game).permit(:starts_at, :ends_at, :title, :description, :address)
    end
end
