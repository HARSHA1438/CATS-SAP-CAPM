sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'hr.enterprise.hrapp',
            componentId: 'SalaryRecordsObjectPage',
            contextPath: '/Employees/salaries'
        },
        CustomPageDefinitions
    );
});