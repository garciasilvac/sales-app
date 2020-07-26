$("#chart-1").on("chartkick:before", function (e) {
    // customize options and data
    $("#chart-1").options.scales = {
        yAxes: [{
            ticks: {
                callback: function(value) {
                    var ranges = [
                        { divider: 1e6, suffix: 'M' },
                        { divider: 1e3, suffix: 'k' }
                    ];
                    function formatNumber(n) {
                        var i;
                        for (i = 0; i < ranges.length; i++) {
                            if (n >= ranges[i].divider) {
                            return (n / ranges[i].divider).toString() + ranges[i].suffix;
                            }
                        }
                        return n;
                    }
                    return '$' + formatNumber(value);
                }
            }
        }]
      }
      $("#chart-1").update();
});