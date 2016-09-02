(function() {
    "use strict";
    if (window.location && window.location.hash) {
        if (window.location.hash === '#_=_') {
            window.location.hash = '';
            return;
        }
        var facebookFubarLoginHash = RegExp('_\=_', 'g');
        window.location.hash = window.location.hash.replace(facebookFubarLoginHash,     '');
    }
}()); 
