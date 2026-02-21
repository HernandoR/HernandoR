// brilliant-CV 2023-09-13 mintyfrankie
// Github Repo: https://github.com/mintyfrankie/brilliant-CV
// Typst version: 0.8.0

/* Packages */
#import "../metadata.typ": *
#import "@preview/fontawesome:0.6.0": *

/* font size */
#let TitleFontSize = 32pt

#let LargeFontSize = 16pt
// #let BigFontSize= 14pt
#let RegularFontSize = 12pt
#let SmallFontSize = 10pt
// #let TinyFontSize = 8pt

#let LargeGap = 6pt
#let RegularGap = 5pt
#let SmallGap = 4pt

#let TinyGap = 1pt

/* Language-specific Macros */
#let nonLatinOverwrite = false
#let nonLatinFont = ""
#let nonLatinLanguageCode = ("zh", "ja", "ko", "ru")
#for lang in nonLatinLanguageCode {
  if varLanguage == lang {
    nonLatinOverwrite = true
    firstName = nonLatinOverwriteInfo.at("firstName")
    lastName = nonLatinOverwriteInfo.at("lastName")
    nonLatinFont = nonLatinOverwriteInfo.at("customFont")
  }
}


/* Utility Functions */
#let hBar() = [
  #h(RegularGap) | #h(RegularGap)
]

#let autoImport(file) = {
  if varVersion == "" {
    include {"../modules/" + file + ".typ"}
  }
  else {
    include {"../modules_" + varVersion + "/" + file + ".typ"}
  }
}



#let languageSwitch(dict) = {
  let langValue = dict.at(varLanguage, default: none)
  if langValue != none {
    return langValue
  }

  let englishValue = dict.at("en", default: none)
  if englishValue != none {
    return englishValue
  }

  let neutralValue = dict.at("", default: none)
  if neutralValue != none {
    return neutralValue
  }

  panic("i18n: language key missing (expected varLanguage / en / empty)")
}

#let i18nSW(dict) = {
  let res = (:)
  // work on the cv entry wide
  for (k, v) in dict {
    if type(v) != dictionary {
      // single language value i.e. icon path
      res.insert(k,v)
    }
    else {
      // multiple language values i.e. cv entry
      res.insert(k, languageSwitch(v))
    }
  }
  return res
}
/* Styles */
#let bodyFontList = if nonLatinFont == "" {
  ("Noto Sans CJK SC", "Font Awesome 7 Brands", "Font Awesome 7 Free")
} else {
  ("Noto Sans CJK SC", nonLatinFont, "Font Awesome 7 Brands", "Font Awesome 7 Free")
}

#let titleFontList = if nonLatinFont == "" {
  ("Noto Sans CJK SC")
} else {
  ("Noto Sans CJK SC", nonLatinFont)
}

#let codeFont = ("FiraCode Nerd Font Mono")

#let awesomeColors = (
  skyblue: rgb("#0395DE"),
  red: rgb("#DC3522"),
  nephritis: rgb("#27AE60"),
  concrete: rgb("#95A5A6"),
  darknight: rgb("#131A28"),
)

#let regularColors = (
  lightgray: rgb("#343a40"),
  darkgray: rgb("#212529"),
)

#let accentColor = awesomeColors.at(awesomeColor)

#let beforeSectionSkip = TinyGap
#let beforeEntrySkip = TinyGap
#let beforeEntryDescriptionSkip = TinyGap

#let cvHighlight(str) = {text(
  weight: "bold",
  fill: accentColor,
  str
)}

#let headerFirstNameStyle(str) = {text(
  font: titleFontList,
  size: TitleFontSize,
  weight: "light",
  fill: regularColors.darkgray,
  str
)}

#let headerLastNameStyle(str) = {text(
  font: titleFontList,
  size: TitleFontSize,
  weight: "bold",
  str
)}

#let headerInfoStyle(str) = {text(
  size: RegularFontSize,
  fill: accentColor,
  str
)}

#let headerQuoteStyle(str) = {text(
  size: RegularFontSize,
  weight: "medium",
  style: "italic",
  fill: accentColor,
  str
)}

#let sectionTitleStyle(str, color:black) = {text(
  size: LargeFontSize, 
  weight: "bold", 
  fill: color,
  str
)}

#let entryA1Style(str) = {text(
  size: RegularFontSize,
  weight: "bold",
  str
)}


#let entryA2Style(str) = {align(right, text(
  weight: "medium",
  fill: accentColor,
  style: "oblique",
  str
))}

#let entryB1Style(str) = {text(
  size: SmallFontSize,
  fill: accentColor,
  weight: "medium",
  smallcaps(str)
)}

#let entryB2Style(str) = {align(right, text(
  size: SmallFontSize,
  weight: "medium",
  fill: gray,
  style: "oblique",
  str
))}

#let entryDescriptionStyle(str) = {text(
  fill: regularColors.lightgray,
  {
    v(beforeEntryDescriptionSkip)
    str
  }
)}

#let skillTypeStyle(str) = {align(right, text(
  size: RegularFontSize,
  weight: "bold",
  str))
}

#let skillInfoStyle(str) = {text(
  str
)}

#let honorDateStyle(str) = {align(right, text(
  str))
}

#let honorTitleStyle(str) = {text(
  // weight: "bold",
  str
)}

#let honorIssuerStyle(str) = {text(
  str
)}

#let honorLocationStyle(str) = {align(right, text(
  weight: "medium",
  fill: accentColor,
  style: "oblique",
  str
))}

#let publicationStyle(str) = {text(
  str
)}

#let footerStyle(str) = {text(
  size: SmallFontSize,
  fill: rgb("#999999"),
  smallcaps(str)
)}

#let letterHeaderNameStyle(str) = {text(
  fill: accentColor,
  weight: "bold",
  str
)}

#let letterHeaderAddressStyle(str) = {text(
  fill: gray,
  size: 0.9em,
  smallcaps(str)
)}

#let letterDateStyle(str) = {text(
  size: 0.9em,
  style: "italic",
  str
)}

#let letterSubjectStyle(str) = {text(
  fill: accentColor,
  weight: "bold",
  underline(str)
)}


/* Functions */
#let cvHeader(
  align: left,
  hasPhoto: true
) = {
  let makeHeaderInfo() = {
    let personalInfoIcons = (
      phone: fa-phone(),
      email: fa-envelope(),
      linkedin: fa-linkedin(),
      homepage: fa-pager(),
      github: fa-square-github(),
      gitlab: fa-gitlab(),
      orcid: fa-orcid(),
      researchgate: fa-researchgate(),
      extraInfo: "",
    )
    let n = 1
    for (k, v) in personalInfo {
      if v != "" {
        // Adds hBar
        if n != 1 {
          hBar()
        }
        // Adds icons
        personalInfoIcons.at(k) + h(RegularGap)
        // Adds hyperlinks
        if k == "email" {
          link("mailto:" + v)[#v]
        } else if k == "linkedin" {
          link("https://www.linkedin.com/in/" + v)[#v]
        } else if k == "github" {
          link("https://github.com/" + v)[#v]
        } else if k == "gitlab" {
          link("https://gitlab.com/" + v)[#v]
        } else if k == "homepage" {
          link("https://" + v)[#v]
        } else if k == "orcid" {
          link("https://orcid.org/" + v)[#v]
        } else if k == "researchgate" {
          link("https://www.researchgate.net/profile/" + v)[#v]
        } else {
          v
        }
      }
      n = n + 1
    }
  }

  let makeHeaderNameSection() = table(
    columns: 1fr,
    inset: 0pt,
    stroke: none,
    row-gutter: 6mm,
    [#headerFirstNameStyle(firstName) #h(RegularGap) #headerLastNameStyle(lastName)],
    [#headerInfoStyle(makeHeaderInfo())],
    [#headerQuoteStyle(languageSwitch(headerQuoteInternational))]
  )


  let makeHeaderPhotoSection() = {
    if profilePhoto != "" {
      image(profilePhoto, height: 3.6cm)
    } else {
      v(3.6cm)
    }
  } 

  let makeHeader(leftComp, rightComp, columns, align) = table(
    columns: columns,
    inset: 0pt,
    stroke: none,
    column-gutter: 15pt,
    align: align + horizon,
    {leftComp},
    {rightComp}
  )

  if hasPhoto {
    makeHeader(makeHeaderNameSection(), makeHeaderPhotoSection(), (auto, 20%), align)
  } else {
    makeHeader(makeHeaderNameSection(), makeHeaderPhotoSection(), (auto, 0%), align)
  }
}

#let cvSection(title) = {
  let highlightText = title.slice(0,3)
  let normalText = title.slice(3)

  block(sticky: true)[
    #v(beforeSectionSkip)
    #if nonLatinOverwrite {
      sectionTitleStyle(title, color: accentColor)
    } else {
      sectionTitleStyle(highlightText, color: accentColor)
      sectionTitleStyle(normalText, color: black)
    }
    #h(2pt)
    #box(width: 1fr, line(stroke: 0.9pt, length: 100%))
  ]
}

#let cvEntry(
  title: "Title",
  society: "Society",
  date: "Date",
  location: "Location",
  description: "Description",
  logo: "",
  noPageBreak: false,
) = {
  let ifSocietyFirst(condition, field1, field2) = {
    return if condition {field1} else {field2}
  }
  let ifLogo(path, ifTrue, ifFalse) = {
    return if varDisplayLogo {
      if path == "" { ifFalse } else { ifTrue }
    } else { ifFalse }
  }
  let setLogoLength(path) = {
    return if path == "" { 0% } else { 4% }
  }
  let setLogoContent(path) = {
    return if logo == "" [] else {image(path, width: 100%)}
  }
  let entryContent = [
    #v(beforeEntrySkip)
    #table(
      columns: (ifLogo(logo, 4%, 0%), 1fr),
      inset: 0pt,
      stroke: none,
      align: horizon,
      column-gutter: ifLogo(logo, 4pt, 0pt),
      setLogoContent(logo),
      table(
        columns: (1fr, auto),
        inset: 0pt,
        stroke: none,
        row-gutter: LargeGap,
        align: auto,
        {entryA1Style(ifSocietyFirst(varEntrySocietyFirst, society, title))},
        {entryA2Style(date)},
        {entryB1Style(ifSocietyFirst(varEntrySocietyFirst, title, society))},
        {entryB2Style(location)},
      )
    )
    #entryDescriptionStyle(description)
  ]

  if noPageBreak {
    block(breakable: false)[
      #entryContent
    ]
  } else {
    entryContent
  }
}

#let cvSkill(
  type: "Type",
  info: "Info",
) = {
  table(
    columns: (16%, 1fr),
    inset: 0pt,
    column-gutter: RegularFontSize,
    stroke: none,
    skillTypeStyle(type),
    skillInfoStyle(info),
  )
  v(-LargeGap)
}

#let cvHonor(
  date: "1990",
  title: "Title",
  issuer: "",
  location: ""
) = {
  table(
    columns: (16%, 1fr,25%),
    inset: 0pt,
    column-gutter: RegularFontSize,
    // row-gutter: TinyGap,
    rows: RegularFontSize,
    align: horizon,
    stroke: none,
    honorDateStyle(date),
    honorTitleStyle(title),
    honorIssuerStyle(issuer)
    // [#honorIssuerStyle(issuer) #honorLocationStyle(location)],
    // if issuer == "" {
    //   honorTitleStyle(title)
    // } else [
    //   #honorTitleStyle(title), #honorIssuerStyle(issuer)
    // ],
    // honorLocationStyle(location)
  )
  v(-LargeGap)
}

#let cvPublication(
  bibPath: "",
  keyList: list(),
  refStyle: "apa",
) = {
  show cite: it => hide(it)
  show bibliography: it => publicationStyle(it)
  bibliography(bibPath, title: none, style: refStyle)
  for key in keyList {
    cite(key)
  }
  v(-15pt)
}

#let cvFooter() = {
  place(
    bottom,
    table(
      columns: (1fr, auto),
      inset: 0pt,
      stroke: none,
      footerStyle([#firstName #lastName]),
      footerStyle(languageSwitch(cvFooterInternational)),
    )
  )
}

#let letterHeader(
  myAddress: "Your Address Here",
  recipientName: "Company Name Here",
  recipientAddress: "Company Address Here",
  date: "Today's Date",
  subject: "Subject: Hey!"
) = {
  letterHeaderNameStyle(firstName + " " + lastName)
  v(TinyGap)
  letterHeaderAddressStyle(myAddress)
  v(TinyGap)
  align(right, letterHeaderNameStyle(recipientName))
  v(TinyGap)
  align(right, letterHeaderAddressStyle(recipientAddress))
  v(TinyGap)
  letterDateStyle(date)
  v(TinyGap)
  letterSubjectStyle(subject)
  linebreak(); linebreak()
}

#let letterSignature(path) = {
  linebreak()
  place(right, dx:-5%, dy:0%, image(path, width: 25%))
}

#let letterFooter() = {
  place(
    bottom,
    table(
      columns: (1fr, auto),
      inset: 0pt,
      stroke: none,
      footerStyle([#firstName #lastName]),
      footerStyle(languageSwitch(letterFooterInternational)),
    )
  )
}


/* Layout */
#let layout(doc) = {
  set text(
    font: bodyFontList,
    weight: "regular",
    size: RegularFontSize,
  )
  show raw: set text(font: codeFont)
  set align(left)
  set page(
    paper: "a4",
    margin: (
      left: 1.4cm,
      right: 1.4cm,
      top: .8cm,
      bottom: .4cm,
    ),
  )
  doc
}
