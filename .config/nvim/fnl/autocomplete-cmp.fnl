(fn update-lspserver-config [config]
  (let [capabilities (vim.lsp.protocol.make_client_capabilities)
        updated_capabilities
        ((. (require :cmp_nvim_lsp) :default_capabilities) capabilities)]
    (tset config :capabilities updated_capabilities)
    config))
{: update-lspserver-config}
