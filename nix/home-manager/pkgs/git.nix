{ config, pkgs, ...}:

{
  programs.git = {
    enable = true;
    userName = "****";
    userEmail = "****";

    ignores = [ 
      ".DS_Store"
      ".tags"
      "*.vim"
     ];

     extraConfig = {
       core = {
         editor = "nvim";
       };
       pull = {
         rebase = "true";
       };
       diff = { # Overrides merge.tool value
         tool = "nvimdiff";
       };
       difftool = {
         nvimdiff = {
           cmd = "nvim -R -d -c \"wincmd l\" -d \"$LOCAL\" \"$REMOTE\"";
         };
       };
       mergetool = {
         nvimdiff = {
           cmd = "nvim -d -c \"wincmd w | wincmd J\" \"$LOCAL\" \"$BASE\" \"$REMOTE\" \"$MERGED\"";
         };
       };
     };
  };
}
