-- packer
local packer_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(packer_path)) > 0 then
  print("Could not find packer.nvim, cloning new copy to", packer_path)
  vim.fn.system({'git', 'clone', '--depth', '1',
                 'https://github.com/wbthomason/packer.nvim', packer_path})
end
