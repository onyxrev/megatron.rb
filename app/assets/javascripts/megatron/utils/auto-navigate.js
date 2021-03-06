var bean = require('bean')

require('compose-tap-event')

var AutoNavigate = {
  listen: function autoNavigateListen(){
    bean.on(document, "click", ".auto-navigate", AutoNavigate.trigger)
  },

  trigger: function autoNavigateTrigger(event) {
    var target = event.target
    if (target.tagName.toLowerCase() != 'a') {
      var link = event.currentTarget.querySelector('a.navigate')
      if (event.metaKey) {
        window.open(link)
      } else {
        bean.fire(link, 'click')
      }
    }
  }
}

module.exports = AutoNavigate
