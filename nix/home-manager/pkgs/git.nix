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
     };
  };
}
