return {
  {
    'Shatur/neovim-session-manager',
    config = function() 
      local path = require('plenary.path')
      local config = require('session_manager.config')
      require('session_manager').setup({
        sessions_dir = path:new(vim.fn.stdpath('data'), 'sessions'),
        session_filename_to_dir = session_filename_to_dir,
        dir_to_session_filename = dir_to_session_filename,
        autoload_mode = config.AutoloadMode.LastSession,
        autosave_last_session = true,
        autosave_ignore_not_normal = true,
        autosave_ignore_dirs = {},
        autosave_ignore_filetypes = {
          'gitcommit',
          'gitrebase',
        },
        autosave_ignore_buftypes = {},
        autosave_only_in_session = false,
        max_path_length = 80,
      })
    end,
  }
}
