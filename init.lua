local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

local require_plugins = function()
	require("packer").startup(function(use)
		use("wbthomason/packer.nvim")
		use("ldelossa/nvim-ide")
	end)
end

local setup = function()
	require("ide").setup({})
end

local bootstrap = function()
	fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
	vim.cmd([[packadd packer.nvim]])
	require_plugins()
	vim.cmd("PackerSync")
    vim.api.nvim_create_autocmd("User", {
        pattern = "PackerComplete",
        callback = setup
    })
end

if fn.empty(fn.glob(install_path)) > 0 then
    bootstrap()
else
	require_plugins()
    setup()
end

