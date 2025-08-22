{ _ }:
{
  plugins = {
    lsp-format = {
      enable = false;
    };
    lsp = {
      enable = true;
      inlayHints = false;
      servers = {
        clangd = {
          enable = true;
          autostart = true;
          cmd = [
            "clangd"
            "--clang-tidy"
            #"--inlay-hints"
            "--background-index"
            "--completion-style=detailed"
            "--function-arg-placeholders=true"
            "--all-scopes-completion"
            "--cross-file-rename"
            "--header-insertion-decorators"
            "--header-insertion=never"
            "--limit-results=10"
            "--pch-storage=memory"
            "--suggest-missing-includes"
          ];
        };
        cmake = {
          enable = true;
        };
        dts_lsp = {
          enable = false;
          package = null;
        };
        bashls = {
          enable = true;
          autostart = false;
        };
      };
      keymaps = {
        silent = true;
        lspBuf = {
          gd = {
            action = "definition";
            desc = "Goto Definition";
          };
          gr = {
            action = "references";
            desc = "Goto References";
          };
          gD = {
            action = "declaration";
            desc = "Goto Declaration";
          };
          gI = {
            action = "implementation";
            desc = "Goto Implementation";
          };
          gT = {
            action = "type_definition";
            desc = "Type Definition";
          };
          K = {
            action = "hover";
            desc = "Hover";
          };
          "<leader>cw" = {
            action = "workspace_symbol";
            desc = "Workspace Symbol";
          };
          "<leader>cr" = {
            action = "rename";
            desc = "Rename";
          };
        };
        diagnostic = {
          "<leader>cd" = {
            action = "open_float";
            desc = "Line Diagnostics";
          };
          "[d" = {
            action = "goto_next";
            desc = "Next Diagnostic";
          };
          "]d" = {
            action = "goto_prev";
            desc = "Previous Diagnostic";
          };
        };
      };
    };
  };
  extraConfigLua = ''
    	local _border = "rounded"

    	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
    		vim.lsp.handlers.hover, {
    			border = _border
    		}
    	)

    	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
    		vim.lsp.handlers.signature_help, {
    			border = _border
    		}
    	)

    	vim.diagnostic.config {
    		float = { border = _border }
    	};

    	require('lspconfig.ui.windows').default_options = {
    		border = _border
    	}

    	'';
}
