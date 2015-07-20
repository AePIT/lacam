$(document).ready ->
  interval = 5
  $features = $ "#features .feature"
  $firstItem = $features.first()
  $features.first().addClass "current"
  setInterval ->
    $activeItem = $ ".current"
    $activeItem.removeClass "current"
    $nextItem = $activeItem.closest 'div.feature'
      .next()
    $nextItem = $firstItem if $nextItem.length is 0
    $nextItem.addClass "current"
  ,interval*1000