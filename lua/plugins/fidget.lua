if true then
  return {}
end

return {
  {
    "j-hui/fidget.nvim",
    branch = "legacy",
    config = function ()
      require"fidget".setup{}
    end
  }
}
