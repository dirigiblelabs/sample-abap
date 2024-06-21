import { DatabaseInitializer } from "sdk/abap/database";
import { initializeABAP } from '../dist/abap/init.mjs';

import { zcl_abap_app } from '../dist/abap/zcl_abap_app.clas.mjs';
import { zcl_employee_dao } from '../dist/abap/zcl_employee_dao.clas.mjs';

async function initialize() {
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
}

async function runABAPCode() {
    await zcl_abap_app.run();
}

await initialize();

await runABAPCode();

async function useDAO() {
    console.log("Getting all employees...");
    const employees = zcl_employee_dao.select_all();
    console.log("All employees: " + JSON.stringify(employees));

    console.log("Done");
}

await useDAO();
