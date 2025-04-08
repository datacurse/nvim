{
  pkgs ? import <nixpkgs> {}
  , nixCats ? builtins.fetchGit {
    url = "https://github.com/BirdeeHub/nixCats-nvim";
  }
  , ...
}: let
  # get the nixCats library with the builder function (and everything else) in it
  utils = import nixCats;
  # path to your new .config/nvim
  luaPath = ./.;
  # see :help nixCats.flake.outputs.categories
  categoryDefinitions = { pkgs, settings, categories, extra, name, mkNvimPlugin, ... }@packageDef: {
    lspsAndRuntimeDeps = {
      general = with pkgs; [
        lua-language-server
        stylua
        nixd
        alejandra
        man
        lazygit
        ghostscript
        # python3Packages.pylatexenc
        (texlive.combine {
          inherit (texlive) scheme-medium
            standalone
            varwidth
            preview
            multirow;
        })
      ];
    };
    # This is for plugins that will load at startup without using packadd:
    startupPlugins = {
      general = with pkgs.vimPlugins; [
        snacks-nvim
        # (mkNvimPlugin "snacks.nvim" (builtins.fetchGit {
        #   url = "https://github.com/folke/snacks.nvim";
        #   rev = "bc0630e43be5699bb94dadc302c0d21615421d93"; 
        # }))
        vim-sleuth
        mini-nvim
        nvim-lspconfig
        vim-startuptime
        blink-cmp
        nvim-treesitter.withAllGrammars
        lualine-nvim
        lualine-lsp-progress
        gitsigns-nvim
        which-key-nvim
        nvim-lint
        conform-nvim
        nvim-dap
        nvim-dap-ui
        nvim-dap-virtual-text
        catppuccin-nvim
        render-markdown-nvim
        noice-nvim
        img-clip-nvim
        grug-far-nvim
# Add nvim-prose using mkNvimPlugin and fetchFromGitHub
    # (mkNvimPlugin "nvim-prose" (pkgs.fetchFromGitHub {
    #   owner = "skwee357";
    #   repo = "nvim-prose";
    #   rev = "38aac8c9c94a5725d152bdfea374d60e07fb93d6";
    #   sha256 = pkgs.lib.fakeSha256; # Will fail and show correct hash to use
    # }))
      ];
    };
    # not loaded automatically at startup.
    # use with packadd and an autocommand in config to achieve lazy loading
    optionalPlugins = {
      general = with pkgs.vimPlugins; [
        lazydev-nvim
      ];
    };
  };
  # see :help nixCats.flake.outputs.packageDefinitions
  packageDefinitions = {
    nvim = {pkgs , mkNvimPlugin, ... }: {
      settings = {
        aliases = [ "n" ];
        wrapRc = false;
        unwrappedCfgPath = "/home/loki/.config/nvim";
      };
      categories = {
        general = true;
      };
      extra = {};
    };
  };
  # We will build the one named nvim here and export that one.
  defaultPackageName = "nvim";
in utils.baseBuilder luaPath { inherit pkgs; } categoryDefinitions packageDefinitions defaultPackageName
