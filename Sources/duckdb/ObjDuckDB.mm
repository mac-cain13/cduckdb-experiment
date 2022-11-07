//
//  DuckDB.mm
//  
//
//  Created by Mathijs Kadijk on 07/11/2022.
//

#import "ObjDuckDB.h"
#import "duckdb.hpp"

@implementation DuckDB

- (void)foo {
    duckdb::DuckDB db(nullptr);
    duckdb::Connection con(db);
    
    // create a table
    con.Query("CREATE TABLE integers(i INTEGER, j INTEGER)");

    // insert three rows into the table
    con.Query("INSERT INTO integers VALUES (3, 4), (5, 6), (7, NULL)");

    duckdb::unique_ptr<duckdb::MaterializedQueryResult> result = con.Query("SELECT * FROM integers");
    if (!result->success) {
        assert(false);
    }
    
    result->Print();
}

@end
