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


proc display() =
  bxy.beginFrame(window.size)

  bxy.drawImage("heart", vec2(60, 20))

  bxy.endFrame()
  window.swapBuffers()

while not window.closeRequested:
  display()
  pollEvents()
