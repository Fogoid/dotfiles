return {
    {
      "kndndrj/nvim-dbee",
      dependencies = {
        "MunifTanjim/nui.nvim",
      },
      build = function()
        -- Install tries to automatically detect the install method.
        -- if it fails, try calling it with one of these parameters:
        --    "curl", "wget", "bitsadmin", "go"
        require("dbee").install()
      end,
      config = function()
        require("dbee").setup({
            sources = {
                require("dbee.sources").MemorySource:new({
                    {
                        name = "egrc_diogofernandes",
                        url = "developer:@tcp(10.101.2.100)/egrc_diogofernandes",
                        type = "mysql",
                    },
                    {
                        name = "eapi_diogofernandes",
                        url = "developer:@tcp(10.101.2.100)/eapi_diogofernandes",
                        type = "mysql",
                    },
                }),
            },
        })
      end,
      keys = {
          { "<leader>dbo", function() require("dbee").open() end },
          { "<leader>dbc", function() require("dbee").close() end },
          { "<leader>dbt", function() require("dbee").toggle() end },
      },
    },
}
