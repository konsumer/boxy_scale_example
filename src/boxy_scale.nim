import boxy, opengl, windy

let windowSize = ivec2(320, 240)

let window = newWindow("Boxy Example", windowSize)
makeContextCurrent(window)

loadExtensions()

let bxy = newBoxy()

let image = newImage(320, 240)

image.fillPath(
  """
    M 20 60
    A 40 40 90 0 1 100 60
    A 40 40 90 0 1 180 60
    Q 180 120 100 180
    Q 20 120 20 60
    z
  """,
  parseHtmlColor("#FC427B").rgba
)
bxy.addImage("heart", image) 

let ratio = windowSize.x / windowSize.y
var scale = 1.0
var offset = vec2(0, 0)

var fX:float
var fY:float

window.onFrame = proc() =
  fX = float(window.size.x)
  fY = float(window.size.y)
  if float(window.size.x) > (fY * ratio):
    scale = window.size.y / windowSize.y
    offset.x = (fX - (float(windowSize.x) * scale)) / 2
    offset.y = 0
  else:
    scale = window.size.x / windowSize.x
    offset.y = (fY - (float(windowSize.y) * scale)) / 2
    offset.x = 0

  bxy.beginFrame(window.size)
  bxy.saveTransform()
  bxy.translate(offset)
  bxy.scale(scale)
  
  bxy.drawRect(rect(vec2(0, 0), windowSize.vec2), color(0.3, 0.3, 0.3, 1))
  bxy.drawImage("heart", vec2(0, 0))
  
  bxy.restoreTransform()
  bxy.endFrame()
  window.swapBuffers()

while not window.closeRequested:
  pollEvents()
