$(() => {
  windowClickHandlers()
})

function windowClickHandlers() {
  $('.all_windows').on('click', e => {
    e.preventDefault()
    //debugger
    history.pushState(null, null, null, "windows")
    getWindows()
  })

}

  const getWindows = () => {
    //debugger
    fetch(`/windows.json`)
    .then(res => res.json())
    .then(windows => {
      $('#app-containter').html('')
      windows.forEach(windows => {
        let newWindow = new Window(windows)
        let windowHtml = newWindow.formatIndex()
        $('#app-container').append(windowHtml)
      })
    })
  }


function Window(windows) {
  this.id = windows.id
  this.image = windows.image
  this.site_id = windows.site_id
  this.name = windows.name
  this.year_created = windows.year_created
  this.dedication = windows.dedication
}

Window.prototype.formatIndex = function(){
  let windowHtml = `
    <div class="col-md-3">
      <img class="card-img-top" src="${this.image}">
      <a href="sites/${this.site_id}/windows/${this.id}" data-id="${this.id}" class="show_link"><h1>${this.name}</h1></a>
    </div>
  `
  return windowHtml
}
