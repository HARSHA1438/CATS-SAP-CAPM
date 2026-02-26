const cds = require('@sap/cds')

module.exports = cds.service.impl('ComplianceAnalyticsService', function () {

  this.after('READ', 'ComplianceMetrics', (data) => {

    if (!data) return

    const rows = Array.isArray(data) ? data : [data]

    for (const row of rows) {

      const deletes = row.totalDeletes || 0

      if (deletes === 0) {
        row.dangerLevel = 'LOW'
      } 
      else if (deletes <= 3) {
        row.dangerLevel = 'MEDIUM'
      } 
      else {
        row.dangerLevel = 'HIGH'
      }

    }

  })

})