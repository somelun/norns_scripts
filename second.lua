-- study 2
-- code exercise
-- ways of seeing

engine.name = "PolySub"

function init()
  level = 3
  number = 84
  mode = 0
end

function redraw()
  screen.clear()
  if mode == 0 then
    screen.level(level)
    screen.font_face(10)
    screen.font_size(20)
    screen.move(0,50)
    screen.text("number: " .. number)
    screen.update()
  elseif mode == 1 then
    screen.move(0,20)
    screen.text("WILD")
    screen.aa(1)
    screen.line_width(2)
    screen.move(60,30)
    screen.line(80,40)
    screen.line(90,10)
    screen.close()
    screen.stroke()
    screen.update()
  end
end

function key(n,z)
  if n == 3 then
    mode = z
  else
    level = 3 + z * 12
  end
  redraw()
end

function enc(n,d)
  number = number + d
  redraw()
end
