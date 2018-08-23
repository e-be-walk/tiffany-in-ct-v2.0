console.log('Hello')
//$(function() {
//  bindClickHandlers()
//})

const bindClickHandlers = () => {
  $('.all_sites').on('click', e => {
    e.preventDefault()
    history.pushState(null, null, "sites")
    getSites()
  })

  $(document).on('click', ".show_link", function(e) {
    e.preventDefault()
    $('#app-container').html('')
    let id = $(this).attr('data-id')
    fetch(`/sites/#{id}.json`)
    .then(res => res.json())
    .then(sites => {
      let newSite = new Site(site)
      let siteHtml = newSite.formatShow()
      $('#app-container').append(siteHtml)
    })
  })

  //$(document).on('click', 'next-post')
}

  const getSites = () => {
    fetch(`/sites.json`)
    .then(res => res.json())
    .then(sites => {
      $('#app-container').html('')
      sites.forEach(site => {
        let newSite = new Site(site)
        let siteHtml = newSite.formatShow()
        $('#app-container').append(siteHtml)
      })
    })
}

function Site(site) {
  this.id = site.id
  this.name = site.name
  this.street_address = site.street_address
  this.city = site.city
}

//Site.protoype.formatIndex = function() {
//  let siteHtml = `
//    <a href="/sites/${this.id}" data-id="${this.id}" class="show_link"><h1>${this.name}</h1></a>
//    <h2>${this.street_address}</h2>
//    <h2>${this.city}</h2>
//  `
//  return siteHtml
//}
