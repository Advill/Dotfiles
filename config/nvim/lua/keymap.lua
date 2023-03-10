-- Referenced from @KyleLaker
local function map(mode, lhs, rhs, opts)
  local options = {}-- noremap = true, silent = true }
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

-- tab and shift tab between tabs
map('n', '<Tab>', function ()
  local cmd = '<Cmd>'
  if vim.bo.filetype == 'neo-tree' then
    cmd = cmd .. 'Neotree buffers'
  else
    cmd = cmd .. ':tabnext<CR>'
  end
  return cmd .. '<CR>'
end, {expr = true, desc = 'Next tab'})

map('n', '<S-Tab>', function ()
  local cmd = '<Cmd>';
  if vim.bo.filetype == 'neo-tree' then
    cmd = cmd .. 'Neotree filesystem'
  else
    cmd = cmd .. ':tabprevious<CR>'
  end
  return cmd .. '<CR>'
end, {expr = true, desc = 'Previous tab'})
map('n', '<Leader>t', ':tabnew<CR>', {desc = 'Create a new tab'})
map('n', '<Leader>c', ':tabclose<CR>', {desc = 'Close current tab'})

-- Keep Selection after indent change
map('v', '<', '<gv')
map('v', '>', '>gv')
