using { db } from '../db/schema';

service AuditService {

  @readonly
  entity AuditLogs as projection on db.AuditLogs;

}