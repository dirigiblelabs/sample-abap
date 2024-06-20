import { initializeABAP } from './dist/abap/init.mjs';
import { zcl_hello_world } from './dist/abap/zcl_hello_world.clas.mjs';
import { DatabaseInitializer } from "sdk/abap/database";

DatabaseInitializer.initDefaultDataSource();
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

