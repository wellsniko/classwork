json.array! @guests do |guest|
    
    json.partial! 'guest', guest: guest
    
    # json.name guest.name
    # json.age guest.age
    # json.favorite_color guest.favorite_color


    
    
end





# #what they did in the demo, i think we have our guests array
# @teas.each do |tea|
#   json.set! tea.id do
#     # json.id tea.id
#     # json.flavor tea.flavor
#     # json.amount tea.amount

#     # json.extract! tea, :id, :flavor, :amount
    
#     json.partial! 'tea', tea: tea
#   end
# end