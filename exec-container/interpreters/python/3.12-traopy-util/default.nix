{pkgs}: let
  uv2nix = pkgs.uv2nix;
  pyproject-nix = pkgs.pyproject-nix;

  # Load a uv workspace from a workspace root.
  # Uv2nix treats all uv projects as workspace projects.
  workspace = uv2nix.lib.workspace.loadWorkspace {workspaceRoot = ./.;};

  # Create package overlay from workspace.
  overlay = workspace.mkPyprojectOverlay {
    # Prefer prebuilt binary wheels as a package source.
    # Sdists are less likely to "just work" because of the metadata missing from uv.lock.
    # Binary wheels are more likely to, but may still require overrides for library dependencies.
    sourcePreference = "wheel"; # or sourcePreference = "sdist";
    # Optionally customise PEP 508 environment
    # environ = {
    #   platform_release = "5.10.65";
    # };
  };

  # Extend generated overlay with build fixups
  #
  # Uv2nix can only work with what it has, and uv.lock is missing essential metadata to perform some builds.
  # This is an additional overlay implementing build fixups.
  # See:
  # - https://adisbladis.github.io/uv2nix/FAQ.html
  pyprojectOverrides = _final: _prev: {
    # Implement build fixups here.
  };

  # Use Python 3.12 from nixpkgs
  python = pkgs.python312;

  # Construct package set
  pythonSet =
    # Use base package set from pyproject.nix builders
    (pkgs.callPackage pyproject-nix.build.packages {
      inherit python;
    })
    .overrideScope
    (pkgs.lib.composeExtensions overlay pyprojectOverrides);
  python-modified = pythonSet.mkVirtualEnv "hello-world-env" workspace.deps.default;
in
  pkgs.writeShellScriptBin "python-traopy-util-v0" "exec ${python-modified}/bin/python $@"