

$(() => {
  bindClickHandlers()
})

//function attachListeners(){
//  $("#all_sites").click(bindClickHandlers)
//}

//$(function(){
//  attachListeners()
//})

function bindClickHandlers() {
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

//  $(document).on('click', 'next-site', function() {
//    let id = $(this).attr('data-id')
//    fetch(`posts/${id}/next`)
//  })
//}

  const getSites = () => {
    fetch(`/sites.json`)
    .then(res => res.json())
    .then(sites => {
      $('#app-container').html('')
      sites.forEach(site => {
        let newSite = new Site(site)
        //console.log('WTF')
        //debugger shows that site info follows through til here but the siteHtml
        //which is supposed to be rendered by the formatIndex is undefined.
        let siteHtml = newSite.formatIndex()
        $('#app-container').append(siteHtml)
      })
    })
}

function Site(site){
  this.id = site.id
  this.name = site.name
  this.street_address = site.street_address
  this.city = site.city
}

Site.prototype.formatIndex = function(){
  let siteHtml = `
  <a href="/sites/${this.id}" data-id="${this.id}" class="show_link"><h1>${this.name}</h1></a>
  `
  return siteHtml
}
