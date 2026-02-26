using { db } from '../db/schema';

service HRService {

  @odata.draft.enabled
  entity Employees as projection on db.Employees;

  entity SalaryRecords as projection on db.SalaryRecords;

}