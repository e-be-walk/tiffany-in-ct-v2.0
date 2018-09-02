$(() => {
  windowClickHandlers()
})

function windowClickHandlers() {
  $('.all_windows').on('click', e => {
    e.preventDefault()
    //debugger
    history.pushState(null, null, null, null, "windows")
    getWindows()
  })

  $(document).on('click', '#show-windows-js', function(e) {
      e.preventDefault()
      console.log($(this).attr('data-id'))
      let id = $(this).attr('data-id')
      $.get(`/sites/${id}.json`, function(response){
        $('#siteWindows').html('')
        //debugger
        response.windows.forEach(windows => {
          let newWindow = new Window(windows)
          let windowHtml = newWindow.formatIndex()
          $('#app-container').append(windowHtml)
        })
      })
    })

    $(document).on('click', '#newWindow', function(e) {
        e.preventDefault()
        console.log($(this).attr('data-id'))
        let id = $(this).attr('data-id')
        $.get(`/sites/${id}.json`, function(response){
          $('#siteWindows').html('')
          //debugger
          response.windows.forEach(windows => {
            let newWindow = new Window(windows)
            let windowHtml = newWindow.formatIndex()
            $('#app-container').append(windowHtml)
          })
        })
      })

    const getWindows = () => {
      fetch(`/windows.json`)
      .then(res => res.json())
      .then(windows => {
        $('#app-container').html('')
        windows.forEach(windows => {
          let newWindow = new Window(windows)
          let windowHtml = newWindow.formatIndex()
          $('#app-container').append(windowHtml)
        })
      })
    }

}



function Window(windows) {
  this.id = windows.id
  this.image = windows.image
  this.site_id = windows.site_id
  this.name = windows.name
  this.year_created = windows.year_created
  this.dedication = windows.dedication
}

function newWindow(e){
  e.preventDefault()
  const path = this.action
  $.post(path, $(this).serialize(), function(data){
    showWindows(path)
  })
}

Window.prototype.formatIndex = function(){
  let windowHtml = `
    <div class="col-lg-4 col-sm-6 portfolio-item">
      <img class="card-img-top" src="${this.image}">
      <div class="card h-100">
        <a href="sites/${this.site_id}/windows/${this.id}" data-id="${this.id}" class="show_link"><h1>${this.name}</h1></a>
      </div>
    </div>
  `
  return windowHtml
}

Window.prototype.formatWindows = function(){
  let windowHtml = `
    <div class="col-lg-4 col-sm-6 portfolio-item">
      <img class="card-img-top" src="${this.image}">
      <div class="card h-100">
       <h1>${this.name}</h1>
    </div>
  `
  return windowHtml
}
