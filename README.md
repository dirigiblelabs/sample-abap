# sample-abap
ABAP sample backed by open-abap

Prerequisites: [NodeJs](https://nodejs.org/) 16+

## Running unit tests
1. `npm install`
2. `npm test`

Transpiled javascript files are located in folder `output`

## Running in Dirigible
1. Click `1-setup.command`
2. Click `2-transpile.command`
3. Click `3-test.command`
4. Click `4-normalize.command`
5. Click `5-bundle.command`
6. Click `6-extract.command`
7. Refresh workspace - should appear project `sample-abap-result`
8. Publish it
9. Select run.mjs

You can change the ABAP source file `src/zcl_hello_world.clas.abap` and repeate the steps 2-9 above.
