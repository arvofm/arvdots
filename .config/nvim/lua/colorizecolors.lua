-----------------------
-- colorize the colors
-- by arvo
-----------------------

local colorizer = require('colorizer')

colorizer.setup {
    filetypes = { "*"; }
}

-- Attach to buffer
colorizer.attach_to_buffer(0, { mode = "virtualtext", css = true})

