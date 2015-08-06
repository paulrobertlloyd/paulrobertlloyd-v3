(function (root, factory) {
    'use strict';

    root.DateFormatter = factory();
}(this, function () {
    'use strict';

    var months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
    var DateFormatter = function (date) {
        this.date = date;
        this.dateObj = new Date(this.normalizeDateString());
    };

    DateFormatter.prototype = {
        normalizeDateString: function () {
            return this.date.replace(/[+|-]\d{2}:\d{2}$/, '').replace(/-/g, '/').replace('T', ' ').replace(/\.\d{3}Z$/, '');
        },

        toFormattedString: function () {
            // Derived from http://stackoverflow.com/a/8888498
            var strtime = '';
            var dateObj = this.dateObj;
            var hours = dateObj.getHours();
            var minutes = dateObj.getMinutes();
            var meridian = hours < 12 ? 'am' : 'pm';

            hours = hours % 12;
            hours = hours ? hours : 12;

            strtime += dateObj.getDate() + ' ';
            strtime += months[dateObj.getMonth()] + ' ';
            strtime += dateObj.getFullYear() + ' at ';
            strtime += hours + ':' + (minutes < 10 ? '0' + minutes : minutes) + ' ' + meridian + ' <abbr title="Coordinated Universal Time">UTC</abbr>';

            return strtime;
        },

        toIso8601: function () {
            return this.date.replace(/\.\d{3}Z$/, '+00:00');
        }
    };

    return DateFormatter;
}));
