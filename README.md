
# Adding benchmark
1. Create a separate directory for your benchmark. Ideally it should contain the fallowing files
    - `test.bal` containing the ballerina source file to test
    - `bench.sh` run the benchmark
2. Update the `Makefile` so that it knows how to build and run the benchmark
## Adding simple benchmarks
- If you program is just a single ballerina file that needs to be compiled using the new and current packs and performance runtime compared you can fallow the fallowing steps.
    - Example `helloworld`
    1. Create a separate directory for the test.
       - If you name this as `foo` then the command to run the benchmark is `make foo`
    2. Create a `test.bal` file with the source code.
       - Our `bench.sh` file expect the source to be named precisely `test.bal`
    3. Create a symbolic link to the `bench.sh` benchmark driver in the you directory
       `ln -s ../bench.sh bench.sh`
    4. Update the `Makefile` in the root directory of the project
       1. Use the `bechmark` macro to create the build target
       ```make
        $(eval $(call benchmark,foo))
       ```
       2. Add it to the `.PHONY` targets
## Adding simple http benchmark
- If your program is a simple server that takes a http request on fixed port and return a response and you want to measure statistics such as throughput and latency (we are using [ab](https://httpd.apache.org/docs/2.4/programs/ab.html) for this) you can create the benchmark as fallows
  - Example `httpLoop`
  1. Similar to simple benchmark create the benchmark directory and `test.bal` file
  2. For this we need to use the `httpBench.sh` benchmark runner
```bash
    ln -s ../httpBench.sh bench.sh
```
    - NOTE: it expect your endpoint to be `http://localhost:8290/test1/data`

  3. Create a `req.json` file that has the request you want to send to the server
  4. Similar to simple benchmark update the Makefile
