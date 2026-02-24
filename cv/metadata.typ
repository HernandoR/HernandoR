/* Personal Information */

// Optional variant for modules folder suffix.
// INFO: value must match folder suffix; i.e. "SinglePage" -> "./modules_SinglePage"
#let varVersion = "" 

// Language is injected from CLI: --input lang=en|zh
// Fallback order: lang -> Language -> "en"
#let _cliLanguage = sys.inputs.at("lang", default: sys.inputs.at("Language", default: ""))
#let varLanguage = if _cliLanguage == "" { "en" } else { _cliLanguage }

#let firstName = "Zhen"
#let lastName = "Liu"
#let personalInfo = (
  github: "HernandoR",
  phone: "+86 15671190677",
  email: "zliu046@e.ntu.edu.sg",
  linkedin: "liuzhen23",
  //gitlab: "mintyfrankie",
  //homepage: "jd.me.org",
  //orcid: "0000-0000-0000-0000",
  //researchgate: "John-Doe",
  //extraInfo: "",
)
#let headerQuoteInternational = (
  "": [自动驾驶: 感知算法工程师],
  "en": [Autonomous Driving: Perception Algorithm Engineer],
  "zh": [自动驾驶: 感知算法工程师]
)

#let nonLatinOverwriteInfo = (
  // "customFont": "FangSong_GB2312",
  "customFont": "Noto Sans CJK SC",
  "firstName": "刘朕",
  "lastName": "",
  // submit an issue if you think other variables should be in this array
)

/* Layout Setting */

// Optional: skyblue, red, nephritis, concrete, darknight
#let awesomeColor = "skyblue"

// Leave blank if profil photo is not needed
#let profilePhoto = "./src/avatar.png" 


// Decide if you want to put your company in bold or your position in bold
#let varEntrySocietyFirst = false 

// Decide if you want to display organisation logo or not
#let varDisplayLogo = true

// for cvFooter and letterFooter arrays, add your own languages while the keys must match the varLanguage variable
#let cvFooterInternational = (
  "": "Latest CV will be updated at https://github.com/HernandoR/HernandoR/releases/download/latest/CV-en.pdf",
  "en": "Latest CV will be updated at https://github.com/HernandoR/HernandoR/releases/download/latest/CV-en.pdf",
  "fr": "",
  "zh": "最新简历将更新在 https://github.com/HernandoR/HernandoR/releases/download/latest/CV-zh.pdf"
)

#let letterFooterInternational = (
  "": "Cover Letter",
  "en": "Cover Letter",
  "fr": "Lettre de motivation",
  "zh": "求职信"
)
