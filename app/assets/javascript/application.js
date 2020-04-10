//= require jquery
//= require popper
//= require bootstrap

function showMyModal(event, photo_url) {

   //TODO event-model raz a potem szukanie w childrenahc -> chyba metoda find

    $('#event-modal #modal-title').html(event.title);
    $('#event-modal #modal-type').html(event.type);
    $('#event-modal #modal-type').addClass(event.type);
    $('#event-modal #modal-date').html("<i class=\"far fa-calendar-alt\"></i>" + event.date);
    $('#event-modal #modal-location').html("<i class=\"fas fa-map-marker-alt\"></i>" + event.location);
    $('#event-modal #modal-description').html(event.description);
    $('#event-modal #modal-photo').attr("style", 'background: url('+ photo_url +') no-repeat center center / cover;');
    $('#event-modal').modal('show');
}
