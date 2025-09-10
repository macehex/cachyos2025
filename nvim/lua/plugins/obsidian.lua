return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",

  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",
    -- optionals
    "hrsh7th/nvim-cmp", -- for completion
    "nvim-telescope/telescope.nvim", -- for search
    "nvim-treesitter/nvim-treesitter", -- for syntax highlighting
    "epwalsh/pomo.nvim",
    -- see below for full list of optional dependencies 👇
  },
  opts = {
    workspaces = {
      {
        name = "school_notes",
        path = "$HOME/Onedrive/SCHOOL/Current_notes",
      },
    },

    -- see below for full list of options 👇
  },

  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        markdown = {}, -- Empty table disables all linters for markdown files
      },
    },
  },
}
