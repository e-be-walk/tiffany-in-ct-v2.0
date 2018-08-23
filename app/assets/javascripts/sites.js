//the following code was retrieved from video session of fetch.
//I can't get it working within my app and I'm not clear why.
//error message: Uncaught ReferenceError: $ is not defined
//    at sites.self-0bda32ffa035431a152f20be9ea74bd2b753789d6aa15c7f0e093cbeecabe79c.js?body=1:1
//when this is resolved it gives error messages for my prototype method.

//$(() => {
//  bindClickHandlers()
//})


//function bindClickHandlers() {
//  $('.all_sites').on('click', function(e) {
//    e.preventDefault()
//    history.pushState(null, null, "sites")
//    getSites()
//  })

//  $(document).on('click', ".show_link", function(e) {
//    e.preventDefault()
//    $('#app-container').html('')
//    let id = $(this).attr('data-id')
//    fetch(`/sites/#{id}.json`)
//    .then(res => res.json())
//    .then(sites => {
//      let newSite = new Site(site)
//      let siteHtml = newSite.formatShow()
//      $('#app-container').append(siteHtml)
//    })
//  })

  //$(document).on('click', 'next-post')
//}

//  const getSites = () => {
//    fetch(`/sites.json`)
//    .then(res => res.json())
//    .then(sites => {
//      $('#app-container').html('')
//      sites.forEach(site => {
//        let newSite = new Site(site)
//        console.log(site)
//        let siteHtml = newSite.formatIndex()
//        $('#app-container').append(siteHtml)
//      })
//    })
//}

//function Site(site) {
//  this.id = site.id
//  this.name = site.name
//  this.street_address = site.street_address
//  this.city = site.city
//}

//Site.protoype.formatIndex = function() {
//  let siteHtml = `
//    <a href="/sites/${this.id}" data-id="${this.id}" class="show_link"><h1>${this.name}</h1></a>
//  `
//  return siteHtml
//}
