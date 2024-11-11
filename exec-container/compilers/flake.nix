{
  inputs = {
    myBrainfuck = {
      url = "./brainfuck";
    };
    myGolang = {
      url = "./golang";
    };
  };

  outputs = {
    myGolang,
    myBrainfuck,
    ...
  }: {
    all = {pkgs, ...}: [
      (myGolang.drv {inherit pkgs;})
      (myBrainfuck.drv {inherit pkgs;})
    ];
  };
}
