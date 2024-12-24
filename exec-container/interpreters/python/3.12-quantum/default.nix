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
  pkgs.writeShellScriptBin "python3.12-quantum" "exec ${python-modified}/bin/python $@"
  // {
    traojudge = {
      name = "Python3.12-quantum";
      binName = "python3.12-quantum";
      compile = "cp \"$SRC\" \"$DIST\"";
      run = "exec ${python-modified}/bin/python \"$DIST\"";
      libraries = [
        {
          name = "qiskit";
          version = "1.2.4";
        }
        {
          name = "numpy";
          version = "2.1.3";
        }
        {
          name = "scipy";
          version = "1.14.1";
        }
        {
          name = "networkx";
          version = "3.4.2";
        }
        {
          name = "sympy";
          version = "1.13.3";
        }
        {
          name = "sortedcontainers";
          version = "2.4.0";
        }
        {
          name = "more-itertools";
          version = "10.5.0";
        }
        {
          name = "shapely";
          version = "2.0.6";
        }
        {
          name = "bitarray";
          version = "3.0.0";
        }
        {
          name = "pulp";
          version = "2.9.0";
        }
        {
          name = "mpmath";
          version = "1.3.0";
        }
        {
          name = "pandas";
          version = "2.2.3";
        }
        {
          name = "z3-solver";
          version = "4.13.3.0";
        }
        {
          name = "scikit-learn";
          version = "1.5.2";
        }
      ];
    };
  }
