namespace db;

using { cuid, managed } from '@sap/cds/common';

entity Employees : cuid, managed {
  employeeId  : String;
  name        : String;
  department  : String;

  salaries : Composition of many SalaryRecords
    on salaries.employee = $self;
}

entity SalaryRecords : cuid, managed {
  employee      : Association to Employees;
  amount        : Decimal(13,2);
  currency      : String;
  effectiveFrom : Date;
}

entity AuditLogs : cuid {
  entityName : String;
  entityID   : UUID;
  operation  : String;
  changedBy  : String;
  changedAt  : Timestamp;
  snapshot   : LargeString;
}