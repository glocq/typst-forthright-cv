#import "template.typ": name, description, contactDetails, sectionTitle, cvEntry, miscEntry, layout

#let header = [

  #name([Jane], [Doedenaj])

  #description("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod")

  #contactDetails(
    phone:    "+123 456 789",
    email:    "jane@doe.com",
    github:   "janedoe",
    homepage: "janedoe.com",
    location: "Doe City"
  )
]

#let body = [

  #sectionTitle([Experience])

  #cvEntry(
    [Chief Executive Officer],
    [Doe International],
    [Doe City],
    [Jan. 2050 -- Dec. 2099],
    [This is a standard entry, feel free to make bullet lists by prefixing your paragraphs with dashes:
    - You can also make text *stronger* or _oblique_
    - Links are detected automatically https://www.wikipedia.org/ but you can also make #link("https://www.wikipedia.org/")[named links].]
  )

  #cvEntry(
    [Lorem Ipsum],
    [Dolor sit amet, Consectetur],
    [Earth],
    [2000 -- 2049],
    [- Lorem ipsum dolor sit amet, *consectetur* adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna *aliqua*.
    - Ut enim ad minim *veniam*, quis nostrud *exercitation* ullamco laboris nisi ut *aliquip* ex ea #link("https://www.wikipedia.org/")[commodo] consequat. Duis aute irure dolor ]
  )

  #cvEntry(short: true,
    [Short Entry],
    [Some Organisation],
    [Earth],
    [1950 -- 1999],
    [- Here all the info above appears on one compact line]
  )

  #cvEntry(
    [Lorem Ipsum],
    [Dolor sit amet, Consectetur],
    [Earth],
    [2000 -- 2049],
    [- Lorem ipsum dolor sit amet, *consectetur* adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna *aliqua*.]
  )


#sectionTitle([Education])

  #cvEntry(short: true,
    [Degree],
    [Bigbrain University],
    [Braintown],
    [1949],
    [Lorem ipsum dolor sit amet, *consectetur* incididunt ut labore et dolore magna *aliquip* ex ea #link("https://www.wikipedia.org/")[commodo] consequat, duis dolor.]
  )

  #cvEntry(short: true,
    [Degree],
    [Bigbrain University],
    [Braintown],
    [1949],
    [Lorem ipsum dolor sit amet, *consectetur* incididunt ut labore et dolore magna *aliquip* ex ea #link("https://www.wikipedia.org/")[commodo] consequat, duis dolor.]
  )

  #cvEntry(short: true,
    [Another Degree],
    [Some Uni],
    [Some Place],
    [1948],
    [] // You can also leave the description empty
  )

  #cvEntry(short: true,
    [Degree],
    [Bigbrain University],
    [Braintown],
    [1949],
    [Lorem ipsum dolor sit amet, *consectetur* incididunt ut labore et dolore magna *aliquip* ex ea #link("https://www.wikipedia.org/")[commodo] consequat, duis dolor.]
  )
]

#let sidebar = [
  #sectionTitle([Skills])

  #miscEntry(
    [Languages],
    [- *Klingon* : Native
     - *Sumerian* : Fluent
     - *English* : Basic proficiency]
  )

  #miscEntry(
    [Programming Languages],
    [Brain\*\*\*k, Assembly, Scratch]
  )

  #sectionTitle([Personal Projects])

  #miscEntry(
    [Rocket Ship Building],
    [Just building a couple rocket ships in my backyard when I have free time]
  )

  #miscEntry(
    [Nuclear Plant Building],
    [Just building a couple nuclear plant in my backyard when I have free time]
  )

  #miscEntry(
    [Archaeological Space Exploration],
    [Going to see what ancient civilizations were up to in our star system]
  )
]

#layout(
  header:  header,
  photo:   "images/photo.png",
  body:    body,
  sidebar: sidebar
)
