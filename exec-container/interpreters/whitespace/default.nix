{pkgs}: let
  uv2nix = pkgs.uv2nix;
  pyproject-nix = pkgs.pyproject-nix;

  workspace = uv2nix.lib.workspace.loadWorkspace {workspaceRoot = ./.;};

  overlay = workspace.mkPyprojectOverlay {
    sourcePreference = "wheel";
  };

  pyprojectOverrides = _final: _prev: {
    # Implement build fixups here.
  };

  python = pkgs.python312;

  pythonSet =
    (pkgs.callPackage pyproject-nix.build.packages {
      inherit python;
    })
    .overrideScope
    (pkgs.lib.composeExtensions overlay pyprojectOverrides);
  python-modified = pythonSet.mkVirtualEnv "whitespace-env" workspace.deps.default;
in
  pkgs.writeShellScriptBin "whitespace" "exec ${python-modified}/bin/python -m whitespace $@"
