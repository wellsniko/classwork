class Api::PokemonController < ApplicationController
    def index
        @pokemon = Pokemon.all
        render :index
    end

    def show
        @pokemon = Pokemon.find(params[:id])
        render :show
    end


    def pokemon_params
        params.require(:pokemon).permit(:name, :attack, :defense, :poke_type, :image_url)
    end
end

# ring "name", null: false
#     t.integer "attack", null: false
#     t.integer "defense", null: false
#     t.string "poke_type", null: false
#     t.string "image_url", null: false