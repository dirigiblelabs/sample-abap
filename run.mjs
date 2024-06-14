import { initializeABAP } from './output/init.mjs';
import { zcl_hello_world } from './output/zcl_hello_world.clas.mjs';

import { DirigibleDatabaseClient } from "./DirigibleDatabaseClient";

function initDefaultDataSource() {
    console.log("!!! Init default data source for ABAP...");
    abap.context.databaseConnections["DEFAULT"] = new DirigibleDatabaseClient();
    console.log("!!! Default data source for ABAP was initialized");
}
initDefaultDataSource();
await initializeABAP();

await zcl_hello_world.run();

