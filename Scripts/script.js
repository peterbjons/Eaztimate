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