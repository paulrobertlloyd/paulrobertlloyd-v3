(function( window ){
    if( window.document.documentElement.className.indexOf( 'fonts-loaded' ) > -1 ){
        return;
    }
    var fontA = new window.FontFaceObserver( 'Charter ITC Std', {
        weight: 'normal',
        style: 'normal'
    });
    var fontB = new window.FontFaceObserver( 'Charter ITC Std', {
        weight: 'normal',
        style: 'italic'
    });
    window.Promise
        .all([fontA.check(), fontB.check()])
        .then(function(){
            window.document.documentElement.className += ' fonts-loaded';
            window.enhance&&window.enhance.cookie('fonts-loaded',!0,7);
        });
}( this ));
