import { DB } from "sample-abap/node_modules/@abaplint/runtime/build/src";

import { database, sql, update, query } from "sdk/db";

import { logging } from "sdk/log";


export class DirigibleDatabaseClient implements DB.DatabaseClient {

  private readonly logger;

  public readonly name = "dirigible-default-database";

  public constructor() {
    this.logger = logging.getLogger("org.eclipse.dirigible.DirigibleDatabaseClient");
    this.logger.info("Initializing...")
  }

  public async connect() {
    // @ts-ignore
    if (abap?.context?.databaseConnections && abap.context.databaseConnections["DEFAULT"] === this) {
      // @ts-ignore
      abap.builtin.sy.get().dbsys?.set(this.name);
    }
    this.logger.debug("Connected.");
  }

  public async disconnect() {
    this.logger.debug("Disconnect is not applicable for this client.");
  }

  public async execute(sql: string | string[]): Promise<void> {

    if (typeof sql !== "string") {
      for (const s of sql) {
        await this.execute(s);
      }
      return;
    }

    if (sql === "") {
      return;
    }
    let connection = database.getConnection("DefaultDB");
    this.logger.debug("Executing sql [{}]", sql);

    try {
      const statement = connection.createStatement();
      const hasResultSet = statement.execute(sql);
      if (hasResultSet) {
        this.logger.debug("Executed sql [{}] has result set.", sql);
      }
    } finally {
      connection.close();
    }
  }


  public async beginTransaction() {
    return; // todo
  }

  public async commit() {
    return; // todo
  }

  public async rollback() {
    return; // todo
  }

  public async delete(options: DB.DeleteDatabaseOptions) {
    let sqlDelete = sql.getDialect()//
      .delete()//
      .from(options.table)//
      .build();

    sqlDelete = sqlDelete + ` WHERE ${options.where}`;
    return this.executeUpdate(sqlDelete);
  }

  public async update(options: DB.UpdateDatabaseOptions) {
    let sqlUpdate = sql.getDialect()//
      .update()//
      .table(options.table)//
      .build();

    sqlUpdate = sqlUpdate + ` SET ${options.set.join(", ")} WHERE ${options.where}`;
    return this.executeUpdate(sqlUpdate);
  }

  public async insert(options: DB.InsertDatabaseOptions) {
    const insertBuilder = sql.getDialect()//
      .insert()//
      .table(options.table);

    options.columns.forEach((columnName: string, index: number) => {
      const columnValue = options.values[index];
      insertBuilder.column(columnName).value(columnValue);
    });

    const sqlInsert = insertBuilder.build();
    return this.executeUpdate(sqlInsert);
  }

  private executeUpdate(sql: string) {
    this.logger.debug("Executing [{}]...", sql);

    try {
      const affectedRows = update.execute(sql);
      this.logger.debug("Affected [{}] rows by executing [{}]", affectedRows, sql);

      return this.createCRUDResult(affectedRows, 0)
    } catch (error) {
      this.logger.error(`Failed to execute [${sql}]. Error: [${error}]`, error);
      return this.createErrorCRUDResult();
    }
  }

  private createErrorCRUDResult() {
    return this.createCRUDResult(0, 4);
  }

  private createCRUDResult(affectedRows: number, error: number) {
    return {
      dbcnt: affectedRows,
      subrc: error
    }
  }

  public async select(options: DB.SelectDatabaseOptions) {
    let selectSQL = this.convertInputSelect(options.select, options.primaryKey);
    this.logger.debug("Executing select [{}]...", selectSQL);

    try {
      const resultSet = query.execute(selectSQL);
      const selectDatabaseResult = { rows: resultSet };
      this.logger.debug("Result of select [{}]: [{}]", selectSQL, JSON.stringify(selectDatabaseResult));

      return selectDatabaseResult;
    } catch (error) {
      this.logger.error(`Failed to execute [${selectSQL}]. Error: [${error}]`, error);
      // @ts-ignore
      if (abap.Classes["CX_SY_DYNAMIC_OSQL_SEMANTICS"] !== undefined) {
        // @ts-ignore
        throw await new abap.Classes["CX_SY_DYNAMIC_OSQL_SEMANTICS"]().constructor_({ sqlmsg: error.message || "" });
      }
      throw error;
    }
  }

  private convertInputSelect(select: string, primaryKeys: string[] | undefined) {
    let convertedSelect = select.replace(/ UP TO (\d+) ROWS(.*)/i, "$2 LIMIT $1");
    if (primaryKeys) {
      convertedSelect = convertedSelect.replace(/ ORDER BY PRIMARY KEY/i, " ORDER BY " + primaryKeys.join(", "));
    } else {
      convertedSelect = convertedSelect.replace(/ ORDER BY PRIMARY KEY/i, "");
    }
    convertedSelect = convertedSelect.replace(/ ASCENDING/ig, " ASC");
    convertedSelect = convertedSelect.replace(/ DESCENDING/ig, " DESC");
    convertedSelect = convertedSelect.replace(/~/g, ".");

    return convertedSelect;
  }

  public async openCursor(options: DB.SelectDatabaseOptions): Promise<DB.DatabaseCursorCallbacks> {
    // const statement = this.sqlite!.prepare(options.select, null);
    // return {
    //   fetchNextCursor: (packageSize: number) => this.fetchNextCursor.bind(this)(packageSize, statement),
    //   closeCursor: () => this.closeCursor.bind(this)(statement),
    // };
  }

  private async fetchNextCursor(packageSize: number, statement: Statement): Promise<DB.SelectDatabaseResult> {
    // const values: SqlValue[][] = [];

    // while (statement.step()) {
    //   values.push(statement.get());
    //   if (values.length === packageSize) {
    //     return { rows: this.convert([{ columns: statement.getColumnNames(), values }]) };
    //   }
    // }

    // return { rows: [] };
  }

  private async closeCursor(statement: Statement): Promise<void> {
    // statement.free();
  }
}
