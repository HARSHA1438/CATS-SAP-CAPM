const cds = require('@sap/cds')

module.exports = cds.service.impl(function () {

  const { SalaryRecords } = this.entities
  const { AuditLogs } = cds.entities('db')

  /* CREATE */
  this.after('CREATE', 'SalaryRecords', async (data, req) => {

    if (data.IsActiveEntity === false) return

    await INSERT.into(AuditLogs).entries({
      entityName: 'SalaryRecords',
      entityID: data.ID,
      operation: 'CREATE',
      changedBy: req.user?.id || 'anonymous',
      changedAt: new Date(),
      snapshot: JSON.stringify(data)
    })

  })

  /* HANDLE UPDATE PROPERLY FOR DRAFT */
  this.after('draftActivate', async (data, req) => {

    if (req.target.name !== 'HRService.SalaryRecords') return

    await INSERT.into(AuditLogs).entries({
      entityName: 'SalaryRecords',
      entityID: data.ID,
      operation: 'UPDATE',
      changedBy: req.user?.id || 'anonymous',
      changedAt: new Date(),
      snapshot: JSON.stringify(data)
    })

  })

  /* DELETE */
  this.after('DELETE', 'SalaryRecords', async (data, req) => {

    await INSERT.into(AuditLogs).entries({
      entityName: 'SalaryRecords',
      entityID: req.data.ID,
      operation: 'DELETE',
      changedBy: req.user?.id || 'anonymous',
      changedAt: new Date(),
      snapshot: JSON.stringify(req.data)
    })

  })

})