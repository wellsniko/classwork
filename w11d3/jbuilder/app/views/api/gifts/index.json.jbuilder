json.array! @gifts do |gift|
    
    json.partial! 'gift', gift: gift
    
    # json.name guest.name
    # json.age guest.age
    # json.favorite_color guest.favorite_color


    
    
end
