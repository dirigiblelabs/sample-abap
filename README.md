# sample-abap
ABAP sample backed by open-abap

Prerequisites: [NodeJs](https://nodejs.org/) 16+

## Running unit tests
1. `npm install`
2. `npm test`

Transpiled javascript files are located in folder `output`

## Running in Dirigible
1. Select project, right click -> `Actions`

![Actions](images/abap-actions.png?raw=true "Actions")

2. Select `build` -> Execute and wait until it finishes successfully

![Build](images/abap-build.png?raw=true "Actions")
![Build](images/abap-built.png?raw=true "Actions")

3. Refresh workspace - should appear `dist` folder with a single `run.js` file in it

![Build](images/abap-refresh.png?raw=true "Actions")
![Build](images/abap-transpiled.png?raw=true "Actions")

4. Publish project

![Build](images/abap-publish.png?raw=true "Actions")

5. Select run.mjs from the `dist` folder and see `hello world` prinited in the console

![Build](images/abap-result.png?raw=true "Actions")

You can change the ABAP source file `src/zcl_hello_world.clas.abap` and repeate the steps above.

![Build](images/abap-code.png?raw=true "Actions")

