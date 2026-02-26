using AuditService from './audit-service';
service ComplianceAnalyticsService {

  @readonly
  entity ComplianceMetrics as select from AuditService.AuditLogs {

      key 'METRICS' as ID : String,

      count(ID) as totalEvents : Integer,

      sum(case when operation = 'CREATE' then 1 else 0 end)
          as totalCreates : Integer,

      sum(case when operation = 'UPDATE' then 1 else 0 end)
          as totalUpdates : Integer,

      sum(case when operation = 'DELETE' then 1 else 0 end)
          as totalDeletes : Integer,

      max(changedAt) as lastActivity : Timestamp,

      case
          when sum(case when operation = 'DELETE' then 1 else 0 end) = 0
              then 'LOW'
          when sum(case when operation = 'DELETE' then 1 else 0 end) <= 3
              then 'MEDIUM'
          else 'HIGH'
      end as dangerLevel : String

  };
}