local opts = { noremap = true, silent = true }
local function jump_back_to_original_buffer(original_buffer) --{{{
  local current_buffer = vim.api.nvim_get_current_buf()

  if current_buffer ~= original_buffer then
    -- jump back to the original buffer
    vim.cmd([[normal! ]])
  else
    -- jump back to the original line
    vim.cmd([[normal! ]])
  end
end --}}}

----------------------------
-- TODO: add these shortcut into whichkey
vim.keymap.set("n", "zf", "<cmd>HopChar1CurrentLine<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "zw", "<cmd>HopWordCurrentLine<cr>", { noremap = true, silent = true })
-- vim.keymap.set("n", "za", "<cmd>HopAnywhereCurrentLine<cr>", { noremap = true, silent = true }) --redundant + conflict with neorg, use zf
----------------------------
vim.keymap.set("n", "zhh", "<cmd>HopLineStart<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>zhh", "<cmd>HopLineStartMW<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "zhs", "<cmd>HopLineStart<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>zhs", "<cmd>HopLineStartMW<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "zhl", "<cmd>HopLine<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "zha", "<cmd>HopAnywhere<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "zhv", "<cmd>HopVerticalcr>", { noremap = true, silent = true })
-- selective hop
vim.keymap.set("n", "zhw", "<cmd>HopWord<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "zhc", "<cmd>HopChar1<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "zcc", "<cmd>HopChar2<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "z/", "<cmd>HopPattern<cr>", { noremap = true, silent = true })

--TODO: HopMW for across window hop (add w after z?)

--------------------------------
-- hop to create new line
-- hop -> create 1 under
-- note: vo -> vho | vO -> vhu
-- vim.keymap.set("n", "vhu", function()
-- 	vim.cmd([[:HopLineStart]])
-- 	vim.schedule(function()
-- 		vim.cmd([[normal! o]])
-- 		vim.cmd([[startinsert]])
-- 	end)
-- end, opts)
-- hop -> create 2 under 
-- vim.keymap.set("n", "<Leader>vhu", function()
vim.keymap.set("n", "zhu", function()
  vim.cmd([[:HopLineStart]])
  vim.schedule(function()
    vim.cmd([[normal! o]])
    vim.cmd([[normal! o]])
    vim.cmd([[startinsert]])
  end)
end, opts)

-- hop -> create 1 over 
-- vim.keymap.set("n", "vho", function()
-- 	vim.cmd([[:HopLineStart]])
-- 	vim.schedule(function()
-- 		vim.cmd([[normal! O]])
-- 		-- vim.cmd([[normal! O]])
-- 		vim.cmd([[startinsert]])
-- 	end)
-- end, opts)
-- hop -> create 2 over 
-- vim.keymap.set("n", "<Leader>vho", function()
vim.keymap.set("n", "zho", function()
  vim.cmd([[:HopLineStart]])
  vim.schedule(function()
    vim.cmd([[normal! O]])
    vim.cmd([[normal! O]])
    vim.cmd([[startinsert]])
  end)
end, opts)

-- SECTION: Hyper Yank
-- NOTE: Hyper Yank with Treesitter Node Select
vim.keymap.set("n", "yx", function()
  local original_buffer = vim.api.nvim_get_current_buf()

  vim.cmd([[:HopLineStartMW]]) --> jump to line
  vim.schedule(function()
    require("syntax-tree-surfer").select()
    vim.cmd([[normal! V]]) --> go to visual selection mode -> optional
    vim.cmd([[normal! y]]) --> yank
    jump_back_to_original_buffer(original_buffer)
  end)
end, opts)

-- NOTE: Hyper Yank a line
vim.keymap.set("n", "yl", function()
  local original_buffer = vim.api.nvim_get_current_buf()

  vim.cmd([[:HopLineStartMW]]) --> jump to line
  vim.schedule(function()
    vim.cmd([[normal! yy]]) --> yank the line
    jump_back_to_original_buffer(original_buffer)
  end)
end, opts)

-- NOTE: Hyper Yank Treesitter Code Block
vim.keymap.set("n", "yc", function()
  local original_buffer = vim.api.nvim_get_current_buf()
  vim.cmd([[:HopLineStartMW]])
  vim.schedule(function()
    require("tsht").nodes()
    vim.schedule(function()
      vim.cmd([[normal! V]]) --> go to visual selection mode -> optional
      vim.cmd([[normal! y]]) --> yank
      jump_back_to_original_buffer(original_buffer)
    end)
  end)
end, opts)

-- NOTE: Using nvim-treehopper to yank
vim.keymap.set("n", "ym", function()
  require("tsht").nodes()
  vim.schedule(function()
    vim.cmd([[normal! V]]) --> go to visual selection mode
    vim.cmd([[normal! y]]) --> yank
  end)
end, opts)

--SECTION: Hyper Paste
--note: vp -> vpu | vP -> vpo (paste under/over)

vim.keymap.set("n", "vpu", function()
  vim.cmd([[:HopLineMW]]) --note: changed HopLineStartMW to just HopLineMW
  vim.schedule(function()
    vim.cmd([[normal! p]]) --> paste
  end)
end, opts)
vim.keymap.set("n", "<Leader>vpu", function()
  vim.cmd([[:HopLineStartMW]])
  vim.schedule(function()
    vim.cmd([[normal! o]]) --> make new line below target
    vim.cmd([[normal! o]]) --> make another new line below target
    vim.cmd([[normal! p]]) --> paste
  end)
end, opts)

vim.keymap.set("n", "vpo", function()
  vim.cmd([[:HopLineStartMW]])
  vim.schedule(function()
    vim.cmd([[normal! P]]) --> paste
  end)
end, opts)
vim.keymap.set("n", "<Leader>vpo", function()
  vim.cmd([[:HopLineStartMW]])
  vim.schedule(function()
    vim.cmd([[normal! O]]) --> make another new line below target
    vim.cmd([[normal! P]]) --> paste
  end)
end, opts)
