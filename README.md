# Julia925
Learn Julia in one workday!

If you have *Julia* and *IJulia*-notebooks installed, clone the repo and work local in the notebooks. Otherwise click on the badge below to open a Binder session or check the *installation instructions* below to install *Julia* and *IJulia*-notebooks.

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/MichielStock/Julia925/master)

## Installation instructions
### Installing Julia
1. Download the *Julia* binaries for your system [here](https://julialang.org/downloads/) we suggest to install the Long-term support release, v1.0.5
2. Check the [Platform Specific Instructions](https://julialang.org/downloads/platform.html) of the official website to install *Julia*
3. Yes, it is that simple :zap:

### Installing IJulia
Then run the Julia application
(double-click on it); a window with a `julia>` prompt will appear.  At
the prompt, type:
```julia
using Pkg
Pkg.add("IJulia")
```
to install IJulia.

This process installs a [kernel specification](https://jupyter-client.readthedocs.io/en/latest/kernels.html#kernelspecs) that tells Jupyter (or JupyterLab) etcetera
how to launch Julia.

`Pkg.add("IJulia")` does not actually install Jupyter itself.
You can install Jupyter if you want, but it can also be installed
automatically when you run `IJulia.notebook()` below.  (You
can force it to use a specific `jupyter` installation by
setting `ENV["JUPYTER"]` to the path of the `jupyter` program
before `Pkg.add`, or before running `Pkg.build("IJulia")`;
your preference is remembered on subsequent updates.

### Running the IJulia Notebook
If you are comfortable managing your own Python/Jupyter installation, you can just run `jupyter notebook` yourself in a terminal. To simplify installation, you can alternatively type the following in Julia, at the `julia>` prompt:
```julia
using IJulia
notebook()
```
to launch the IJulia notebook in your browser.

The first time you run `notebook()`, it will prompt you
for whether it should install Jupyter.  Hit enter to
have it use the [Conda.jl](https://github.com/Luthaf/Conda.jl)
package to install a minimal Python+Jupyter distribution (via
[Miniconda](http://conda.pydata.org/docs/install/quick.html)) that is
private to Julia (not in your `PATH`).
On Linux, it defaults to looking for `jupyter` in your `PATH` first,
and only asks to installs the Conda Jupyter if that fails; you can force
it to use Conda on Linux by setting `ENV["JUPYTER"]=""` during installation (see above).  (In a Debian or Ubuntu  GNU/Linux system, install the package `jupyter-client` to install the system `jupyter`.)

[source](https://raw.githubusercontent.com/JuliaLang/IJulia.jl/master/README.md)