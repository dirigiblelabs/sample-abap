# sample-abap
ABAP sample backed by open-abap

Prerequisites: [NodeJs](https://nodejs.org/) 16+

## Running unit tests
1. `npm install`
2. `npm test`

Transpiled javascript files are located in folder `output`

## Running in Dirigible
1. Select project, right click -> `Actions`

<img src="images/abap-actions.png" width="50%">

2. Select `build` -> Execute and wait until it finishes successfully

<img src="images/abap-build.png" width="30%">
<img src="images/abap-built.png" width="30%">

3. Refresh workspace - should appear `dist` folder with a single `run.js` file in it

<img src="images/abap-refresh.png" width="30%">
<img src="images/abap-transpiled.png" width="30%">

4. Publish project

<img src="images/abap-publish.png" width="30%">

5. Select run.mjs from the `dist` folder and see `hello world` prinited in the console

<img src="images/abap-result.png" width="30%">

You can change the ABAP source file `src/zcl_hello_world.clas.abap` and repeate the steps above.

<img src="images/abap-code.png" width="70%">

