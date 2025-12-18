return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {
          settings = {
            python = {
              pythonPath = "/opt/bb/bin/python3.13",
              analysis = {
                typeCheckingMode = "basic",
              },
            },
          },
        },
      },
    },
  },
}

