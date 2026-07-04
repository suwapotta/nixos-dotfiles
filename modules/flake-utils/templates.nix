let
  mkTemplate = dirName: description: {
    inherit description;
    path = ../../devshells + "/${dirName}";
  };
in

{
  c = mkTemplate "c" "C devshell";
  cpp = mkTemplate "cpp" "C++ devshell";
  latex = mkTemplate "latex" "LaTeX devshell";
  motion-canvas = mkTemplate "motion-canvas" "Motion Canvas devshell";
  octave = mkTemplate "octave" "GNU Octave devshell";
  python = mkTemplate "python" "Python devshell";
  typst = mkTemplate "typst" "Typst devshell";
  verilog = mkTemplate "verilog" "SystemVerilog devshell";
}
