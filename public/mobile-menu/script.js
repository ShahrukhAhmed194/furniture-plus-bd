
    var selectors = {
        body: 'body',
        sitenav: '#siteNav',
        navLinks: '#siteNav .lvl1 > a',
        menuToggle: '.js-mobile-nav-toggle',
        mobilenav: '.mobile-nav-wrapper',
        menuLinks: '#MobileNav .an',
        closemenu: '.closemobileMenu'
    };

    $(selectors.navLinks).each(function () {
        if ($(this).attr('href') == window.location.pathname)
            $(this).addClass('active');
    });

    $(selectors.menuToggle).on("click", function () {
        body: 'body',
                $(selectors.mobilenav).toggleClass("active");
        $(selectors.body).toggleClass("menuOn");
        $(selectors.menuToggle).toggleClass('mobile-nav--open mobile-nav--close');
    });

    $(selectors.closemenu).on("click", function () {
        body: 'body',
                $(selectors.mobilenav).toggleClass("active");
        $(selectors.body).toggleClass("menuOn");
        $(selectors.menuToggle).toggleClass('mobile-nav--open mobile-nav--close');
    });

    $("body").on('click', function (event) {
        var $target = $(event.target);
        if (!$target.parents().is(selectors.mobilenav) && !$target.parents().is(selectors.menuToggle) && !$target.is(selectors.menuToggle)) {
            $(selectors.mobilenav).removeClass("active");
            $(selectors.body).removeClass("menuOn");
            $(selectors.menuToggle).removeClass('mobile-nav--close').addClass('mobile-nav--open');
        }
    });

    $(selectors.menuLinks).on('click', function (e) {
        e.preventDefault();
        $(this).toggleClass('an-plus-l an-minus-l');
        $(this).parent().next().slideToggle();
    });