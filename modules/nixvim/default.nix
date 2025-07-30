{
  imports = [ ./bufferline.nix ./colors/paradise.nix ];

  config = {
    theme = "paradise";
    extraConfigLua = ''
      _G.theme = "paradise"
    '';
  };
}
