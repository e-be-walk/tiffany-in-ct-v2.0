$(() => {
  windowClickHandlers()
})

function windowClickHandlers() {
  $('.all_windows').on('click', e => {
    e.preventDefault()
    //debugger
    history.pushState(null, null, "windows")
    getWindows()
  })

  $('.sort-alphabetically').on('click', e => {
    e.preventDefault()
    getSortedWindows()
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

    $(document).on('submit', '#new_window', function(e) {
        e.preventDefault()
        console.log($(this).attr('data-id'))
        let id = $(this).attr('data-id');
        const values = $(this).serialize();
        //debugger
        $.post(`/sites/${id}/windows.json`, values).done(function(resp){
          //debugger
          let length = resp.windows.length
          let newWindow = resp.windows[length - 1]
          let windowObj = new Window(newWindow)
          let windowHtml = windowObj.formatSiteWindow()
          $('#app-container').append(windowHtml)
        })
        //console.log($(this).serialize())
      })


      const getSortedWindows = () => {
        fetch(`/windows.json`)
        //console.log(data)
        .then(res => res.json())
        .then(windows => {
          //console.log(windows)
          $('#app-container').html('')
          let sortedWindows = windows.sort(function (a, b){
            var nameA = a.name.toUpperCase();
            var nameB = b.name.toUpperCase();
            if (nameA < nameB) {
              return -1;
            }
            if (nameA > nameB) {
              return 1;
            }
            return 0;
          });
          sortedWindows.forEach(windows => {
            let newWindow = new Window(windows)
            let windowHtml = newWindow.formatIndex()
            $('#app-container').append(windowHtml)
          })
        })
      }

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


Window.prototype.formatIndex = function(){
  let windowHtml = `
    <div class="col-lg-4 col-sm-6 portfolio-item">
      <img class="card-img-top" src="${this.image}">
      <div class="card h-100">
        <a href="sites/${this.site_id}/windows/${this.id}" data-id="${this.id}" class="show_link"><h1>${this.name}</h1></a>
         <h2>${this.year_created}</h2>
          <p>${this.dedication}</p>
      </div>
    </div>
  `
  return windowHtml
}

Window.prototype.formatSiteWindow = function(){
  let windowHtml = `
    <div class="col-lg-4 col-sm-6 portfolio-item">
      <div class="card h-100">
        <a href="sites/${this.site_id}/windows/${this.id}" data-id="${this.id}" class="show_link"><h1>${this.name}</h1></a>
         <h2>${this.year_created}</h2>
          <p>${this.dedication}</p>
      </div>
    </div>
  `
  return windowHtml
}
