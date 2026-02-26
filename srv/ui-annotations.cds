using HRService    from './hr-service';
using AuditService from './audit-service';
using ComplianceAnalyticsService from './compliance-service';

annotate ComplianceAnalyticsService.ComplianceMetrics with @(

    UI.HeaderInfo : {
        TypeName       : 'Compliance Metric',
        TypeNamePlural : 'Compliance Metrics',
        Title          : { Value : ID }
    },

    UI.LineItem : [
        { $Type : 'UI.DataField', Value : totalEvents },
        { $Type : 'UI.DataField', Value : totalCreates },
        { $Type : 'UI.DataField', Value : totalUpdates },
        { $Type : 'UI.DataField', Value : totalDeletes },
        { $Type : 'UI.DataField', Value : dangerLevel }
    ],

    UI.Identification : [
        { $Type : 'UI.DataField', Label : 'Total Events',  Value : totalEvents },
        { $Type : 'UI.DataField', Label : 'Creates',       Value : totalCreates },
        { $Type : 'UI.DataField', Label : 'Updates',       Value : totalUpdates },
        { $Type : 'UI.DataField', Label : 'Deletes',       Value : totalDeletes },
        { $Type : 'UI.DataField', Label : 'Last Activity', Value : lastActivity }
    ]

);



/* =====================================================
   EMPLOYEES
===================================================== */

annotate HRService.Employees with @(

    UI.HeaderInfo : {
        TypeName       : 'Employee',
        TypeNamePlural : 'Employees',
        Title          : { Value : name },
        Description    : { Value : department }
    },

    /* ===== List Report Columns ===== */
    UI.LineItem : [
        { $Type : 'UI.DataField', Label : 'Employee ID', Value : employeeId },
        { $Type : 'UI.DataField', Label : 'Name',        Value : name },
        { $Type : 'UI.DataField', Label : 'Department',  Value : department }
    ],

    /* ===== Object Page Main Section ===== */
    UI.FieldGroup #General : {
        $Type : 'UI.FieldGroupType',
        Data : [
            { $Type : 'UI.DataField', Label : 'Employee ID', Value : employeeId },
            { $Type : 'UI.DataField', Label : 'Name',        Value : name },
            { $Type : 'UI.DataField', Label : 'Department',  Value : department }
        ]
    },

    UI.Identification : [
        { $Type : 'UI.DataField', Value : employeeId },
        { $Type : 'UI.DataField', Value : name }
    ],

    /* ===== Object Page Sections ===== */
    UI.Facets : [

        {
            $Type  : 'UI.ReferenceFacet',
            ID     : 'GeneralFacet',
            Label  : 'General Information',
            Target : '@UI.FieldGroup#General'
        },

        {
            $Type  : 'UI.ReferenceFacet',
            ID     : 'SalaryFacet',
            Label  : 'Salary Records',
            Target : 'salaries/@UI.LineItem'
        }

    ]

);



/* =====================================================
   SALARY RECORDS
===================================================== */

annotate HRService.SalaryRecords with @(

    UI.HeaderInfo : {
        TypeName       : 'Salary Record',
        TypeNamePlural : 'Salary Records',
        Title          : { Value : amount },
        Description    : { Value : currency }
    },

    /* ===== List inside Employee Object Page ===== */
    UI.LineItem : [
        { $Type : 'UI.DataField', Label : 'Amount',         Value : amount },
        { $Type : 'UI.DataField', Label : 'Currency',       Value : currency },
        { $Type : 'UI.DataField', Label : 'Effective From', Value : effectiveFrom }
    ],

    /* ===== Salary Object Page ===== */
    UI.FieldGroup #SalaryDetails : {
        $Type : 'UI.FieldGroupType',
        Data : [
            { $Type : 'UI.DataField', Label : 'Amount',         Value : amount },
            { $Type : 'UI.DataField', Label : 'Currency',       Value : currency },
            { $Type : 'UI.DataField', Label : 'Effective From', Value : effectiveFrom }
        ]
    },

    UI.Identification : [
        { $Type : 'UI.DataField', Value : amount },
        { $Type : 'UI.DataField', Value : currency }
    ],

    UI.Facets : [
        {
            $Type  : 'UI.ReferenceFacet',
            ID     : 'SalaryDetailsFacet',
            Label  : 'Salary Details',
            Target : '@UI.FieldGroup#SalaryDetails'
        }
    ]

);



/* =====================================================
   AUDIT LOGS
===================================================== */

annotate AuditService.AuditLogs with @(

    UI.HeaderInfo : {
        TypeName       : 'Audit Log',
        TypeNamePlural : 'Audit Logs',
        Title          : { Value : entityName },
        Description    : { Value : operation }
    },

    /* ===== Audit List Report ===== */
    UI.LineItem : [
        { $Type : 'UI.DataField', Label : 'Changed At',  Value : changedAt },
        { $Type : 'UI.DataField', Label : 'Changed By',  Value : changedBy },
        { $Type : 'UI.DataField', Label : 'Entity',      Value : entityName },
        { $Type : 'UI.DataField', Label : 'Entity ID',   Value : entityID },
        { $Type : 'UI.DataField', Label : 'Operation',   Value : operation }
    ],

    /* ===== Audit Object Page ===== */
    UI.FieldGroup #AuditDetails : {
        $Type : 'UI.FieldGroupType',
        Data : [
            { $Type : 'UI.DataField', Label : 'Entity Name', Value : entityName },
            { $Type : 'UI.DataField', Label : 'Entity ID',   Value : entityID },
            { $Type : 'UI.DataField', Label : 'Operation',   Value : operation },
            { $Type : 'UI.DataField', Label : 'Changed By',  Value : changedBy },
            { $Type : 'UI.DataField', Label : 'Changed At',  Value : changedAt },
            { $Type : 'UI.DataField', Label : 'Snapshot',    Value : snapshot }
        ]
    },

    UI.Facets : [
        {
            $Type  : 'UI.ReferenceFacet',
            ID     : 'AuditDetailsFacet',
            Label  : 'Audit Details',
            Target : '@UI.FieldGroup#AuditDetails'
        }
    ]

);