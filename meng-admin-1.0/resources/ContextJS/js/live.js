$(document).ready(function () {

    context.init({preventDoubleContext: false});

    /*context.attach('.inline-menu', [
        {header: 'Options'},
        {text: 'Open', href: '#'},
        {text: 'Open in new Window', href: '#'},
        {divider: true},
        {text: 'Copy', href: '#'},
        {text: 'Dafuq!?', href: '#'}
    ]);*/


    context.settings({compress: true});

    /*context.attach('html', [
        {header: 'Compressed Menu'},
        {text: 'Back', href: '#'},
        {text: 'Reload', href: '#'},
        {divider: true},
        {text: 'Save As', href: '#'},
        {text: 'Print', href: '#'},
        {text: 'View Page Source', href: '#'},
        {text: 'View Page Info', href: '#'},
        {divider: true},
        {text: 'Inspect Element', href: '#'},
        {divider: true},
        {text: 'Disable This Menu', action: function(e){
            e.preventDefault();
            context.destroy('html');
            alert('html contextual menu destroyed!');
        }},
        {text: 'Donate?', action: function(e){
            e.preventDefault();
            $('#donate').submit();
        }}
    ]);*/


    $(document).on('mouseover', '.me-codesta', function () {
        $('.finale h1:first').css({opacity: 0});
        $('.finale h1:last').css({opacity: 1});
    });

    $(document).on('mouseout', '.me-codesta', function () {
        $('.finale h1:last').css({opacity: 0});
        $('.finale h1:first').css({opacity: 1});
    });

});