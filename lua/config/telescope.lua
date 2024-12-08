local telescope = require("telescope.builtin")
local telescope_last = 0

local function telescope_resume()
  if telescope_last == 0 then
    telescope_last = 1
    telescope.live_grep()
  else
    telescope.resume()
  end
end

vim.keymap.set("n", " f", telescope_resume)
