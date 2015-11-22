
#loop for 10
#doors = [false, false, false]

# doors[rand(0..2)] = true

 #print doors 1 2 3
#end

def chk_win(guess, doors)
  true if doors[guess]
  false
end


### switch win ###


switch_win = 0
1000000.times do

  doors = [false,false,false]
  doors[rand(0..2)] = true

  guess = rand(0..2)

while 1
  host = rand(0..2)
  if host != guess
    if doors[host] != true
      break
    end
  end
end

while 1
  switch = rand(0..2)
  if switch != guess and switch != host
      break
  end
end



switch_win = switch_win + 1 if doors[switch] == true

puts switch_win

end 







### stay win ###

staywin = 0
1000000.times do

  doors = [false,false,false]
  doors[rand(0..2)] = true

  guess = rand(0..2)

while 1
  host = rand(0..2)
  if host != guess
    if doors[host] != true
      break
    end
  end
end

staywin = staywin + 1 if doors[guess] == true

puts staywin

end
