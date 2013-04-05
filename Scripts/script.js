function expandList(handle, content) {
    $(handle).click(function () {
        var speed = 200;
        var hide = ($(this).closest('li').find(content).css('display') != 'none');
        $(content).hide(speed);
        if (!hide) {
            $(this).closest('li').find(content).show(speed);
        } else {

        }
    });
}

function expandElement(handle, element) {
    $(handle).toggle(function () {
        $(element).animate({
            opacity: 0.25,
            height: 'toggle'
        }, 500, function () {
            // Animation complete.
            $(handle).text("Visa");
        });
    }, function () {
        $(element).animate({
            opacity: 1.0,
            height: 'toggle'
        }, 500, function () {
            // Animation complete.
            $(handle).text("Dölj");
        });
    });
}

function expandSort(handle, element) {
    handle.toggle(function () {
        $(element).animate({            
            height: 'toggle'
        }, 100, function () {
            // Animation complete.
            handle.find('div').removeClass('sort_closed').addClass('sort_down');   //hitta på bilddiven och byt klass till den öppnade
        });
    }, function () {
        $(element).animate({
            
            height: 'toggle'
        }, 100, function () {
            // Animation complete.
            handle.find('div').removeClass('sort_down').addClass('sort_closed');
        });
    });
}

