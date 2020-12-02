json.extract! @pokemon, :id, :name, :attack, :defense, :poke_type

json.image_url asset_path("pokemon_snaps/#{@pokemon.image_url}")

json.poke_moves do  #display items:
    @pokemon.poke_moves.each do |poke_move| 
        json.set! poke_move.id do 
            json.extract! poke_move, :id, :pokemon_id, :move_id
        end
    end
end   

json.moves do  #display items:
    @pokemon.moves.each do |move| 
        json.set! move.id do 
            json.extract! move, :id, :name
        end
    end
end   

json.items do  #display items:
    @pokemon.items.each do |item| 
        json.set! item.id do 
            json.extract! item, :id, :pokemon_id, :name, :price, :happiness
            json.image_url asset_path(item.image_url)
        end
    end
end

    # t.integer "pokemon_id", null: false
    # t.string "name", null: false
    # t.integer "price", null: false
    # t.integer "happiness", null: false
    # t.string "image_url", null: false