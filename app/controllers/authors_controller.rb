class AuthorsController < ApplicationController
	def index
	  @authors = Author.all
	end
	def new
	  @author = Author.new
	end
	def create
	  @author = Author.new(strong_params(:name, :birth_year))
		if @author.save
			redirect_to @author
		else
			render :new
		end
	end
	def show
	  @author = get_instance
	end
	def edit
	  @author = get_instance
	end
	def update
		# TODO: Add validation before (or during?) running the update.
		author = get_instance
		author.update(strong_params(:name, :birth_year))
		redirect_to author
	end

	private

	def strong_params(*args)
		params.require(:author).permit(*args)
	end
	def get_instance
		Author.find(params[:id])
	end

end
