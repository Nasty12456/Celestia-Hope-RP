async function getLicenses() {
	return await $.post(`https://${resName}/getAllLicenses`, JSON.stringify({}));
}

async function licensesDialog() {
    return new Promise(async (resolve, reject) => {
        const licenses = await getLicenses();
    
        let div = $(`
            <div class="modal fade" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" role="dialog" style="z-index: 1070; background: rgba(25, 25, 25, 0.7);">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">${getLocalizedText("dialog:licenses:title")}</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                        </div>
                        <div class="modal-body">
                            <div class="input-group">
                                <span class="input-group-text">${getLocalizedText("dialog:licenses:search_license")}</span>
                                <input type="text" class="form-control input-license-search" placeholder="${getLocalizedText("dialog:licenses:search_license_placeholder")}">
                            </div>
    
                            <ul class="list-group mt-2 licenses-list" style="overflow: auto; max-height: 70vh">
    
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        `);

        // delete the div when the modal is closed
        div.on("hidden.bs.modal", function() {
            div.remove();
        });

    
        for(let i=0; i<licenses.length; i++) {
            let license = licenses[i];
    
            let licenseDiv = $(`
                <li class="list-group-item list-group-item-action clickable" value=${license.type}>${license.label}</li>
            `);
    
            licenseDiv.click(function() {
                div.modal("hide");
                resolve(license.type);
            });
    
            div.find(".licenses-list").append(licenseDiv);
        }
    
        div.find(".btn-close").click(function() {
            div.modal("hide");
            resolve(null);
        });

        div.find(".input-license-search").on("keyup", function(e) {
            let text = $(this).val().toLowerCase();
        
            // if enter is pressed
            if (e.keyCode === 13) {
                resolve(text ? text : null);
                div.modal("hide");
            } else {
                div.find(".licenses-list li").filter(function() {
                    $(this).toggle($(this).text().toLowerCase().indexOf(text) > -1)
                });
            }
        })

        div.modal("show");
    });
}