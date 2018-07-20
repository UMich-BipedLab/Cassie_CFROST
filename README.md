# Cassie Gait Library Optimization using C-FROST

This repository contains an example using C-FROST to generate a library of walking gaits for Cassie series robot. The code depends on [FROST](https://github.com/ayonga/frost-dev) and [C-FROST](https://github.com/UMich-BipedLab/C-Frost). The Cassie model used in this example can be found [here](https://github.com/UMich-BipedLab/Cassie_Model). These dependant packages are also included as [git submodules](https://git-scm.com/book/en/v2/Git-Tools-Submodules) for convenience. 

# Download #

To download this example with submodules, run:

``` shell
cd ~
git clone --recursive git@github.com:UMich-BipedLab/Cassie_CFROST.git
```

After download, you should set up [FROST](https://github.com/ayonga/frost-dev) and [C-FROST](https://github.com/UMich-BipedLab/C-Frost) accordingly. For more information, see
  * [FROST Installation](https://ayonga.github.io/frost-dev/pages/installation.html)
  * [C-FROST Installation](https://github.com/UMich-BipedLab/C-Frost/blob/master/INSTALLATION.md)


# Generate necessary functions #

To run the optimization using C-FROST, first needs to set up the problem in MATLAB using FROST and generate all required functions. In this example, we put functions for system dynamics into a separate directory, and compile them as a static library that can be linked to the main optimization problem. This way, you do not need to re-compile these functions every time after you change the optimization constraints.

## Generate functions for system dynamics ##

First, run [`gen_lib.m`](https://github.com/UMich-BipedLab/Cassie_CFROST/blob/master/Cassie_Example/cassie_dynamics_library/gen_lib.m) script in MATLAB. This process may take a while to finish. By default, we drop the velocity terms ($C(q)\dot{q}$) from the dynamics equation. To include them, set `OMIT_CORIOLIS` to `false` in `gen_lib.m` script, and re-run the script. After successfully run the script in matlab, you should find three new directories, `src`, `include`, and `mex`. 

In terminal, run the following to compile the static library:
``` shell
cd ~/Cassie_CFROST/Cassie_Example/cassie_dynamics-library
mkdir build
cd build
cmake ..
make -j4
make install
```

The last command will move the compiled library `libcassie_dynamics.a` to the `lib` folder.


## Generate other functions and optimization configuration files ##

Next, run [`cassie_opt.m`](https://github.com/UMich-BipedLab/Cassie_CFROST/blob/master/Cassie_example/opt_two_step/cassie_opt.m) script in MATLAB to generate other functions and configuration files. This script should create two folders:

* `gen`: export and compile MEX binaries used for FROST in MATLAB (you can run the optimization in MATLAB as before)
* `periodic`: export all functions and configuration files required for C-FROST.

For detailed process of generating these files, please refer to the comments in the script.

## Compile C-FROST program ##

In terminal
```shell
cd ~/Cassie_CFROST/Cassie_Example/opt_two_step/periodic/c_code
mkdir build
cd build
cmake ..
make -j4
make install
cd ..
```

This will compile the C-FROST optimization problem to an executable called `program` in the folder `periodic/c_code`. To run the program, run:

```shell
./program --initial 'res/init.json' --options '../ipopt.opt' --data 'res/data.json' --bounds 'res/bounds.json' --solution '../local/output/sol.json'
```
The input arguments are:
* --initial: the JSON file that stores the initial guess of the optimization
* --options: the option file (with extension `.opt`) for IPOPT
* --data: the JSON file that describe the problem structure
* --bounds: the JSON file that stores boundary values of optimization variables and constraints
* --solution: the output file to export the optimization results (structured data, more information)
* --output: another output file to export the optimization results (just the vector of solution from IPOPT)

C-FROST will export the optimization results to the specified JSON file. This can be easily imported to MATLAB to further analyze the optimal gait. A simple example of loading this file, see [`analyze_solution.m`](https://github.com/UMich-BipedLab/Cassie_CFROST/blob/master/Cassie_example/opt_two_step/analyze_solution.m).

# Run multiple gait optimization #
