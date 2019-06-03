// Fix focus issue when two modals are on the page
// see http://stackoverflow.com/questions/13649459/twitter-bootstrap-multiple-modal-error
// For Bootstrap 4 - For Bootstrap 4, replace :
// $.fn.modal.Constructor.prototype.**enforceFocus** By
// $.fn.modal.Constructor.prototype.**_enforceFocus**
$.fn.modal.Constructor.prototype._enforceFocus = function() {};
