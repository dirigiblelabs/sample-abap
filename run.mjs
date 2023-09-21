import { initializeABAP } from './output/init.mjs';
import { zcl_hello_world } from './output/zcl_hello_world.clas.mjs';

//console.log("Initialize ABAP runtime");
await initializeABAP();

//console.log("Call ABAP");
await zcl_hello_world.run();