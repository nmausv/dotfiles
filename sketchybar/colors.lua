return {
  -- crust
  -- black = 0xff181819,
  black = 0xff11111b,
  -- rosewater
  -- white = 0xffe2e2e3,
  white = 0xfff5e0dc,
  -- red
  -- red = 0xfffc5d7c,
  red = 0xfff38ba8,
  -- green
  -- green = 0xff9ed072,
  green = 0xffa6e3a1,
  -- blue
  -- blue = 0xff76cce0,
  blue = 0xff89b4fa,
  -- yellow
  -- yellow = 0xffe7c664,
  yellow = 0xfff9e2af,
  -- peach
  -- orange = 0xfff39660,
  orange = 0xfffab387,
  -- mauve
  -- magenta = 0xffb39df3,
  magenta = 0xffcba6f7,
  -- text
  -- grey = 0xff7f8490,
  grey = 0xffcdd6f4,
  -- unchanged
  transparent = 0x00000000,

  bar = {
    -- base
    -- bg = 0xf02c2e34,
    bg = 0xfa1e1e2e,
    -- crust
    -- border = 0xff2c2e34,
    border = 0xff11111b
  },
  popup = {
    -- mantle
    -- bg = 0xc02c2e34,
    bg = 0xff181825,
    -- crust
    -- border = 0xff7f8490
    border = 0xff11111b
  },
  -- surface 0
  bg1 = 0xfa313244,
  -- surface 0
  bg2 = 0xfa313244,

  with_alpha = function(color, alpha)
    if alpha > 1.0 or alpha < 0.0 then return color end
    return (color & 0x00ffffff) | (math.floor(alpha * 255.0) << 24)
  end,
}
