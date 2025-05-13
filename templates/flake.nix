{
  description = "my flake templates";

  outputs = { ... }: {
    templates = {
      cDev = {
        path = ./c;
        description = "c dev environment";
      };
    };
  };
}
