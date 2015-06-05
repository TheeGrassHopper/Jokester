class JokesController < ApplicationController
	  before_action :set_joke, only: [:show, :edit, :update, :destroy]
	def new
		@joke = Joke.new
	end

  def create
    @joke = Joke.new(joke_params)
    respond_to do |format|
      if @joke_params.save
        format.html { redirect_to @joke_params, notice: 'Joke was successfully created.' }
        format.json { render :show, status: :created, location: @joke_params }
      else
        format.html { render :new }
        format.json { render json: @joke_params.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @joke.update(user_params)
        format.html { redirect_to @joke, notice: 'Joke was successfully updated.' }
        format.json { render :show, status: :ok, location: @joke }
      else
        format.html { render :edit }
        format.json { render json: @joke.errors, status: :unprocessable_entity }
      end
    end
  end

	def edit

	end

	def destroy
		Joke.find(params[:id]).destroy
	end

	def index
		@joke = Joke.all
	end

	def show
		@joke = Joke.new
	end

	private
	def joke_params
		params.require[:joke].permit(:content, :username)
	end
end
