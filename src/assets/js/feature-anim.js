/**
 * Created by Alpha on 2015-05-25.
 */
$(document).ready(function() {
    // interval is in seconds
    var interval = 5;

    // Cache all list items
    var $features = $("#features .feature");

    // Cache the first list item for later use
    var $firstItem = $features.first();

    // Give the first list item the active state
    $features.first().addClass("current");

    // Each 500 ms
    setInterval(function() {

        // Get the active list item
        var $activeItem = $(".current")

        // Remove its active state
        $activeItem.removeClass("current");

        // Try to find the next list item
        var $nextItem = $activeItem.closest('div.feature').next();

        // If the next list item (jQuery object) length property is 0
        // (this means that this list item was the last in the list)
        if ($nextItem.length == 0) {

            // The next list item is actually the first list item
            $nextItem = $firstItem;
        }

        $nextItem.addClass("current");
    }, interval*1000);
});
