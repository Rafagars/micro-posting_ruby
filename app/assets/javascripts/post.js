$(document).on('turbolinks:load', function () {
    
    $(".spinner-border").hide(),

    $(".submit").on('click', function () {
        $(".spinner-border").show()
    })
})