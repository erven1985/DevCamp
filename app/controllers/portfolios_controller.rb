class PortfoliosController < ApplicationController
	
	def index
		@portfolio_items = Portfolio.all
	end

	def new 
		@portfolio = Portfolio.new
	end

	def create 
		@portfolio = Portfolio.create(portfolio_params)
		respond_to do |format|
      if @portfolio.save
        format.html { redirect_to portfolios_path, notice: 'Your portfolio item is now life.' }

      else
        format.html { render :new }
      end
    end
	end

	def edit 
		@portfolio = Portfolio.find(params[:id])
	end

	def update
		@portfolio = Portfolio.find(params[:id])
    respond_to do |format|
      if @portfolio.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully updated.' }
        format.json { render :show, status: :ok, location: @portfolio }
      else
        format.html { render :edit }
        format.json { render json: @portfolio.errors, status: :unprocessable_entity }
      end
    end
  end

  def show 
    @portfolio = Portfolio.find(params[:id])
  end

  def destroy 
    @portfolio = Portfolio.find(params[:id])
    @portfolio.destroy
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Record was removed.' }
    end
  end

	private
    
    def portfolio_params
      params.require(:portfolio).permit(:title, :subtitle, :body, :main_image, :thumb_image)
    end
end
