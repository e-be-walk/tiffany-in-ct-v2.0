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

  $(document).on('click', ".show_window", function(e) {
    e.preventDefault()
    $('#app-container').html('')
    console.log($(this).attr('data-id'))
    let id = $(this).attr('data-id')
    fetch(`/sites/${this.site_id}/window/${id}.json`)
    .then(res => res.json())
    .then(windows => {
      let newWindows = new Window(windows)
      let windowHtml = newSite.formatShow()
      $('#app-container').append(windowHtml)
    })
  })

  $(document).on('click', '#show-windows-js', function(e) {
      e.preventDefault()
      console.log($(this).attr('data-id'))
      let id = $(this).attr('data-id')
      $.get(`/sites/${id}.json`, function(response){
        $('#app-container').html('')
        debugger
        response.windows.forEach(windows => {
          let newWindow = new Window(windows)
          let windowHtml = newWindow.formatIndex()
          $('#app-container').append(windowHtml)
        })
      })
      //fetch(`/sites/${id}.json`)
      //.then(res => res.json())
      //.then(windows => {
      //  $('#app-container').html('')
      //    let newWindow = new Window(windows)
      //    let windowHtml = newWindow.formatIndex()
      //    $('#siteWindows').append(windowHtml)
      //})
    })
}

//  const siteWindows = () => {
//    let id = $(this).attr('data-id')
//    debugger
//    fetch(`/sites/${id}.json`)
//    .then(res => res.json())
//    .then(windows => {
//        let newWindow = new Window(windows)
//        let windowHtml = newWindow.formatWindows()
//        $('#siteWindows').append(windowHtml)
//    })
//  }

  const getWindows = () => {
    //debugger
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
