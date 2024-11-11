{
  inputs = {
    myBash.url = "./bash";
    myPython311.url = "./python/3.11";
    myPython312.url = "./python/3.12";
    mySed.url = "./sed";
  };

  outputs = {
    self,
    myBash,
    myPython311,
    myPython312,
    mySed,
    ...
  }: {
    all = {pkgs}: [
      (myBash.drv {inherit pkgs;})
      (myPython311.drv {inherit pkgs;})
      (myPython312.drv {inherit pkgs;})
      (mySed.drv {inherit pkgs;})
    ];
  };
}
