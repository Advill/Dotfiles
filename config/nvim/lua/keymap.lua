-- Referenced from @KyleLaker
local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end
_G.map = map

-- Better movement between panes
map('n', '<C-j>', '<C-W>j', {desc = 'Move cursor one pane to the left'})
map('n', '<C-k>', '<C-W>k', {desc = 'Move cursor one pane down'})
map('n', '<C-h>', '<C-W>h', {desc = 'Move cursor one pane up'})
map('n', '<C-l>', '<C-W>l', {desc = 'Move cursor one pane to the left'})

-- tab and shift tab between buffers
map('n', '<Tab>', ':bn<CR>', {desc = 'Next Buffer'})
map('n', '<S-Tab>', ':bp<CR>', {desc = 'Previous Buffer'})

-- Keep Selection after indent change
map('v', '<', '<gv')
map('v', '>', '>gv')

-- center screen on search
