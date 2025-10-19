return {
  {
    "mrcjkb/rustaceanvim",
    version = "^6",
    lazy = false,
    ft = { "rust" },
    config = function()
      vim.g.rustaceanvim = {
        server = {
          on_attach = function(client, bufnr)
            vim.keymap.set("n", "<leader>cR", "<cmd>RustRunnables<CR>", { buffer = bufnr, desc = "Rust Runnables" })
            vim.keymap.set("n", "<leader>ct", "<cmd>RustTest<CR>", { buffer = bufnr, desc = "Run Tests" })
            vim.keymap.set("n", "<leader>cc", "<cmd>RustCheck<CR>", { buffer = bufnr, desc = "Cargo Check" })
            vim.keymap.set("n", "<leader>cr", "<cmd>RustRun<CR>", { buffer = bufnr, desc = "Cargo Run" })
          end,
          settings = {
            ["rust-analyzer"] = {
              checkOnSave = {
                command = "clippy",
              },
              cargo = {
                buildScripts = {
                  enable = true,
                },
              },
              inlayHints = {
                enable = true,
                parameterHints = true,
                typeHints = true,
              },
            },
          },
        },
      }
    end,
  },
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "nvim-neotest/nvim-nio",  -- 添加 nvim-nio 依赖
    },
    config = function()
      local dap = require("dap")
      dap.adapters.codelldb = {
        type = "server",
        port = "${port}",
        executable = {
          command = "codelldb",
          args = { "--port", "${port}" },
        },
      }
      dap.configurations.rust = {
        {
          name = "Launch",
          type = "codelldb",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
        },
      }
      require("dapui").setup()
      require("nvim-dap-virtual-text").setup()
    end,
  },
}
