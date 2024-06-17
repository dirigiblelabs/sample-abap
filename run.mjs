import { logging } from "sdk/log";
import { initializeABAP } from './output/init.mjs';
import { zcl_hello_world } from './output/zcl_hello_world.clas.mjs';
import { DirigibleDatabaseClient } from "./DirigibleDatabaseClient";

const logger = logging.getLogger("run.mjs");

function initDefaultDataSource() {
    logger.info("Init default data source for ABAP...");
    abap.context.databaseConnections["DEFAULT"] = new DirigibleDatabaseClient();
    logger.info("Default data source for ABAP was initialized");
}

initDefaultDataSource();
await initializeABAP();

// a workaround for https://github.com/abaplint/transpiler/issues/1441
// manually register the table
abap.DDIC.EMPLOYEES = {
    "objectType": "TABL",
    "type": {
        "value": {
            "offset": {
                "value": 0,
                "qualifiedName": "I"
            },
            "length": {
                "value": 0,
                "qualifiedName": "I"
            }
        },
        "qualifiedName": "employees",
        "ddicName": "employees",
        "suffix": {},
        "asInclude": {}
    },
    "keyFields": ["id"]
};

await zcl_hello_world.run();

