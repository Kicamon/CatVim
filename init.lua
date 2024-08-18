local version = require('utils.version')

if version then
  print('Please make sure your nvim version 0.10+.')
  os.exit(0)
end

local function init_nvim_config_template()
  local have_nvim = io.popen('[ -d "$HOME/.config/nvim" ] && echo "have" || echo "not"')
  if have_nvim and have_nvim:read('*l') == 'have' then
    os.execute('mv $HOME/.config/nvim $HOME/.config/nvim-backup')
    have_nvim:close()
  end
  os.execute('cp -rf ./modules/template $HOME/.config/nvim')
end

init_nvim_config_template()
