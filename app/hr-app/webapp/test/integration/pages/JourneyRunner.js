sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"hr/enterprise/hrapp/test/integration/pages/EmployeesList",
	"hr/enterprise/hrapp/test/integration/pages/EmployeesObjectPage",
	"hr/enterprise/hrapp/test/integration/pages/SalaryRecordsObjectPage"
], function (JourneyRunner, EmployeesList, EmployeesObjectPage, SalaryRecordsObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('hr/enterprise/hrapp') + '/test/flp.html#app-preview',
        pages: {
			onTheEmployeesList: EmployeesList,
			onTheEmployeesObjectPage: EmployeesObjectPage,
			onTheSalaryRecordsObjectPage: SalaryRecordsObjectPage
        },
        async: true
    });

    return runner;
});

