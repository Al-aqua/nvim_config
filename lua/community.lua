-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.docker" },
  { import = "astrocommunity.pack.svelte" },
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.tailwindcss" },
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.colorscheme.nightfox-nvim" },
  { import = "astrocommunity.colorscheme.kanagawa-nvim" },
  { import = "astrocommunity.colorscheme.everforest" },
  { import = "astrocommunity.colorscheme.rose-pine" },
  { import = "astrocommunity.colorscheme.nordic-nvim" },
  { import = "astrocommunity.colorscheme.eldritch-nvim" },
  { import = "astrocommunity.colorscheme.aurora" },
  { import = "astrocommunity.colorscheme.gruvbox-baby" },
  { import = "astrocommunity.colorscheme.oldworld-nvim" },
  { import = "astrocommunity.colorscheme.horizon-nvim" },
  { import = "astrocommunity.colorscheme.oxocarbon-nvim" },
  { import = "astrocommunity.colorscheme.miasma-nvim" },
  { import = "astrocommunity.colorscheme.bamboo-nvim" },
  { import = "astrocommunity.colorscheme.bamboo-nvim" },
  -- { import = "astrocommunity.completion.codeium-vim" },
  { import = "astrocommunity.completion.supermaven-nvim" },
  { import = "astrocommunity.editing-support.undotree" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.cpp" },
  { import = "astrocommunity.pack.cmake" },
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.zig" },
  { import = "astrocommunity.pack.hyprlang" },
  { import = "astrocommunity.pack.sql" },
  { import = "astrocommunity.pack.laravel" },

  -- import/override with your plugins folder
}
