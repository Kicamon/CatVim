local function get_version()
  local result = io.popen('nvim -v')
  if not result then
    print('Please make sure you have nvim installed.')
    os.exit(0)
  end
  local version_info = result:read('*l')
  result:close()
  return version_info
end

local function check_version(version)
  local pattern = 'v(%d+%.%d+%.%d+)'
  local extracted_version = string.match(version, pattern)
  if extracted_version >= '0.10.0' then
    return false
  end
  return true
end

print('Welcome to CatVim!')
print('')

return check_version(get_version())
