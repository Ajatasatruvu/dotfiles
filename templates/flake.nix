{
  description = "my flake templates";

  outputs = { ... }: {
    templates = {
      cDev = {
        path = ./c;
        description = "c dev environment";
      };
      kotlinDev = {
        path = ./kotlin;
        description = "kotlin dev environment";
      };
      pyDev = {
        path = ./python;
        description = "python dev enivronment";
      };
    };
  };
}
