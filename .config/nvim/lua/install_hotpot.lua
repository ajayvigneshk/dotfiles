-- packer
local hotpot_path = vim.fn.stdpath('data')..'/site/pack/packer/start/hotpot.nvim'
-- paq
-- local hotpot_path = vim.fn.stdpath('data')..'/site/pack/paqs/start/hotpot.nvim'

-- You can automatically install hotpot if it is missing (i.e for fresh
-- nvim setups). Don't forget to add hotpot to your package manager or
-- it may uninstall hotpot!
if vim.fn.empty(vim.fn.glob(hotpot_path)) > 0 then
  print("Could not find hotpot.nvim, cloning new copy to", hotpot_path)
  vim.fn.system({'git', 'clone','--depth','1',
                 'https://github.com/rktjmp/hotpot.nvim', hotpot_path})
end
