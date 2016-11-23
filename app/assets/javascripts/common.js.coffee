$ ->
  $('#star-rating').raty
    path: '/assets/'
    scoreName: "hotel[rate_hotels_attributes][0][rating]"

  $('.star-rating').raty
    path: '/assets/'
    readOnly: true
    score: ->
      $(this).attr 'data-score'
  $(".show-hotel").on "click", ->
    window.location.reload();
  $(".rate-success").on "click", ->
    $("#js-rerating").modal("hide")
    alert "Rate Success"

