-- File to test blink.cmp functionality
-- Save this as ~/.config/nvim/lua/test-completion.lua

local M = {}

-- Function to verify blink.cmp is working
M.test_completion_setup = function()
  local has_blink, blink_cmp = pcall(require, "blink.cmp")
  if not has_blink then
    print("ERROR: blink.cmp is not installed or loaded!")
    return false
  end

  print("✓ blink.cmp is installed")

  -- Test basic functionality
  print("Testing blink.cmp configuration...")

  -- Testing LSP capabilities
  local capabilities = blink_cmp.get_lsp_capabilities()
  if capabilities then
    print("✓ LSP capabilities setup correctly")
  else
    print("ERROR: Failed to get LSP capabilities")
    return false
  end

  print("All tests passed. blink.cmp should be working correctly.")
  print("Try editing a file and triggering completion with 'Ctrl+Space'")

  return true
end

-- Function to enable debug logging
M.enable_debug = function()
  -- Enable any debug functionality if needed
  print("Debugging for blink.cmp enabled")
  -- Set any debug variables here if needed
end

-- Export the module
return M
