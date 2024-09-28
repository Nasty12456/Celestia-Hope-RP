async function getAllModules() {
    return await $.post(`https://${resName}/getAllModules`);
}

function createDivForModule(moduleType, options) {
    const div = $(`
    <div class="d-flex align-items-center gap-3">
        <p class="text-center my-auto text-capitalize" style="width:auto">${moduleType}</p>
        
        <select class="module-options form-select w-25" data-select></select>	
    </div>
    `);

    const select = div.find(".module-options");

    select.data("moduleType", moduleType);

    options.forEach(name => {
        const option = $(`<option value="${name}">${name}</option>`);
        option.appendTo(select);
    });

    return div;
}

async function loadModulesSettings(modulesSettings) {
    const modulesDiv = $(".modules-dialog");
    modulesDiv.empty();

    const modules = await getAllModules();

    modules.forEach(module => {
        const div = createDivForModule(module.type, module.options);
        div.appendTo(modulesDiv);
    });

    // For each select, set the value to the value in modulesSettings
    modulesDiv.find(".module-options").each((index, select) => {
        const moduleType = $(select).data("moduleType");
        const moduleName = modulesSettings[moduleType];

        $(select).val(moduleName);
    });
}

function getModulesSettings() {
    const modulesSettings = {};

    $(".modules-dialog .module-options").each((index, select) => {
        const moduleType = $(select).data("moduleType");
        const moduleName = $(select).val();

        modulesSettings[moduleType] = moduleName;
    });

    return modulesSettings;
}