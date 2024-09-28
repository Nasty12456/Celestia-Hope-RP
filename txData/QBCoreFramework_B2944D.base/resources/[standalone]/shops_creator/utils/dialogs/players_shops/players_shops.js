function playersShopsDialog(oldShops) {
    return new Promise(async (resolve, reject) => {
        let div = $(`
        <div class="modal fade" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" role="dialog" style="z-index: 1070; background: rgba(25, 25, 25, 0.7);">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">${getLocalizedText("menu:shops_dialog:title")}</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>
                    <div class="modal-body">
    
                        <div class="d-flex align-items-center justify-content-center fs-3">
                            <input class="form-check-input me-2 my-auto requires-to-be-shop-employee-checkbox" type="checkbox">
                            <label class="form-check-label fw-bold mb-0">${getLocalizedText("menu:requires_to_be_shop_employee")}</label>
                        </div>
    
                        <hr class="my-3">

                        <div class="d-flex align-items-center justify-content-center fs-3">
                            <input class="form-check-input me-2 my-auto all-shops-employees-allowed-checkbox" type="checkbox">
                            <label class="form-check-label fw-bold mb-0">${getLocalizedText("menu:all_shops_allowed")}</label>
                        </div>

                        <hr class="my-3">
    
                        <div class="input-group">
                            <span class="input-group-text">${getLocalizedText("menu:shops_dialog:search_shop")}</span>
                            <input type="text" class="form-control input-players-shop-search">
                        </div>
    
                        <div class="mt-3 shops-list" style="max-height: 50vh; overflow-y: auto">
    
                        </div>
                    </div>
    
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">${getLocalizedText("menu:close")}</button>
                        <button type="button" class="btn btn-success input-players-shops-confirm-btn">${getLocalizedText("menu:confirm")}</button>
                    </div>    
                </div>
            </div>
        </div>
        `);
    
        // delete the div when the modal is closed
        div.on("hidden.bs.modal", function() {
            console.log("OKR")
            div.remove();
        });
    
        div.modal("show");
    
        div.find(".input-players-shop-search").val("");
        
        const playersShops = await $.post(`https://${resName}/getAllPlayersShops`, JSON.stringify({}));
    
        let playersShopsListDiv = div.find(".shops-list")
        playersShopsListDiv.empty();
    
        for(const[shopId, shopData] of Object.entries(playersShops)) {
            let shopDiv = $(`
            <div class="form-check fs-3 mb-2 ms-1">
                <input class="form-check-input" type="checkbox" data-shop-id="${shopId}">
                <label class="form-check-label fw-bold mb-0">${shopData.label}</label>
            </div>
            `);
    
            playersShopsListDiv.append(shopDiv);
        }
        
        // Unbinds the button and rebinds it to callback the selected playersShops
        div.find(".input-players-shops-confirm-btn").unbind().click(function() {

            const requiresToBeShopEmployee = div.find(".requires-to-be-shop-employee-checkbox").prop("checked");

            if(!requiresToBeShopEmployee) {
                resolve(false);
            } else {
                const allShopsAllowed = div.find(".all-shops-employees-allowed-checkbox").prop("checked");
    
                if(allShopsAllowed) {
                    resolve(true);
                } else {
                    let selectedShops = {};
            
                    playersShopsListDiv.find("input:checked").each(function() {        
                        let shopId = parseInt( $(this).data("shopId") );
                        selectedShops[shopId] = true;
                    });
        
                    resolve(selectedShops);
                }
            }
    
            div.modal("hide");
        });
    
        div.find(".input-players-shop-search").on("keyup", function() {
            let text = $(this).val().toLowerCase();
        
            div.find(".shops-list .form-check").filter(function() {
                $(this).toggle($(this).text().toLowerCase().indexOf(text) > -1)
            });
        });
    
        div.find(".all-shops-employees-allowed-checkbox").change(function() {
            let isChecked = $(this).prop("checked");
    
            if(isChecked) {
                div.find(".shops-list input").prop("checked", true).prop("disabled", true);
            } else {
                div.find(".shops-list input").prop("checked", false).prop("disabled", false);
            }
        });

        div.find(".requires-to-be-shop-employee-checkbox").change(function() {
            let isChecked = $(this).prop("checked");
    
            if(isChecked) {
                div.find("input").prop("checked", false).prop("disabled", false);
                $(this).prop("checked", true);
            } else {
                div.find("input").prop("checked", false).prop("disabled", true);
                $(this).prop("checked", false).prop("disabled", false);
            }
        });

        // Must be created after the div exists
        if(oldShops === false || oldShops === null || oldShops === undefined) { // If oldShops is false, it means it's not required to be a shop employee
            div.find(".requires-to-be-shop-employee-checkbox").prop("checked", false).change();
        } else {
            div.find(".requires-to-be-shop-employee-checkbox").prop("checked", true).change();

            if(oldShops === true) { // If oldShops is true, it means all shops are allowed
                div.find(".all-shops-employees-allowed-checkbox").prop("checked", true).change();
            } else if(oldShops) { // If oldShops is an object, it means only some shops are allowed
                let allowedShopsIds = Object.keys(oldShops);
    
                for(let i=0; i < allowedShopsIds.length; i++) {
                    let shopId = allowedShopsIds[i];
                    playersShopsListDiv.find(`[data-shop-id="${shopId}"]`).prop("checked", true).change();
                }
            }
        }
    });
}