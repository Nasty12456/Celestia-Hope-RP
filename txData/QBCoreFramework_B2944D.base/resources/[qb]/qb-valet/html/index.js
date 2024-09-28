$(function () {
    function display(bool) {
        if (bool) {
            $("#container").show();
        } else {
            $("#container").hide();
        }
    }

    display(false)

    window.addEventListener('message', function(event) {
        var item = event.data;
        if (item.type === "qbvalet") {
            if (item.status == true) {
                display(true)
            } else {
                display(false)
            }
        }
    })
    // if the person uses the escape key, it will exit the resource
    document.onkeyup = function (data) {
        if (data.which == 27) {
            $.post('https://qb-valet/exit', JSON.stringify({}));
            return
        }
    };
    $("#close").click(function () {
        $.post('https://qb-valet/exit', JSON.stringify({}));
        return
    })

    $("#end").click(function () {
        $.post('https://qb-valet/main', JSON.stringify({
            btn:'end'
        }));
        return
    })
    $("#slow").click(function () {
        $.post('https://qb-valet/main', JSON.stringify({
            btn:'slow'
        }));
        return
    })
    $("#fast").click(function () {
        $.post('https://qb-valet/main', JSON.stringify({
            btn:'fast'
        }));
        return
    })
    
})

