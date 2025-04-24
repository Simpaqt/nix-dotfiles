-- Save this as a separate file to test completion functionality
-- ~/.config/nvim/lua/debug-completion.lua

local M = {}

-- Function to verify nvim-cmp is working
M.test_completion_setup = function()
  local has_cmp, cmp = pcall(require, 'cmp')
  if not has_cmp then
    print("ERROR: nvim-cmp is not installed or loaded!")
    return false
  end

  print("✓ nvim-cmp is installed")
  
  -- Check required sources
  local sources = {
    "cmp-buffer",
    "cmp-path",
    "cmp-cmdline"
  }
  
  local all_sources_loaded = true
  for _, source in ipairs(sources) do
    local ok = pcall(require, source)
    if not ok then
      print("ERROR: " .. source .. " is not installed or failed to load!")
      all_sources_loaded = false
    else
      print("✓ " .. source .. " is installed")
    end
  end
  
  if not all_sources_loaded then
    return false
  end
  
  -- Test cmdline source setup
  local cmdline_setup_ok = pcall(function()
    cmp.setup.cmdline('/', {})
  end)
  
  if not cmdline_setup_ok then
    print("ERROR: Failed to setup cmdline completion for '/'")
    return false
  end
  
  print("✓ Cmdline setup successful")
  
  -- Test if completion is triggered
  print("All tests passed. Try typing '/' followed by a few characters in normal mode.")
  print("If completions still don't appear, try the following:")
  print("1. Open a file with some content")
  print("2. Type '/' and then a few letters that should match content in the file")
  print("3. If no completion shows, press <C-Space> to manually trigger")
  
  return true
end

-- Function to enable debug logs
M.enable_debug = function()
  vim.g.cmp_debug = true
  vim.cmd([[
    lua require('cmp').setup({ debug = true })
    let g:cmp_log_path = expand('~/cmp.log') 
    let g:cmp_trace_path = expand('~/cmp-trace.log')
  ]])
  print("Debugging enabled. Log files will be at ~/cmp.log and ~/cmp-trace.log")
end

-- Export the module
return M
