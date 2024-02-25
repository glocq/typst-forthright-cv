#import "settings.typ": *


/*****************************************
 * Helper functions; to be hidden        *
 * once hiding becomes possible in Typst *
 *****************************************/

// Layout two texts side by side,
// aligned respectively left and right.
// Make sure that the right content is not too long,
// otherwise lines will wrap in a weird way.
// Optional arguments:
// alignment: set to `horizon` to have both pieces of content
//            centered vertically relative to each other
// gap: separate both pieces of content by a given distance

#let sideBySide(contentLeft, contentRight, alignment: auto, gap: 0pt) = {
  table(
    columns: (1fr, auto),
    inset: 0pt, // We remove any automatic spacing to provide our own
    gutter: gap,
    align: alignment,
    stroke: none, // comment this to see layout boxes!
    align(left, contentLeft), align(right, contentRight)
  )
}


/********************
 * Individual items *
 ********************/

#let name(first, last) = [
  #firstNameStyle(first)
  #lastNameStyle(last)
  #v(nameSpace, weak: true)
]

#let description(content) = [
  #descriptionStyle(content)
  #v(descriptionSpace, weak: true)
]

// This function takes both named and unnamed arguments.
// Named arguments appear first; if their name matches one of the predefined ones,
// It will get formatted accordingly (with an icon on the left, and/or a link).
// Otherwise, the argument will just appear as is.
// Unnamed arguments will appear after all named arguments, so if you want
// to enforce a specific order, you should name all your arguments,
// even if some names are arbitrary.

#let contactDetails(..arguments) = {

  let namedArgs   = arguments.named()
  let unnamedArgs = arguments.pos()
  let numArgs = namedArgs.len() + unnamedArgs.len()

  let counter = 0

  for (key, value) in namedArgs {
    if (key == "email") {
      detailsStyle([󰇮 #h(5pt) #link("mailto:" + value)[#value]])
    } else if (key == "github") {
      detailsStyle([󰊤 #h(5pt) #link("https://github.com/" + value)[#value]])
    } else if (key == "gitlab") {
      detailsStyle([󰮠 #h(5pt) #link("https://gitlab.com/" + value)[#value]])
    } else if (key == "homepage") {
      detailsStyle([󰖟 #h(5pt) #link("https://" + value)[#value]])
    } else if (key == "linkedin") {
      detailsStyle([#link("https://www.linkedin.com/in/" + value)[#value]])
    } else if (key == "location") {
      detailsStyle([󰍎 #h(5pt) #value])
    } else if (key == "phone") {
      detailsStyle([󰏲 #h(5pt) #value])
    } else {
      detailsStyle(value)
    }
    // Add some separating space, unless this was the last item
    counter = counter + 1
    if (counter != numArgs) {
      h(12pt)
    }
  }
  for value in unnamedArgs {
    detailsStyle(value)
    // Add some separating space, unless this was the last item
    counter = counter + 1
    if (counter != numArgs) {
      h(12pt)
    }
  }
  v(detailSpace)
}


#let sectionTitle(title) = {
  sectionStyle(title)
  h(4pt)
  box(width: 1fr, line(stroke: 0.9pt, length: 100%))
  v(interEntry, weak: true)
}

#let cvEntry(
  title,
  organisation,
  location,
  date,
  description,
  short: false // set to true for a slightly more visually compact result
) = {
  if(short) {
    sideBySide(
      titleStyle(title + ", ") +
      organisationStyle(organisation + ", ") +
      locationStyle(location),
      dateStyle(date)
    )
  } else {
    sideBySide(
      titleStyle(title),
      dateStyle(date)
    )
    v(interItem, weak: true)
    sideBySide(
      organisationStyle(organisation),
      locationStyle(location),
    )
  }
  v(interItem, weak: true)
  bodyStyle(description)
  v(interEntry, weak: true)
}

#let miscEntry(title, description) = {
  titleStyle(title)
  v(interItem, weak: true)
  bodyStyle(description)
  v(interEntry, weak: true)
}


/******************
 * General layout *
 ******************/

// `layout` takes the following arguments:
// header, phot, body, sidebar.
// `body` is mandatory, the rest are optional.
// If provided, `photo` should be a string, the path
// to the photo. An empty string will be interpreted
// as the absence of a photo.

#let layout(..args) = {

  // Define sections of the CV based on arguments, to avoid
  // having to call named() and at() every time.
  // Absence of an optional section is denoted by `none`

  let arguments = args.named()
  let body    = arguments.at("body",    default: none)
  let sidebar = arguments.at("sidebar", default: none)
  let header  = arguments.at("header",  default: none)
  let photo = if (arguments.at("photo", default: "") != "") {
    image(arguments.at("photo"), height: imageSize)
  } else {
    none
  }

  // Text appearance
  show link: set text(linkColor)
  set strong(delta: strongDelta)
  set par(leading: interLine)

  // We remove any automatic spacing to provide our own:
  show par: set block(above: 0pt, below: 0pt)

  // Layout setup
  set align(left)
  set page(
      paper: "a4",
      margin: (
          left:   pageMargin,
          right:  pageMargin,
          top:    pageMargin,
          bottom: pageMargin,
      ),
  )

  // Actual content layout.
  // The verbosity here comes from two places:
  // 1. My use of tables, which is probably not necessary,
  //    but I feel more confident that spacing will behave as I want
  //    with tables than with spaces...
  // 2. Case handling (presence/absence of various sections)

  let bodyAndSidebar = if (sidebar != none) {
    table(
      columns: (auto, sidebarSize),
      inset: 0pt, // We remove any automatic spacing to provide our own
      stroke: none, // comment this to see layout boxes!
      gutter: sidebarSpace,
      body,
      sidebar
    )
  } else {
    arguments.at("body", "")
  }

  let headerSection

  if (header != none) and (photo != none) {
    headerSection = sideBySide(
      header,
      photo,
      alignment: horizon,
      gap: photoSpace
    )
  } else if (header != none) {
    headerSection = arguments.named().at("header")
  } else if (photo != none) {
    headerSection = align(center, image(profilePhoto, height: 2.8cm))
  }

  if (headerSection != none) {
    table(
      columns: (auto),
      inset: 0pt, // We remove any automatic spacing to provide our own
      stroke: none, // comment this to see layout boxes!
      gutter: headerSpace,
      headerSection,
      bodyAndSidebar
    )
  } else {
    bodyAndSidebar
  }
}
