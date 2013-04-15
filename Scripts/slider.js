var promoPageClick = "";

$(document).ready(function () {
    AnimatePromoSlides(["spotlight1", "spotlight2", "spotlight3"], 1);

    //Promo pagers
    $("#promopager").attr("animactive", "0");
    $("#promopager").children("div").hover(
              function () {
                  $(this).addClass("hover");
              },
              function () {
                  $(this).removeClass("hover");
              }
            );
});

function promoClick(page) {
    if ($("#promopager").attr("animactive") == "0") {
        promoPageClick = page;
    }
}

function AnimatePromoSlides(args, type) {
    // check for defaults
    var delay = 8000;
    // chain items with the .nextanim attribute
    var x;
    for (x = 0; x < args.length; x++) {
        $("#" + args[x]).attr("pager", "promopager" + (x + 1));
        if (x == 0)
            $("#promopager").append("<div class=\"selected\" id=\"promopager" + (x + 1) + "\" onClick=\"promoClick('" + args[x] + "')\"></div>");
        else
            $("#promopager").append("<div id=\"promopager" + (x + 1) + "\" onClick=\"promoClick('" + args[x] + "')\"></div>");
        $("#" + args[x]).attr("nextanim", args[(x + 1) % args.length]);
    }
    // start chain of animation!
    var e = 'swing';

    var o3 = { duration: 2500, easing: e };

    var waitCounter = 0;
    (function waitWithBreak() {
        setTimeout(function () {
            if (waitCounter++ == (delay / 100)) {
                setTimeout(AnimateSlidesWorker($("#" + args[0]), type, o3, delay, true), 1);
            } else {
                if (promoPageClick != "") {
                    setTimeout(AnimateSlidesWorker($("#" + args[0]), type, o3, delay, true), 1);
                } else {
                    waitWithBreak();
                }
            }
        }, 100);
    })();
}

function AnimateSlidesWorker(o, type, options, delay, repeat) {
    return function () {
        var o1 = { duration: options.duration, easing: options.easing, complete: function () { $("#promopager").attr("animactive", "0") } };
        var o2 = { duration: options.duration, easing: options.easing, complete: function () { $("#promopager").attr("animactive", "0") } };
        var o3 = { duration: options.duration, easing: options.easing, complete: function () { $("#promopager").attr("animactive", "0") } };
        if (promoPageClick != "") {
            var n = $("#" + promoPageClick);
            promoPageClick = "";
        } else {
            var n = $("#" + o.attr("nextanim"));
        }
        if (type == 1) {
            var effekt = 3;
            //var effekt = 2;
            // left
            switch (effekt) {
                case 1:
                    n.css("top", o.outerHeight());
                    n.css("left", 0);
                    n.show();
                    o.animate({ top: -o.outerHeight() }, o1);
                    n.animate({ top: 0 }, o2);
                    break;
                case 2:
                    n.css("top", 0);
                    n.css("left", o.outerWidth());
                    n.show();
                    n.animate({ left: 0 }, o2);
                    o.animate({ left: -o.outerWidth() }, o1);
                    break;
                case 3:
                    n.css("top", 0);
                    n.css("left", 0);
                    o.fadeOut(500);
                    setTimeout(function () {
                        n.fadeIn(500);
                        $("#promopager").attr("animactive", "0");
                    }, 50);
                    //o.effect("fade", {}, 500);
                    //n.fadeIn();
                    break;
            }
        }
        if (type == 2) {
            // left
            n.css("left", o.outerWidth());
            n.show();
            o.animate({ left: -o.outerWidth() }, o1);
            n.animate({ left: 0 }, o2);
        }
        if (type == 3) {
            //right
            n = $("#" + o.attr("prevanim"));
            n.css("left", -o.outerWidth());
            n.show();
            o.animate({ left: o.outerWidth() }, o1);
            n.animate({ left: 0 }, o2);
        }
        if (repeat == true) {
            $("#" + o.attr("pager")).removeClass("selected");
            $("#" + n.attr("pager")).addClass("selected");
            $("#promopager").attr("animactive", "1");
            var waitCounter = 0;
            (function waitWithBreak() {
                setTimeout(function () {
                    if (waitCounter++ == (delay / 100)) {
                        setTimeout(AnimateSlidesWorker(n, type, o3, delay, true), 1);
                    } else {
                        if (promoPageClick != "") {
                            setTimeout(AnimateSlidesWorker(n, type, o3, delay, true), 1);
                        } else {
                            waitWithBreak();
                        }
                    }
                }, 100);
            })();
        }
    };
}