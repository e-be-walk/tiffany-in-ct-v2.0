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
    //debugger
    history.pushState(null, null, "sites")
    getSites()
  })

  $(document).on('click', ".show_link", function(e) {
    e.preventDefault()
    $('#app-container').html('')
    //console.log($(this).attr('data-id'))
    let id = $(this).attr('data-id')
    fetch(`/sites/${id}.json`)
    .then(res => res.json())
    .then(site => {
      let newSite = new Site(site)
      let siteHtml = newSite.formatShow()
      $('#app-container').append(siteHtml)
    })
  })

  //Button is not working correctly right now- console is returning an error
  //due to lack of a window serializer- maybe this would be worth coming back to
  //after implementing window serializer to display your has_many relationship.
  //screen shot of error on 8/24 @9:12
  $(document).on('click', '.next-site', function() {
    console.log($(this).attr('data-id'))
    let id = $(this).attr('data-id')
    //let nextId = id++
    //this returns N a N
    //console.log(nextId)
    fetch(`sites/${id}/next`)
    //  .then(res => res.json())
    //  .then(sites => {
    //    let nextSite = new Site(site)
    //    let siteHtml = nextSite.formatShow()
    //    $('#app-container').append(siteHtml)
    //  })
  })
}

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

Site.prototype.formatShow = function(){
  let siteHtml = `
    <h1>${this.name}</h1>
    <h3>${this.street_address}</h3>
    <h3>${this.city}</h3>
    <button class="next-site" data-id="${this.id}">Next Site</button>
  `
  return siteHtml
}
