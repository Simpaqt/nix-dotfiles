{pkgs, lib, ...}:

{
programs.helix = {
  enable = true;
  settings = {
    theme = "tokyonight_storm";
    editor.cursor-shape = {
      normal = "block";
      insert = "bar";
      select = "underline";
    };
  };
  languages.language = [{
    name = "nix";
    auto-format = true;
    formatter.command = "${pkgs.nixfmt}/bin/nixfmt";
  }];
  themes = {
    autumn_night_transparent = {
      "inherits" = "tokyonight_storm";
      "ui.background" = { };
    };
  };
};
}
