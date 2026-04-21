let
  mkTemplate = dirName: description: {
    inherit description;
    path = ../../devshells + "/${dirName}";
  };
in

{
  flake.templates = {
    c = mkTemplate "c" "C devshell";
    cpp = mkTemplate "cpp" "C++ devshell";
    motion-canvas = mkTemplate "motion-canvas" "Motion Canvas devshell";
    latex = mkTemplate "latex" "LaTeX devshell";
  };
}
