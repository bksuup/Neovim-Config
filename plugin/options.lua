local opt = vim.opt

-- Yanking in NVIM goes to the system clipboard --
opt.clipboard = "unnamedplus"

opt.inccommand = "split"

opt.smartcase = true
opt.ignorecase = true
opt.hlsearch = true

opt.number = true
opt.relativenumber = true

opt.splitbelow = true
opt.splitright = true

opt.signcolumn = "yes"
opt.shada = { "'10", "<0", "s10", "h" }

opt.swapfile = false

opt.wrap = true
opt.linebreak = true

opt.tabstop = 4
opt.shiftwidth = 4

opt.scrolloff = 8

opt.more = false

opt.foldmethod = "manual"

opt.title = true
opt.titlestring = '%t%( %M%)%( (%{expand("%:~:h")})%)%a (nvim)'

opt.undofile = true
