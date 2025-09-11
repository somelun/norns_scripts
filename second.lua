-- study 2
-- code exercise
-- ways of seeing

engine.name = "PolyPerc"

function init()
  engine.release(3)
  notes = {}
  selected = {}
  
  for m = 1, 5 do
    notes[m] = {}
    selected[m] = {}
    for n = 1, 5 do
      notes[m][n] = 55 * 2^((m * 12 + n * 2) / 12)
      selected[m][n] = false
    end
  end
  light = 0
  number = 3
end

function redraw()
  screen.clear()
  for m = 1, 5 do
    for n = 1, 5 do
      screen.rect(0.5 + m * 9, 0.5 + n * 9, 6, 6) -- (x,y,width,height)
      l = 2
      if selected[m][n] then
        l = l + 3 + light
      end
      screen.level(l)
      screen.stroke()
    end
  end
  screen.move(10, 60)
  screen.text(number)
  screen.update()
end

function key(n,z)
  if n == 2 and z == 1 then
    for x = 1, 5 do
      for y = 1, 5 do
        selected[x][y] = false
      end
    end
    for i = 1,number do
      selected[math.random(5)][math.random(5)] = true
    end
  elseif n == 3 then
    if z == 1 then
      for x = 1, 5 do
        for y = 1, 5 do
          if selected[x][y] then
            engine.hz(notes[x][y])
          end
        end
      end
      light = 7
    elseif z == 0 then
      light = 0
    end
  end
  redraw()
end

function enc(n,d)
  if n == 3 then
    number = util.clamp(number + d, 1, 4)
  end
  redraw()
end
